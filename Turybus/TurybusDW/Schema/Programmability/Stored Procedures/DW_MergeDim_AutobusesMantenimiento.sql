CREATE PROCEDURE [dbo].[DW_MergeDim_AutobusesMantenimiento]
AS
BEGIN
    SET NOCOUNT ON;

    -- ACTUALIZAR REGISTROS EXISTENTES EN LA DIMENSIÓN
    UPDATE dim
    SET 
        dim.Matricula = stg.Matricula,
        dim.Modelo = stg.Modelo,
        dim.Fabricante = stg.Fabricante,
        dim.Plazas = stg.Plazas,
        dim.Caracteristicas = stg.Caracteristicas,
        dim.FechaRevision = stg.FechaRevision,
        dim.Diagnostico = stg.Diagnostico,
        dim.CodigoReparacion = stg.CodigoReparacion,
        dim.TiempoEmpleado = stg.TiempoEmpleado,
        dim.Comentario = stg.Comentario
    FROM [dbo].[Dim_AutobusesMantenimiento] dim
    INNER JOIN [Staging].AutobusesMantenimiento stg 
        ON dim.AutobusID = stg.AutobusID;  -- Se usa `AutobusID` como clave de negocio

    -- INSERTAR NUEVOS REGISTROS EN LA DIMENSIÓN
    INSERT INTO [dbo].[Dim_AutobusesMantenimiento] (
        AutobusID, Matricula, Modelo, Fabricante, Plazas, Caracteristicas,
        FechaRevision, Diagnostico, CodigoReparacion, TiempoEmpleado, Comentario
    )
    SELECT 
        stg.AutobusID, stg.Matricula, stg.Modelo, stg.Fabricante, stg.Plazas, stg.Caracteristicas,
        stg.FechaRevision, stg.Diagnostico, stg.CodigoReparacion, stg.TiempoEmpleado, stg.Comentario
    FROM [Staging].AutobusesMantenimiento stg
    LEFT JOIN [dbo].[Dim_AutobusesMantenimiento] dim 
        ON stg.AutobusID = dim.AutobusID
    WHERE dim.AutobusID IS NULL;  -- Solo inserta si no existe en la dimensión

END
GO
