CREATE TABLE [Staging].[VentasServicios]
(
	VentaServicioSK INT NOT NULL,                            -- Surrogate Key
    Id_Billete INT NOT NULL,
    ServicioSK INT NOT NULL,                        -- Surrogate Key de servicio
    DateKey_billete INT NOT NULL,
    RutaSK INT NOT NULL,                            -- Surrogate Key de ruta
    AutobusSK INT NOT NULL,                             -- Surrogate Key de autobús mantenimiento
    ConductorSK INT NOT NULL,                           -- Surrogate Key de conductor
    DuracionMinutos_billete INT NOT NULL,
    DiasOperacion VARCHAR(50) NOT NULL,
    CantidadBilletesVendidos INT NOT NULL,
    IngresoTotal DECIMAL(10,2) NOT NULL,
    PasajeroSK INT NOT NULL,                            -- Surrogate Key de pasajero
    EmpleadoSK INT NOT NULL,                            -- Surrogate Key de empleado
    ParadaSK INT NOT NULL,                              -- Surrogate Key de parada

)
