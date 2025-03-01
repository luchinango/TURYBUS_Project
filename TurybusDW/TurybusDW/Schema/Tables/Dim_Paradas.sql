CREATE TABLE Dim_Paradas (
    ParadaSK INT IDENTITY(1,1) PRIMARY KEY,  -- Surrogate Key
    ParadaID INT NOT NULL,                   -- Business Key
    NombreLugar VARCHAR(100) NOT NULL,
    HoraPrevista TIME NOT NULL,
    Actividad VARCHAR(100),
    TiempoParada TIME
)