CREATE PROCEDURE [dbo].[GetVentasServiciosByRowVersion]
(
   @startRow BIGINT,
   @endRow BIGINT
)
AS
BEGIN
SELECT
    b.id_billete,
    sd.id_servicio,
    -- Convertir FechaBillete a formato INT YYYYMMDD
    CONVERT(INT, FORMAT(b.fecha, 'yyyyMMdd')) AS DateKey_billete, 
    sd.id_ruta,
    sd.id_autobus,
    sd.id_conductor,
    -- Cálculo de la diferencia en minutos entre la hora de salida y la hora de llegada
    DATEDIFF(MINUTE, MIN(sd.hora_salida), MIN(sd.hora_llegada)) AS DuracionMinutos_billete,
    sd.dias_operacion AS DiasOperacion,
    COUNT(b.id_billete) AS CantidadBilletesVendidos,
    SUM(b.importe) AS IngresoTotal,
    b.id_pasajero,
    b.id_empleado,
    pa.id_parada
FROM Operaciones.Billetes b
LEFT JOIN Turismo.ServiciosDiarios sd ON sd.id_servicio = b.id_servicio
LEFT JOIN Turismo.Rutas r ON sd.id_ruta = r.id_ruta
LEFT JOIN Operaciones.Autobuses a ON sd.id_autobus = a.id_autobus
LEFT JOIN Operaciones.Conductores c ON sd.id_conductor = c.id_conductor
LEFT JOIN Operaciones.Pasajeros p ON b.id_pasajero = p.id_pasajero
LEFT JOIN Operaciones.Empleados e ON b.id_empleado = e.id_empleado
LEFT JOIN Turismo.Paradas pa ON r.id_ruta = pa.id_ruta
    WHERE (b.[rowversion] > CONVERT(ROWVERSION, @startRow) 
           AND b.[rowversion] <= CONVERT(ROWVERSION, @endRow))
    OR (sd.[rowversion] > CONVERT(ROWVERSION, @startRow) 
           AND sd.[rowversion] <= CONVERT(ROWVERSION, @endRow))
    OR (pa.[rowversion] > CONVERT(ROWVERSION, @startRow) 
           AND pa.[rowversion] <= CONVERT(ROWVERSION, @endRow))
GROUP BY 
    b.id_billete,
    sd.id_servicio, 
    b.fecha, 
    sd.id_ruta, 
    sd.id_autobus, 
    sd.id_conductor, 
    sd.dias_operacion, 
    b.id_pasajero, 
    b.id_empleado, 
    pa.id_parada;
END
GO