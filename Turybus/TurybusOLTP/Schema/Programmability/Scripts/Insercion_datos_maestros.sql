-- =============================================
-- Inserción de datos "maestros"
-- =============================================

-- 1. Datos en Operaciones.Autobuses
INSERT INTO Operaciones.Autobuses (matricula, modelo, fabricante, plazas, caracteristicas)
VALUES
('ABC123', 'Modelo A', 'Fabricante X', 50, 'Aire acondicionado, WiFi'),
('DEF456', 'Modelo B', 'Fabricante Y', 45, 'Aire acondicionado'),
('GHI789', 'Modelo C', 'Fabricante Z', 60, 'WiFi, TV'),
('JKL012', 'Modelo D', 'Fabricante X', 55, 'Aire acondicionado, TV'),
('MNO345', 'Modelo E', 'Fabricante Y', 40, 'WiFi'),
('PQR678', 'Modelo F', 'Fabricante Z', 50, 'Aire acondicionado, WiFi'),
('STU901', 'Modelo G', 'Fabricante X', 48, 'WiFi, Comodidades'),
('VWX234', 'Modelo H', 'Fabricante Y', 52, 'Aire acondicionado'),
('YZA567', 'Modelo I', 'Fabricante Z', 47, 'WiFi, Aire acondicionado'),
('BCD890', 'Modelo J', 'Fabricante X', 60, 'WiFi, Aire acondicionado, TV');

-- 2. Datos en Operaciones.Conductores
INSERT INTO Operaciones.Conductores (DNI, nombre, apellidos, telefono, direccion)
VALUES
('12345678A', 'Juan', 'Pérez', '600111222', 'Calle A'),
('23456789B', 'Luis', 'García', '600222333', 'Calle B'),
('34567890C', 'Carlos', 'Martínez', '600333444', 'Calle C'),
('45678901D', 'Miguel', 'Sánchez', '600444555', 'Calle D'),
('56789012E', 'Andrés', 'López', '600555666', 'Calle E');

-- 3. Datos en Operaciones.Empleados
INSERT INTO Operaciones.Empleados (DNI, nombre, apellidos, telefono, email)
VALUES
('98765432Z', 'Ana', 'Gómez', '610111222', 'ana.gomez@example.com'),
('87654321Y', 'María', 'Ruiz', '610222333', 'maria.ruiz@example.com'),
('76543210X', 'Laura', 'Hernández', '610333444', 'laura.hernandez@example.com'),
('65432109W', 'Elena', 'Martín', '610444555', 'elena.martin@example.com'),
('54321098V', 'Sara', 'Díaz', '610555666', 'sara.diaz@example.com');

-- 4. Datos en Operaciones.Pasajeros
INSERT INTO Operaciones.Pasajeros (DNI, nombre, apellidos, telefono)
VALUES
('11111111A', 'Pedro', 'Alvarez', '620111222'),
('22222222B', 'Sofía', 'Torres', '620222333'),
('33333333C', 'Diego', 'Ramírez', '620333444'),
('44444444D', 'Lucía', 'Morales', '620444555'),
('55555555E', 'Miguel', 'Ortega', '620555666'),
('66666666F', 'Raquel', 'Silva', '620666777'),
('77777777G', 'Alberto', 'Castro', '620777888'),
('88888888H', 'Carmen', 'Soler', '620888999'),
('99999999I', 'Jorge', 'Navarro', '620999000'),
('10101010J', 'Luciano', 'Ramos', '621000111'),
('12121212K', 'Marta', 'Iglesias', '621111222'),
('13131313L', 'Alba', 'Fuentes', '621222333'),
('14141414M', 'Iván', 'Cortés', '621333444'),
('15151515N', 'Clara', 'Campos', '621444555'),
('16161616O', 'Esteban', 'Vega', '621555666'),
('17171717P', 'Rosa', 'Molina', '621666777'),
('18181818Q', 'Diego', 'Santos', '621777888'),
('19191919R', 'Verónica', 'Vargas', '621888999'),
('20202020S', 'Pablo', 'Méndez', '621999000'),
('21212121T', 'Inés', 'Herrera', '622000111'),
('23232323U', 'Sergio', 'Navarro', '622111222'),
('24242424V', 'Paula', 'López', '622222333'),
('25252525W', 'Víctor', 'García', '622333444'),
('26262626X', 'Rocío', 'Pérez', '622444555'),
('27272727Y', 'Manuel', 'Romero', '622555666'),
('28282828Z', 'Olga', 'Ramírez', '622666777'),
('29292929A', 'Diego', 'Blanco', '622777888'),
('30303030B', 'Sara', 'Cruz', '622888999'),
('31313131C', 'Óscar', 'Flores', '622999000');

