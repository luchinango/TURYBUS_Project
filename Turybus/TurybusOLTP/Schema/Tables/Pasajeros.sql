CREATE TABLE Operaciones.Pasajeros (     
	id_pasajero INT IDENTITY(1,1) 
	PRIMARY KEY,     
	DNI VARCHAR(20) NOT NULL UNIQUE,     
	nombre VARCHAR(50) NOT NULL,     
	apellidos VARCHAR(50) NOT NULL,     
	telefono VARCHAR(25) 
); 