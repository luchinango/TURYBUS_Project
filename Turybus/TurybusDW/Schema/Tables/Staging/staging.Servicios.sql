CREATE TABLE [Staging].[Servicios]
(
    ServicioSK INT NOT NULL , 
    HoraSalida TIME NOT NULL,
    HoraLlegada TIME NOT NULL,
    DiasOperacion VARCHAR(50) NOT NULL
);
GO