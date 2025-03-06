CREATE PROCEDURE [dbo].[GetRevisionesChangesByRowVersion]
(
   @startRow BIGINT,
   @endRow BIGINT
)
AS
BEGIN
    SELECT [id_revision]
        ,[matricula_autobus]
        ,[fecha_revision]
        ,[diagnostico]
    FROM [Seguridad].[Revisiones]
    WHERE [rowversion] > CONVERT(ROWVERSION, @startRow)
    AND [rowversion] <= CONVERT(ROWVERSION, @endRow)
END
GO
