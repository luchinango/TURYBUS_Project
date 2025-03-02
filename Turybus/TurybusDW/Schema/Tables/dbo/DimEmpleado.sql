CREATE TABLE dbo.DimEmpleado (
    EmpleadoSK INT PRIMARY KEY,      -- De staging.Empleados.id_empleado
    DNI VARCHAR(20),
    Nombres VARCHAR(50),
    Apellidos VARCHAR(50),
    Telefono VARCHAR(25),
    Email VARCHAR(100)
);
GO
