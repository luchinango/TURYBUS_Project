CREATE TABLE dbo.DimRuta (
    RutaSK INT PRIMARY KEY,         -- De staging.Rutas.id_ruta
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(500),
    CosparaBase DECIMAL(10,2) NOT NULL,
    KmRecorrido INT,
    TiempoRecorrido INT
);
GO
