CREATE TABLE staging.ServiciosDiarios (
    id_servicio INT,
    id_ruta INT,
    hora_salida TIME,
    hora_llegada TIME,
    dias_operacion VARCHAR(50),
    id_autobus INT,
    id_conductor INT
);
GO
