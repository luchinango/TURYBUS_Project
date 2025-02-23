USE TURYBUS_DB;
GO
-- Rutas
INSERT INTO Turismo.Rutas (nombre, descripcion, costo_base, km_recorrido)
VALUES 
  ('Ruta del Sol', 'Recorrido por playas y pueblos costeros', 50.00, 120),
  ('Ruta de la Montaña', 'Recorrido por zonas montañosas y miradores', 75.00, 180);
GO

-- Paradas (Itinerario)
INSERT INTO Turismo.Paradas (id_ruta, orden, nombre_lugar, hora_prevista, actividad, tiempo_parada)
VALUES
  (1, 1, 'Playa del Sol', '08:30', 'Visita', '00:30'),
  (1, 2, 'Pueblo Costero', '10:00', 'Comida', '01:00'),
  (2, 1, 'Mirador Alto', '09:00', 'Foto', '00:20'),
  (2, 2, 'Bosque Encantado', '10:00', 'Caminata', '00:40');
GO

-- Servicios Diarios
INSERT INTO Turismo.ServiciosDiarios (id_ruta, hora_salida, hora_llegada, dias_operacion)
VALUES
  (1, '08:00', '12:00', 'L,M,X,J,V,S,D'),
  (2, '09:00', '14:00', 'L,M,X,J,V');
GO

-- Pasajeros
INSERT INTO Operaciones.Pasajeros (DNI, nombre, apellidos, telefono)
VALUES
  ('12345678', 'Juan', 'Pérez', '555-1234'),
  ('87654321', 'María', 'González', '555-5678');
GO

-- Empleados (para ventas)
INSERT INTO Operaciones.Empleados (DNI, nombre, apellidos, telefono, email)
VALUES
  ('55667788', 'Luis', 'Rodríguez', '555-0001', 'luis@turybus.com'),
  ('99887766', 'Andrea', 'López', '555-0002', 'andrea@turybus.com');
GO

-- Billetes (incluye id_empleado)
INSERT INTO Operaciones.Billetes (id_servicio, id_pasajero, id_empleado, fecha, importe, hora_salida, hora_llegada)
VALUES
  (1, 1, 1, '2025-07-01', 50.00, '08:00', '12:00'),
  (2, 2, 2, '2025-07-01', 75.00, '09:00', '14:00');
GO

-- Autobuses
INSERT INTO Operaciones.Autobuses (matricula, modelo, fabricante, plazas, caracteristicas)
VALUES
  ('ABC-123', 'Model X', 'BusMaker', 50, 'Aire acondicionado'),
  ('DEF-456', 'Model Y', 'BusCorp', 40, 'Con WiFi y TV');
GO

-- Conductores
INSERT INTO Operaciones.Conductores (DNI, nombre, apellidos, telefono, direccion)
VALUES
  ('11223344', 'Carlos', 'Ramírez', '555-1111', 'Av. Siempre Viva 123'),
  ('44332211', 'Ana', 'Martínez', '555-2222', 'Calle Falsa 456');
GO

-- Asignar Autobús y Conductor a Servicios
UPDATE Turismo.ServiciosDiarios
SET id_autobus = 1, id_conductor = 1
WHERE id_servicio = 1;
UPDATE Turismo.ServiciosDiarios
SET id_autobus = 2, id_conductor = 2
WHERE id_servicio = 2;
GO

-- Revisiones y Reparaciones
INSERT INTO Seguridad.Revisiones (matricula_autobus, fecha_revision, diagnostico)
VALUES ('ABC-123', '2025-06-15', 'Revisión general OK');
GO
INSERT INTO Seguridad.Reparaciones (id_revision, codigo_reparacion, tiempo_empleado, comentario)
VALUES (1, 'REP001', 120, 'Cambio de filtro');
GO
