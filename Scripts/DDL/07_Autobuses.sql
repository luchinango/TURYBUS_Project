USE TURYBUS_DB;
GO
CREATE TABLE Operaciones.Autobuses (
    id_autobus INT IDENTITY(1,1) PRIMARY KEY,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    modelo VARCHAR(50) NOT NULL,
    fabricante VARCHAR(50) NOT NULL,
    plazas INT NOT NULL,
    caracteristicas VARCHAR(500)
);
GO