﻿CREATE TABLE Turismo.Rutas (
 id_ruta INT IDENTITY(1,1) PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL,
 descripcion VARCHAR(500),
 costo_base DECIMAL(10,2) NOT NULL,
 km_recorrido INT NOT NULL, -- Kil metros totales de la ruta recorrida
 [tiempo_recorrido] INT NOT NULL, 
    [rowversion] TIMESTAMP NOT NULL);
