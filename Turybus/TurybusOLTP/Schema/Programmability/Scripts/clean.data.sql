-- Desactivar temporalmente las restricciones de claves foráneas
ALTER TABLE Seguridad.Reparaciones NOCHECK CONSTRAINT ALL;
ALTER TABLE Seguridad.Revisiones NOCHECK CONSTRAINT ALL;
ALTER TABLE Turismo.Paradas NOCHECK CONSTRAINT ALL;
ALTER TABLE Turismo.ServiciosDiarios NOCHECK CONSTRAINT ALL;
ALTER TABLE Turismo.Rutas NOCHECK CONSTRAINT ALL;
ALTER TABLE Operaciones.Billetes NOCHECK CONSTRAINT ALL;
ALTER TABLE Operaciones.Pasajeros NOCHECK CONSTRAINT ALL;
ALTER TABLE Operaciones.Empleados NOCHECK CONSTRAINT ALL;
ALTER TABLE Operaciones.Conductores NOCHECK CONSTRAINT ALL;
ALTER TABLE Operaciones.Autobuses NOCHECK CONSTRAINT ALL;

-- Borrar los datos en orden para evitar problemas con las claves foráneas
DELETE FROM Seguridad.Reparaciones;
DELETE FROM Seguridad.Revisiones;
DELETE FROM Turismo.Paradas;
DELETE FROM Turismo.ServiciosDiarios;
DELETE FROM Turismo.Rutas;
DELETE FROM Operaciones.Billetes;
DELETE FROM Operaciones.Pasajeros;
DELETE FROM Operaciones.Empleados;
DELETE FROM Operaciones.Conductores;
DELETE FROM Operaciones.Autobuses;

-- Reactivar las restricciones de claves foráneas
ALTER TABLE Seguridad.Reparaciones CHECK CONSTRAINT ALL;
ALTER TABLE Seguridad.Revisiones CHECK CONSTRAINT ALL;
ALTER TABLE Turismo.Paradas CHECK CONSTRAINT ALL;
ALTER TABLE Turismo.ServiciosDiarios CHECK CONSTRAINT ALL;
ALTER TABLE Turismo.Rutas CHECK CONSTRAINT ALL;
ALTER TABLE Operaciones.Billetes CHECK CONSTRAINT ALL;
ALTER TABLE Operaciones.Pasajeros CHECK CONSTRAINT ALL;
ALTER TABLE Operaciones.Empleados CHECK CONSTRAINT ALL;
ALTER TABLE Operaciones.Conductores CHECK CONSTRAINT ALL;
ALTER TABLE Operaciones.Autobuses CHECK CONSTRAINT ALL;

-- Opcional: Resetear los IDs autoincrementales (si las tablas tienen IDs con IDENTITY)
DBCC CHECKIDENT ('Seguridad.Reparaciones', RESEED, 0);
DBCC CHECKIDENT ('Seguridad.Revisiones', RESEED, 0);
DBCC CHECKIDENT ('Turismo.Paradas', RESEED, 0);
DBCC CHECKIDENT ('Turismo.ServiciosDiarios', RESEED, 0);
DBCC CHECKIDENT ('Turismo.Rutas', RESEED, 0);
DBCC CHECKIDENT ('Operaciones.Billetes', RESEED, 0);
DBCC CHECKIDENT ('Operaciones.Pasajeros', RESEED, 0);
DBCC CHECKIDENT ('Operaciones.Empleados', RESEED, 0);
DBCC CHECKIDENT ('Operaciones.Conductores', RESEED, 0);
DBCC CHECKIDENT ('Operaciones.Autobuses', RESEED, 0);

PRINT 'Datos eliminados y contadores reiniciados correctamente.';
