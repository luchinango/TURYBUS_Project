CREATE PROCEDURE [dbo].[GetRutasChangesByRowVersion]
(
   @startRow BIGINT,
   @endRow BIGINT
)
AS
BEGIN
    SELECT [id_ruta]
        ,[nombre]
        ,[descripcion]
        ,[costo_base]
        ,[km_recorrido]
        ,[tiempo_recorrido]
    FROM [Turismo].[Rutas]
    WHERE [rowversion] > CONVERT(ROWVERSION, @startRow)
    AND [rowversion] <= CONVERT(ROWVERSION, @endRow)
END
GO
