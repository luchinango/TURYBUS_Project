CREATE VIEW Reportes.Vw_PromedioViajeros AS
SELECT s.id_servicio, r.nombre AS ruta, AVG(viajeros) AS promedio_viajeros
FROM (
SELECT id_servicio, COUNT(*) AS viajeros
FROM Operaciones.Billetes
GROUP BY id_servicio
) s
INNER JOIN Turismo.ServiciosDiarios sd ON s.id_servicio = sd.id_servicio
INNER JOIN Turismo.Rutas r ON sd.id_ruta = r.id_ruta
GROUP BY s.id_servicio, r.nombre;
GO