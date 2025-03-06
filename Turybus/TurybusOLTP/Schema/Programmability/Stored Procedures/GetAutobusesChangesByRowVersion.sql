CREATE PROCEDURE [dbo].[GetAutobusesChangesByRowVersion]
(
   @startRow BIGINT,
   @endRow BIGINT
)
AS
BEGIN
    SELECT [id_autobus]
        ,[matricula]
        ,[modelo]
        ,[fabricante]
        ,[plazas]
        ,[caracteristicas]
    FROM [Operaciones].[Autobuses]
    WHERE [rowversion] > CONVERT(ROWVERSION, @startRow)
    AND [rowversion] <= CONVERT(ROWVERSION, @endRow)
END
GO
