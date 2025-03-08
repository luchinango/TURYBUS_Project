CREATE PROCEDURE [dbo].[DW_MergeDim_Servicios]
AS
BEGIN

	UPDATE dc
	SET 
	[HoraSalida] = sc.HoraSalida,
	[HoraLlegada] = sc.HoraLlegada,
	[DiasOperacion] = sc.DiasOperacion
	FROM [dbo].[Dim_Servicios] dc
	INNER JOIN [Staging].Servicios sc ON (dc.[ServicioSK] = sc.[ServicioSK])
	
	END
	GO