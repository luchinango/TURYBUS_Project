CREATE TABLE dbo.DimFecha (
    FechaSK INT PRIMARY KEY,          -- e.g., formapara YYYYMMDD
    ValorFecha DATE NOT NULL,
    Dia INT,
    Mes INT,
    Gestion INT,
    Trimestre INT,
    NombreMes VARCHAR(20),
    NombreDia VARCHAR(20)
);
GO