CREATE TABLE [Staging].[Empleados](
    EmpleadoSK INT NOT NULL, 
    DNI VARCHAR(20) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Telefono VARCHAR(25),
    Email VARCHAR(100)
);
GO