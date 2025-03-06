CREATE TABLE Turismo.Paradas (
 id_parada INT IDENTITY(1,1) PRIMARY KEY,
 id_ruta INT NOT NULL,
 orden INT NOT NULL, -- Orden de la parada en el itinerario de viaje
 nombre_lugar VARCHAR(100) NOT NULL,
 hora_prevista TIME NOT NULL,
 actividad VARCHAR(100), -- Ejemplo: comida, visita, etc.
 tiempo_parada TIME, [rowversion] TIMESTAMP NOT NULL, 
    -- Duración de la actividad
 CONSTRAINT FK_Parada_Ruta FOREIGN KEY (id_ruta)
 REFERENCES Turismo.Rutas(id_ruta)
);
