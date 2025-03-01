USE TURYBUS_DB;
GO
CREATE TABLE Operaciones.Conductores (
    id_conductor INT IDENTITY(1,1) PRIMARY KEY,
    DNI VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    telefono VARCHAR(25),
    direccion VARCHAR(255)
);
GO
