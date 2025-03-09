CREATE PROCEDURE [dbo].[DW_MergeDim_Conductores]
AS
BEGIN

	UPDATE dc
	SET [Apellidos] = sc.Apellidos,
	[Nombre] = sc.Nombre,
	[Telefono] = sc.Telefono,
	[DNI] = sc.DNI,
	[Direccion] = sc.Direccion
	
	FROM [dbo].[Dim_Conductores] dc
	INNER JOIN [Staging].Conductores sc ON (dc.[ConductorSK] = sc.[ConductorSK])
	
	END
	GO