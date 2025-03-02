CREATE TABLE staging.Billetes (
    id_billete INT,
    id_servicio INT,
    id_pasajero INT,
    id_empleado INT,
    fecha DATE,
    importe DECIMAL(10,2),
    hora_salida TIME,
    hora_llegada TIME
);
GO
