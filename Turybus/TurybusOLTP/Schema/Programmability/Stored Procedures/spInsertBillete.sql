CREATE PROCEDURE Operaciones.spInsertBillete 
    @id_servicio INT, 
    @id_pasajero INT, 
    @id_empleado INT,           -- Identificador del empleado que atendi� la venta 
    @fecha DATE, 
    @importe DECIMAL(10,2), 
    @hora_salida TIME, 
    @hora_llegada TIME 
AS 
BEGIN 
    BEGIN TRY 
        BEGIN TRANSACTION; 
            INSERT INTO Operaciones.Billetes (id_servicio, id_pasajero, id_empleado, fecha, importe, hora_salida, hora_llegada) 
            VALUES (@id_servicio, @id_pasajero, @id_empleado, @fecha, 
@importe, @hora_salida, @hora_llegada); 
        COMMIT TRANSACTION; 
    END TRY 
    BEGIN CATCH 
        ROLLBACK TRANSACTION; 
        RAISERROR('Error al insertar billete', 16, 1); 
    END CATCH 
END 
GO 