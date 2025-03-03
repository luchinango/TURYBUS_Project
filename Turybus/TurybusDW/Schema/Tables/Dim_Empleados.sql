CREATE TABLE Dim_Empleados (
    EmpleadoSK INT IDENTITY(1,1) PRIMARY KEY,  -- Surrogate Key
    EmpleadoID INT NOT NULL,                   -- Business Key
    DNI VARCHAR(20) NOT NULL UNIQUE,
    Nombre VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Telefono VARCHAR(25),
    Email VARCHAR(100)
)