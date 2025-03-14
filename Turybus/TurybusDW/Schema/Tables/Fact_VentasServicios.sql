CREATE TABLE Fact_VentasServicios (
    VentaServicioSK INT IDENTITY(1,1) PRIMARY KEY,  -- Surrogate Key
    Id_billete INT NOT NULL,
    ServicioSK INT NOT NULL,                        -- Surrogate Key de servicio
    FechaServicio DATE NOT NULL,
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
    FOREIGN KEY (ServicioSK) REFERENCES Dim_Servicios(ServicioSK),
    FOREIGN KEY (RutaSK) REFERENCES Dim_Rutas(RutaSK),
    FOREIGN KEY (AutobusSK) REFERENCES Dim_AutobusesMantenimiento(AutobusSK),
    FOREIGN KEY (ConductorSK) REFERENCES Dim_Conductores(ConductorSK),
    FOREIGN KEY (PasajeroSK) REFERENCES Dim_Pasajeros(PasajeroSK),
    FOREIGN KEY (EmpleadoSK) REFERENCES Dim_Empleados(EmpleadoSK),
    FOREIGN KEY (ParadaSK) REFERENCES Dim_Paradas(ParadaSK)
)