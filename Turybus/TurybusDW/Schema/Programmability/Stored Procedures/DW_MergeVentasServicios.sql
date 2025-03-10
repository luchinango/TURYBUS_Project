CREATE PROCEDURE [dbo].[DW_MergeVentasServicios]
AS
BEGIN

	UPDATE dc
	SET
	[Id_billete] = sc.Id_Billete,
	[FechaServicio] = sc.FechaServicio,
	[RutaSK] = sc.RutaSK,
	[AutobusSK] = sc.AutobusSK,
	[ConductorSK] = sc.ConductorSK,
	[HoraSalida] = sc.HoraSalida,
	[HoraLlegada] = sc.HoraLlegada,
	[DiasOperacion] = sc.DiasOperacion,
	[CantidadBilletesVendidos] = sc.CantidadBilletesVendidos,
	[IngresoTotal] = sc.IngresoTotal,
	[PasajeroSK] = sc.PasajeroSK,
	[EmpleadoSK] = sc.EmpleadoSK,
	[ParadaSK] = sc.ParadaSK

	
	FROM [dbo].Fact_VentasServicios dc
	INNER JOIN [Staging].VentasServicios sc ON (dc.VentaServicioSK = sc.VentaServicioSK)
	
	END
	GO