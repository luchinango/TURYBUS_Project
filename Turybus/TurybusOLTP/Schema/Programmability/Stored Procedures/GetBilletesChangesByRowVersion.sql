CREATE PROCEDURE [dbo].[GetBilletesChangesByRowVersion]
(
   @startRow BIGINT,
   @endRow BIGINT
)
AS
BEGIN
    SELECT [id_billete]
        ,[id_servicio]
        ,[id_pasajero]
        ,[id_empleado]
        ,[fecha]
        ,[importe]
        ,[hora_salida]
        ,[hora_llegada]
    FROM [Operaciones].[Billetes]
    WHERE [rowversion] > CONVERT(ROWVERSION, @startRow)
    AND [rowversion] <= CONVERT(ROWVERSION, @endRow)
END
GO
