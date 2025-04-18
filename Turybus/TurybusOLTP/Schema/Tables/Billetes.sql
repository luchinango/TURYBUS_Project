﻿CREATE TABLE Operaciones.Billetes (
    id_billete INT IDENTITY(1,1) PRIMARY KEY,
    id_servicio INT NOT NULL,
    id_pasajero INT NOT NULL,
    id_empleado INT NOT NULL,
    fecha DATE NOT NULL,
    importe DECIMAL(10,2) NOT NULL,
    hora_salida TIME NOT NULL,
    hora_llegada TIME NOT NULL,

    [rowversion] TIMESTAMP NOT NULL, 
    CONSTRAINT FK_Billete_Servicio FOREIGN KEY (id_servicio) 
        REFERENCES Turismo.ServiciosDiarios(id_servicio),
    CONSTRAINT FK_Billete_Pasajero FOREIGN KEY (id_pasajero) 
        REFERENCES Operaciones.Pasajeros(id_pasajero),
    CONSTRAINT FK_Billete_Empleado FOREIGN KEY (id_empleado)
        REFERENCES Operaciones.Empleados(id_empleado)
);