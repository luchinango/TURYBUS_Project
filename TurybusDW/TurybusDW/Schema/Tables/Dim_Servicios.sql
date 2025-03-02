CREATE TABLE Dim_Servicios (
    ServicioSK INT IDENTITY(1,1) PRIMARY KEY,  -- Surrogate Key
    ServicioID INT NOT NULL,                   -- Business Key
    HoraSalida TIME NOT NULL,
    HoraLlegada TIME NOT NULL,
    DiasOperacion VARCHAR(50) NOT NULL
)