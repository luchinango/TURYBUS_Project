CREATE TABLE [Staging].[VentasServicios]
(
	VentaServicioSK INT,                            -- Surrogate Key
    Id_Billete INT NOT NULL,
    ServicioSK INT NOT NULL,                        -- Surrogate Key de servicio
    FechaServicio DATE NOT NULL,
    RutaSK INT NOT NULL,                            -- Surrogate Key de ruta
    AutobusSK INT NULL,                             -- Surrogate Key de autobús mantenimiento
    ConductorSK INT NULL,                           -- Surrogate Key de conductor
    HoraSalida TIME NOT NULL,
    HoraLlegada TIME NOT NULL,
    DiasOperacion VARCHAR(50) NOT NULL,
    CantidadBilletesVendidos INT NOT NULL,
    IngresoTotal DECIMAL(10,2) NOT NULL,
    PasajeroSK INT NULL,                            -- Surrogate Key de pasajero
    EmpleadoSK INT NULL,                            -- Surrogate Key de empleado
    ParadaSK INT NULL,                              -- Surrogate Key de parada

)
