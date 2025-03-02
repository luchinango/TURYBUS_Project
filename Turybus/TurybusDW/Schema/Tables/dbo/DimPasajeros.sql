CREATE TABLE dbo.DimPasajeros (
    PasajeroSK INT PRIMARY KEY,     -- De staging.Pasajeros.id_pasajero
    DNI VARCHAR(20),
    Nombres VARCHAR(50),
    Apellidos VARCHAR(50),
    Telefono VARCHAR(25)
);
GO
