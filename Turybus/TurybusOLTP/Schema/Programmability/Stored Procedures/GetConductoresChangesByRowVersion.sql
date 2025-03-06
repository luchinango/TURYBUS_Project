CREATE PROCEDURE [dbo].[GetConductoresChangesByRowVersion]
(
   @startRow BIGINT,
   @endRow BIGINT
)
AS
BEGIN
    SELECT [id_conductor]
        ,[DNI]
        ,[nombre]
        ,[apellidos]
        ,[telefono]
        ,[direccion]
    FROM [Operaciones].[Conductores]
    WHERE [rowversion] > CONVERT(ROWVERSION, @startRow)
    AND [rowversion] <= CONVERT(ROWVERSION, @endRow)
END
GO
