CREATE PROCEDURE [dbo].[DW_MergeDim_Rutas]
AS
BEGIN

	UPDATE dc
	SET [Nombre] = sc.[Nombre]
	   ,[Descripcion]     = sc.[Descripcion]
	   ,[CostoBase]     = sc.[CostoBase]
	   ,[KmRecorrido]    = sc.[KmRecorrido]
	   ,[tiempo_recorrido]      = sc.[tiempo_recorrido]
	FROM [dbo].[Dim_Rutas]        dc
	INNER JOIN [Staging].[Rutas] sc ON (dc.[RutaSK]=sc.[RutaSK])
END
GO
