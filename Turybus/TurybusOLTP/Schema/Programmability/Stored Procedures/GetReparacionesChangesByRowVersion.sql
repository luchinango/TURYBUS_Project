CREATE PROCEDURE [dbo].[GetReparacionesChangesByRowVersion]
(
   @startRow BIGINT,
   @endRow BIGINT
)
AS
BEGIN
    SELECT [id_reparacion]
        ,[id_revision]
        ,[codigo_reparacion]
        ,[tiempo_empleado]
        ,[comentario]
    FROM [Seguridad].[Reparaciones]
    WHERE [rowversion] > CONVERT(ROWVERSION, @startRow)
    AND [rowversion] <= CONVERT(ROWVERSION, @endRow)
END
GO
