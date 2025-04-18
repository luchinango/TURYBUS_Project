﻿-- Desactivar temporalmente las restricciones de claves foráneas
ALTER TABLE dbo.PackageConfig NOCHECK CONSTRAINT ALL;
ALTER TABLE dbo.Dim_AutobusesMantenimiento NOCHECK CONSTRAINT ALL;
ALTER TABLE dbo.Dim_Conductores NOCHECK CONSTRAINT ALL;
ALTER TABLE dbo.Dim_Empleados NOCHECK CONSTRAINT ALL;
ALTER TABLE dbo.Dim_Paradas NOCHECK CONSTRAINT ALL;
ALTER TABLE dbo.Dim_Pasajeros NOCHECK CONSTRAINT ALL;
ALTER TABLE dbo.Dim_Rutas NOCHECK CONSTRAINT ALL;
ALTER TABLE dbo.Dim_Servicios NOCHECK CONSTRAINT ALL;
ALTER TABLE dbo.Fact_VentasServicios NOCHECK CONSTRAINT ALL;

-- Borrar los datos en orden para evitar problemas con las claves foráneas
DELETE FROM dbo.PackageConfig;
DELETE FROM dbo.Dim_AutobusesMantenimiento;
DELETE FROM dbo.Dim_Conductores;
DELETE FROM dbo.Dim_Empleados;
DELETE FROM dbo.Dim_Paradas;
DELETE FROM dbo.Dim_Pasajeros;
DELETE FROM dbo.Dim_Rutas;
DELETE FROM dbo.Dim_Servicios;
DELETE FROM dbo.Fact_VentasServicios;

-- Reactivar las restricciones de claves foráneas
ALTER TABLE dbo.PackageConfig CHECK CONSTRAINT ALL;
ALTER TABLE dbo.Dim_AutobusesMantenimiento CHECK CONSTRAINT ALL;
ALTER TABLE dbo.Dim_Conductores CHECK CONSTRAINT ALL;
ALTER TABLE dbo.Dim_Empleados CHECK CONSTRAINT ALL;
ALTER TABLE dbo.Dim_Paradas CHECK CONSTRAINT ALL;
ALTER TABLE dbo.Dim_Pasajeros CHECK CONSTRAINT ALL;
ALTER TABLE dbo.Dim_Rutas CHECK CONSTRAINT ALL;
ALTER TABLE dbo.Dim_Servicios CHECK CONSTRAINT ALL;
ALTER TABLE dbo.Fact_VentasServicios CHECK CONSTRAINT ALL;

-- Opcional: Resetear los IDs autoincrementales (si las tablas tienen IDs con IDENTITY)
DBCC CHECKIDENT ('dbo.PackageConfig', RESEED, 0);
DBCC CHECKIDENT ('dbo.Dim_AutobusesMantenimiento', RESEED, 0);
DBCC CHECKIDENT ('dbo.Dim_Conductores', RESEED, 0);
DBCC CHECKIDENT ('dbo.Dim_Empleados', RESEED, 0);
DBCC CHECKIDENT ('dbo.Dim_Paradas', RESEED, 0);
DBCC CHECKIDENT ('dbo.Dim_Pasajeros', RESEED, 0);
DBCC CHECKIDENT ('dbo.Dim_Rutas', RESEED, 0);
DBCC CHECKIDENT ('dbo.Dim_Servicios', RESEED, 0);
DBCC CHECKIDENT ('dbo.Fact_VentasServicios', RESEED, 0);

-- Reorganizar los índices de las tablas para optimizar el rendimiento después del borrado masivo
ALTER INDEX ALL ON dbo.Dim_AutobusesMantenimiento REBUILD;
ALTER INDEX ALL ON dbo.Dim_Conductores REBUILD;
ALTER INDEX ALL ON dbo.Dim_Empleados REBUILD;
ALTER INDEX ALL ON dbo.Dim_Paradas REBUILD;
ALTER INDEX ALL ON dbo.Dim_Pasajeros REBUILD;
ALTER INDEX ALL ON dbo.Dim_Rutas REBUILD;
ALTER INDEX ALL ON dbo.Dim_Servicios REBUILD;
ALTER INDEX ALL ON dbo.Fact_VentasServicios REBUILD;

PRINT 'Datos eliminados, contadores reiniciados y índices optimizados correctamente.';
