CREATE TABLE [Staging].[Paradas]
(
    ParadaSK INT NOT NULL,
    NombreLugar VARCHAR(100) NOT NULL,
    HoraPrevista TIME NOT NULL,
    Actividad VARCHAR(100),
    TiempoParada TIME
)
