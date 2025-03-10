CREATE PROCEDURE [dbo].[GetAutobusesMantenimientoChangesByRowVersion]
(
   @startRow BIGINT,
   @endRow BIGINT
)
AS
BEGIN
    SELECT 
        a.id_autobus AS AutobusID,
        a.matricula AS Matricula,
        a.modelo AS Modelo,
        a.fabricante AS Fabricante,
        a.plazas AS Plazas,
        a.caracteristicas AS Caracteristicas,
        r.fecha_revision AS FechaRevision,
        r.diagnostico AS Diagnostico,
        rep.codigo_reparacion AS CodigoReparacion,
        rep.tiempo_empleado AS TiempoEmpleado,
        rep.comentario AS Comentario
    FROM [Operaciones].[Autobuses] a
    INNER JOIN [Seguridad].[Revisiones] r
        ON a.matricula = r.matricula_autobus  --matricula porque las tablas se unen por su matricula
    INNER JOIN [Seguridad].[Reparaciones] rep
        ON r.id_revision = rep.id_revision
    WHERE (a.[rowversion] > CONVERT(ROWVERSION, @startRow) 
           AND a.[rowversion] <= CONVERT(ROWVERSION, @endRow))
    OR (r.[rowversion] > CONVERT(ROWVERSION, @startRow) 
           AND r.[rowversion] <= CONVERT(ROWVERSION, @endRow))
    OR (rep.[rowversion] > CONVERT(ROWVERSION, @startRow) 
           AND rep.[rowversion] <= CONVERT(ROWVERSION, @endRow))
END
GO