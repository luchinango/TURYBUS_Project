CREATE PROCEDURE [dbo].[GetParadasChangesByRowVersion]
(
   @startRow BIGINT,
   @endRow BIGINT
)
AS
BEGIN
    SELECT [id_parada]
        ,[id_ruta]
        ,[orden]
        ,[nombre_lugar]
        ,[hora_prevista]
        ,[actividad]
        ,[tiempo_parada]
    FROM [Turismo].[Paradas]
    WHERE [rowversion] > CONVERT(ROWVERSION, @startRow)
    AND [rowversion] <= CONVERT(ROWVERSION, @endRow)
END
GO
