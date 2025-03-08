CREATE TABLE Seguridad.Reparaciones (
	id_reparacion INT IDENTITY(1,1) PRIMARY KEY,
	id_revision INT NOT NULL,
	codigo_reparacion VARCHAR(20) NOT NULL,
	tiempo_empleado INT NOT NULL, -- en minutos, por ejemplo
	comentario VARCHAR(500),
	[rowversion] TIMESTAMP NOT NULL, 
    CONSTRAINT FK_Reparacion_Revision FOREIGN KEY (id_revision)
	REFERENCES Seguridad.Revisiones(id_revision)
);