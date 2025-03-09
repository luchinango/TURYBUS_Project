CREATE TABLE [Staging].[Pasajeros]
(
    PasajeroSK INT NOT NULL,  -- Surrogate Key
    DNI VARCHAR(20) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Telefono VARCHAR(25)
)