-- 5. Datos en Turismo.Rutas
INSERT INTO Turismo.Rutas (nombre, descripcion, costo_base, km_recorrido, tiempo_recorrido)
VALUES
('Ruta 1', 'Recorrido por la ciudad', 5.00, 20, 30),
('Ruta 2', 'Recorrido interurbano', 7.50, 35, 50),
('Ruta 3', 'Ruta turística', 10.00, 50, 70),
('Ruta 4', 'Ruta exprés', 4.50, 15, 25),
('Ruta 5', 'Recorrido nocturno', 6.00, 25, 40);

-- 6. Datos en Turismo.ServiciosDiarios  
-- Inserción de datos en Turismo.ServiciosDiarios
-- Se distribuyen los autobuses y conductores de manera equitativa.
-- =============================================

INSERT INTO Turismo.ServiciosDiarios (id_ruta, hora_salida, hora_llegada, dias_operacion, id_autobus, id_conductor)
SELECT 
    s.id_ruta,
    s.hora_salida,
    CONVERT(TIME, DATEADD(MINUTE, r.tiempo_recorrido, s.hora_salida)) AS hora_llegada,
    s.dias_operacion,
    a.id_autobus,
    c.id_conductor
FROM (
    VALUES
    (1, '08:00', 'Lunes,Martes,Miércoles,Jueves,Viernes'),
    (2, '09:00', 'Lunes,Miércoles,Viernes'),
    (3, '10:00', 'Sábado,Domingo'),
    (4, '12:00', 'Lunes a Viernes'),
    (5, '14:00', 'Martes,Jueves,Sábado'),
    (1, '16:00', 'Lunes,Martes,Miércoles,Jueves,Viernes'),
    (2, '17:00', 'Lunes,Miércoles,Viernes'),
    (3, '18:00', 'Sábado,Domingo'),
    (4, '20:00', 'Lunes a Viernes'),
    (5, '22:00', 'Martes,Jueves,Sábado')
) AS s(id_ruta, hora_salida, dias_operacion)
JOIN Turismo.Rutas r ON r.id_ruta = s.id_ruta
JOIN (
    SELECT id_autobus, ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM Operaciones.Autobuses
) a ON (s.id_ruta % (SELECT COUNT(*) FROM Operaciones.Autobuses)) + 1 = a.rn
JOIN (
    SELECT id_conductor, ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM Operaciones.Conductores
) c ON (s.id_ruta % (SELECT COUNT(*) FROM Operaciones.Conductores)) + 1 = c.rn;

-- 7. Datos en Turismo.Paradas  
-- Se definen paradas para algunas rutas; si una ruta no tiene paradas, se conservarán los horarios originales.
INSERT INTO Turismo.Paradas (id_ruta, orden, nombre_lugar, hora_prevista, actividad, tiempo_parada)
VALUES
(1, 1, 'Parada A', '08:05', 'Descanso', '00:05'),
(1, 2, 'Parada B', '08:15', 'Comida', '00:10'),
(2, 1, 'Parada C', '09:10', 'Descanso', '00:05'),
(2, 2, 'Parada D', '09:30', 'Comida', '00:10'),
(3, 1, 'Parada E', '10:15', 'Descanso', '00:05'),
(4, 1, 'Parada X', '12:10', 'Descanso', '00:05'),
(5, 1, 'Parada Y', '14:10', 'Descanso', '00:05');

