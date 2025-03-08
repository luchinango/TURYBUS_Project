IF NOT EXISTS(SELECT TOP(1) 1
              FROM [PackageConfig]
			  WHERE [TableName] = 'Conductores')
 BEGIN
	INSERT [PackageConfig] ([TableName], [LastRowVersion]) VALUES ('Conductores', 0)
 END
GO
IF NOT EXISTS(SELECT TOP(1) 1
              FROM [PackageConfig]
			  WHERE [TableName] = 'Empleados')
 BEGIN
  INSERT [PackageConfig] ([TableName], [LastRowVersion]) VALUES ('Empleados', 0)
 END
GO
IF NOT EXISTS(SELECT TOP(1) 1
              FROM [PackageConfig]
			  WHERE [TableName] = 'Paradas')
 BEGIN
	INSERT [PackageConfig] ([TableName], [LastRowVersion]) VALUES ('Paradas', 0)
 END
GO
IF NOT EXISTS(SELECT TOP(1) 1
              FROM [PackageConfig]
			  WHERE [TableName] = 'Pasajeros')
 BEGIN
	INSERT [PackageConfig] ([TableName], [LastRowVersion]) VALUES ('Pasajeros', 0)
 END
GO
IF NOT EXISTS(SELECT TOP(1) 1
              FROM [PackageConfig]
			  WHERE [TableName] = 'Rutas')
 BEGIN
	INSERT [PackageConfig] ([TableName], [LastRowVersion]) VALUES ('Rutas', 0)
 END
GO
IF NOT EXISTS(SELECT TOP(1) 1
              FROM [PackageConfig]
			  WHERE [TableName] = 'Servicios')
 BEGIN
	INSERT [PackageConfig] ([TableName], [LastRowVersion]) VALUES ('Servicios', 0)
 END
GO
IF NOT EXISTS(SELECT TOP(1) 1
              FROM [PackageConfig]
			  WHERE [TableName] = 'VentasServicios')
 BEGIN
	INSERT [PackageConfig] ([TableName], [LastRowVersion]) VALUES ('VentasServicios', 0)
 END
GO
IF NOT EXISTS(SELECT TOP(1) 1
              FROM [PackageConfig]
			  WHERE [TableName] = 'AutobusesMantenimiento')
 BEGIN
	INSERT [PackageConfig] ([TableName], [LastRowVersion]) VALUES ('AutobusesMantenimiento', 0)
 END
GO