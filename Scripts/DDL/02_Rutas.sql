USE TURYBUS_DB;
GO
CREATE TABLE Turismo.Rutas (
 id_ruta INT IDENTITY(1,1) PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL,
 descripcion VARCHAR(500),
 costo_base DECIMAL(10,2) NOT NULL,
 km_recorrido INT -- Kil�metros totales de la ruta recorrida
);
GO