CREATE TABLE dbo.DimServicios (
    ServicioSK INT PRIMARY KEY,       -- De staging.ServiciosDiarios.id_servicio
    HoraSalida TIME NOT NULL,
    HoraLlegada TIME NOT NULL,
    DiasOperacion VARCHAR(50)
);
GO
