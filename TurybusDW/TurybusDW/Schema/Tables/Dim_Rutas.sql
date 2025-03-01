CREATE TABLE Dim_Rutas (
    RutaSK INT IDENTITY(1,1) PRIMARY KEY,  -- Surrogate Key
    RutaID INT NOT NULL,                   -- Business Key
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(500),
    CostoBase DECIMAL(10,2) NOT NULL,
    KmRecorrido INT
)