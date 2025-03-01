USE TURYBUS_DB;
GO

CREATE TABLE Turismo.ServiciosDiarios (
    id_servicio INT IDENTITY(1,1) PRIMARY KEY,
    id_ruta INT NOT NULL,
    hora_salida TIME NOT NULL,
    hora_llegada TIME NOT NULL,
    dias_operacion VARCHAR(50) NOT NULL,
    id_autobus INT NULL,
    id_conductor INT NULL,

    CONSTRAINT FK_Servicio_Ruta FOREIGN KEY (id_ruta)
      REFERENCES Turismo.Rutas(id_ruta),
    CONSTRAINT FK_Servicio_Autobus FOREIGN KEY (id_autobus)
      REFERENCES Operaciones.Autobuses(id_autobus),
    CONSTRAINT FK_Servicio_Conductor FOREIGN KEY (id_conductor)
      REFERENCES Operaciones.Conductores(id_conductor)
);
GO
