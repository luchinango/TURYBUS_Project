CREATE PROCEDURE [dbo].[DW_MergeDim_Paradas]
AS
BEGIN

	UPDATE dc
	SET [NombreLugar] = sc.NombreLugar,
	[HoraPrevista] = sc.HoraPrevista,
	[Actividad] = sc.Actividad,
	[TiempoParada] = sc.TiempoParada
	
	FROM [dbo].[Dim_Paradas] dc
	INNER JOIN [Staging].Paradas sc ON (dc.[ParadaSK] = sc.[ParadaSK])
	
	END
	GO