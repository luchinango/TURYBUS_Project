USE TURYBUS_DB;
GO
CREATE TABLE Seguridad.Revisiones (
    id_revision INT IDENTITY(1,1) PRIMARY KEY,
    matricula_autobus VARCHAR(20) NOT NULL,
    fecha_revision DATE NOT NULL,
    diagnostico VARCHAR(500) NOT NULL
);
GO