-- 8. Datos en Seguridad.Revisiones
INSERT INTO Seguridad.Revisiones (matricula_autobus, fecha_revision, diagnostico)
VALUES
('ABC123', '2025-01-15', 'Revisión general sin incidencias'),
('DEF456', '2025-01-20', 'Revisión de motor y frenos'),
('GHI789', '2025-01-25', 'Revisión completa con observaciones'),
('JKL012', '2025-02-01', 'Revisión general sin incidencias'),
('MNO345', '2025-02-05', 'Revisión de motor y frenos'),
('PQR678', '2025-02-10', 'Revisión completa con observaciones'),
('STU901', '2025-02-15', 'Revisión general sin incidencias'),
('VWX234', '2025-02-20', 'Revisión de motor y frenos'),
('YZA567', '2025-02-25', 'Revisión completa con observaciones'),
('BCD890', '2025-03-01', 'Revisión general sin incidencias');

-- 9. Datos en Seguridad.Reparaciones
INSERT INTO Seguridad.Reparaciones (id_revision, codigo_reparacion, tiempo_empleado, comentario)
VALUES
(1, 'REP001', 120, 'Cambio de frenos'),
(2, 'REP002', 90, 'Ajuste de motor'),
(3, 'REP003', 60, 'Revisión de sistema eléctrico'),
(4, 'REP004', 45, 'Cambio de neumáticos'),
(5, 'REP005', 75, 'Revisión general'),
(6, 'REP006', 80, 'Ajuste de suspensión'),
(7, 'REP007', 50, 'Reparación de faros'),
(8, 'REP008', 65, 'Cambio de aceite'),
(9, 'REP009', 100, 'Revisión de sistema de frenos'),
(10, 'REP010', 110, 'Ajuste general');

-- =============================================
-- Inserción de 200 registros en Operaciones.Billetes  
-- Se utiliza un CTE recursivo para generar 200 filas.
-- Se distribuyen equitativamente los distintos id_servicio, id_pasajero e id_empleado.
-- =============================================

WITH Numeros AS (
    SELECT TOP 200 ROW_NUMBER() OVER (ORDER BY NEWID()) AS n
    FROM master.dbo.spt_values
)
INSERT INTO Operaciones.Billetes (id_servicio, id_pasajero, id_empleado, fecha, importe, hora_salida, hora_llegada)
SELECT
    s.id_servicio,
    p.id_pasajero,
    e.id_empleado,
    DATEADD(day, -ABS(CHECKSUM(NEWID())) % 365, GETDATE()),
    ROUND(
      (r.costo_base + (ABS(CHECKSUM(NEWID())) % 10) * 1.00), 2
    ),
    -- Calcular hora de salida: si hay paradas, 5 minutos antes de la primera; si no, se usa la salida original.
    COALESCE(CONVERT(TIME, DATEADD(minute, -5, stops.first_parada)), s.hora_salida),
    -- Calcular hora de llegada: si hay paradas, se suma la duración (en minutos) de la última parada a la hora prevista de esa parada; si no, se usa la llegada original.
    COALESCE(CONVERT(TIME, DATEADD(minute, stops.last_stop_duration, stops.last_parada)), s.hora_llegada)
FROM Numeros n
JOIN (
    SELECT id_servicio, id_ruta, hora_salida, hora_llegada, 
           ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM Turismo.ServiciosDiarios
) s ON n.n % (SELECT COUNT(*) FROM Turismo.ServiciosDiarios) + 1 = s.rn
JOIN (
    SELECT id_pasajero, 
           ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM Operaciones.Pasajeros
) p ON n.n % (SELECT COUNT(*) FROM Operaciones.Pasajeros) + 1 = p.rn
JOIN (
    SELECT id_empleado, 
           ROW_NUMBER() OVER (ORDER BY NEWID()) AS rn
    FROM Operaciones.Empleados
) e ON n.n % (SELECT COUNT(*) FROM Operaciones.Empleados) + 1 = e.rn
JOIN Turismo.Rutas r ON r.id_ruta = s.id_ruta
LEFT JOIN (
    SELECT 
      id_ruta,
      MIN(CAST(hora_prevista AS datetime)) AS first_parada,
      MAX(CAST(hora_prevista AS datetime)) AS last_parada,
      MAX(DATEDIFF(minute, '00:00', tiempo_parada)) AS last_stop_duration
    FROM Turismo.Paradas
    GROUP BY id_ruta
) AS stops ON stops.id_ruta = s.id_ruta
OPTION (MAXRECURSION 0);
