CREATE TABLE dbo.DimAutobus (
    AutobusSK INT PRIMARY KEY,           -- De staging.Autobuses.id_autobus
    Matricula VARCHAR(20) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    Fabricante VARCHAR(50) NOT NULL,
    Plazas INT NOT NULL,
    Caracteristicas VARCHAR(500)
);
GO
