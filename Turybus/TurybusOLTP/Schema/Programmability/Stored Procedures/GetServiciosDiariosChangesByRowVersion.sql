CREATE PROCEDURE [dbo].[GetServiciosDiariosChangesByRowVersion]
(
   @startRow BIGINT,
   @endRow BIGINT
)
AS
BEGIN
    SELECT [id_servicio]
        ,[id_ruta]
        ,[hora_salida]
        ,[hora_llegada]
        ,[dias_operacion]
        ,[id_autobus]
        ,[id_conductor]
    FROM [Turismo].[ServiciosDiarios]
    WHERE [rowversion] > CONVERT(ROWVERSION, @startRow)
    AND [rowversion] <= CONVERT(ROWVERSION, @endRow)
END
GO
