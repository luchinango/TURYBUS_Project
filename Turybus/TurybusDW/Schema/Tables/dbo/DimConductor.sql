CREATE TABLE dbo.DimConductor (
    ConductorSK INT PRIMARY KEY,        -- De staging.Conductores.id_conductor
    DNI VARCHAR(20) NOT NULL,
    Nombres VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Telefono VARCHAR(25),
    Direccion VARCHAR(255)
);
GO
