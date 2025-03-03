CREATE TABLE Dim_Conductores (
    ConductorSK INT IDENTITY(1,1) PRIMARY KEY,  -- Surrogate Key
    ConductorID INT NOT NULL,                   -- Business Key
    DNI VARCHAR(20) NOT NULL UNIQUE,
    Nombre VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Telefono VARCHAR(25),
    Direccion VARCHAR(255)
)