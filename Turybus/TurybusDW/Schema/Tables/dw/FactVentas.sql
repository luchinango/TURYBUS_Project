CREATE TABLE dw.FactVentas (
    BilleteID INT PRIMARY KEY,         -- Derivado de staging.Billetes.id_billete
    FechaSK INT NOT NULL,             -- FK para dbo.DimFecha
    PasajeroSK INT NOT NULL,        -- FK para dbo.DimPasajeros
    EmpleadoSK INT NULL,             -- FK para dbo.DimEmpleado (puede ser nulo)
    ServicioSK INT NOT NULL,          -- FK para dbo.DimServicios
    RutaSK INT NOT NULL,            -- FK para dbo.DimRuta
    AutobusSK INT NOT NULL,              -- FK para dbo.DimAutobus
    ConductorSK INT NOT NULL,           -- FK para dbo.DimConductor
    Importe DECIMAL(10,2) NOT NULL,
    HoraSalida TIME NOT NULL,
    HoraLlegada TIME NOT NULL,
    CONSTRAINT FK_Fact_DimFecha FOREIGN KEY (FechaSK) REFERENCES dbo.DimFecha(FechaSK),
    CONSTRAINT FK_Fact_DimPasajeros FOREIGN KEY (PasajeroSK) REFERENCES dbo.DimPasajeros(PasajeroSK),
    CONSTRAINT FK_Fact_DimEmpleado FOREIGN KEY (EmpleadoSK) REFERENCES dbo.DimEmpleado(EmpleadoSK),
    CONSTRAINT FK_Fact_DimServicios FOREIGN KEY (ServicioSK) REFERENCES dbo.DimServicios(ServicioSK),
    CONSTRAINT FK_Fact_DimRuta FOREIGN KEY (RutaSK) REFERENCES dbo.DimRuta(RutaSK),
    CONSTRAINT FK_Fact_DimAutobus FOREIGN KEY (AutobusSK) REFERENCES dbo.DimAutobus(AutobusSK),
    CONSTRAINT FK_Fact_DimConductor FOREIGN KEY (ConductorSK) REFERENCES dbo.DimConductor(ConductorSK)
);
GO