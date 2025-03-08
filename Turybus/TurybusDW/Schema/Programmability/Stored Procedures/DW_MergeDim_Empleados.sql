CREATE PROCEDURE [dbo].[DW_MergeDim_Empleados]
AS
BEGIN

	UPDATE dc
	SET [Apellidos] = sc.Apellidos,
	[Nombre] = sc.Nombre,
	[Telefono] = sc.Telefono,
	[Email] = sc.Email,
	[DNI] = sc.DNI
	
	FROM [dbo].[Dim_Empleados] dc
	INNER JOIN [Staging].Empleados sc ON (dc.[EmpleadoSK] = sc.[EmpleadoSK])
	
	END
	GO