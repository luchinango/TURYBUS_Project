CREATE PROCEDURE [dbo].[DW_MergeDim_Pasajeros]
AS
BEGIN

	UPDATE dc
	SET [DNI] = sc.[DNI]
	   ,[Nombre]     = sc.[Nombre]
	   ,[Apellidos]     = sc.[Apellidos]
	   ,[Telefono]    = sc.[Telefono]
	FROM [dbo].[Dim_Pasajeros]        dc
	INNER JOIN [Staging].[Pasajeros] sc ON (dc.[PasajeroSK]=sc.[PasajeroSK])
END
GO
