CREATE PROCEDURE [dbo].[GetPasajerosChangesByRowVersion]
(
   @startRow BIGINT,
   @endRow BIGINT
)
AS
BEGIN
    SELECT [id_pasajero]
        ,[DNI]
        ,[nombre]
        ,[apellidos]
        ,[telefono]
    FROM [Operaciones].[Pasajeros]
    WHERE [rowversion] > CONVERT(ROWVERSION, @startRow)
    AND [rowversion] <= CONVERT(ROWVERSION, @endRow)
END
GO
