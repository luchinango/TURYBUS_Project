CREATE TABLE Staging.AutobusesMantenimiento (
    AutobusSK INT NOT NULL ,  -- Surrogate Key
    AutobusID INT NOT NULL,                   -- Business Key
    Matricula VARCHAR(50) NOT NULL UNIQUE,    -- Matrícula del autobús
    Modelo VARCHAR(50) NOT NULL,              -- Modelo del autobús
    Fabricante VARCHAR(50) NOT NULL,          -- Fabricante del autobús
    Plazas INT NOT NULL,                      -- Número de plazas
    Caracteristicas VARCHAR(500),             -- Características del autobús
    FechaRevision DATE NOT NULL,              -- Fecha de última revisión
    Diagnostico VARCHAR(500) NOT NULL,        -- Diagnóstico de la revisión
    CodigoReparacion VARCHAR(20),             -- Código de reparación
    TiempoEmpleado INT,                        -- Tiempo empleado en la reparación
    Comentario VARCHAR(500)                   -- Comentarios adicionales
)