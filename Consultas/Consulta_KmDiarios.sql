USE TURYBUS_DB;
GO
SELECT a.matricula, a.modelo, s.id_servicio, s.hora_salida, s.hora_llegada,
r.km_recorrido AS km_diarios
FROM Operaciones.Autobuses a
INNER JOIN Turismo.ServiciosDiarios s ON a.id_autobus = s.id_autobus
INNER JOIN Turismo.Rutas r ON s.id_ruta = r.id_ruta;
GO