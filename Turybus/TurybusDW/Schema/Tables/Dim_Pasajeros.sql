CREATE TABLE Dim_Pasajeros (
    PasajeroSK INT IDENTITY(1,1) PRIMARY KEY,  -- Surrogate Key
    PasajeroID INT NOT NULL,                   -- Business Key
    DNI VARCHAR(20) NOT NULL UNIQUE,
    Nombre VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Telefono VARCHAR(25)
)