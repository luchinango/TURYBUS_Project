USE TURYBUS_DB;
GO
CREATE TABLE Turismo.ServiciosDiarios (
id_servicio INT IDENTITY(1,1) PRIMARY KEY,
id_ruta INT NOT NULL,
hora_salida TIME NOT NULL,
hora_llegada TIME NOT NULL,
dias_operacion VARCHAR(50) NOT NULL, -- Ej.: 'L,M,X,J,V' o 'FESTIVO'
id_autobus INT NULL, -- Se asignar� mediante procedimiento
id_conductor INT NULL, -- Se asignar� mediante procedimiento
CONSTRAINT FK_Servicio_Ruta FOREIGN KEY (id_ruta)
REFERENCES Turismo.Rutas(id_ruta)
);
GO