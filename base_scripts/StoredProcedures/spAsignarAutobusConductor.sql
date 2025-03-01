USE TURYBUS_DB;
GO

CREATE PROCEDURE Operaciones.spAsignarAutobusConductor
    @id_servicio INT,
    @id_autobus INT,
    @id_conductor INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
            UPDATE Turismo.ServiciosDiarios
            SET id_autobus = @id_autobus, 
                id_conductor = @id_conductor
            WHERE id_servicio = @id_servicio;
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        RAISERROR('Error al asignar autobús y conductor', 16, 1);
    END CATCH
END
GO
