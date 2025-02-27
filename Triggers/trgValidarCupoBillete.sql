USE TURYBUS_DB;
GO

IF EXISTS (SELECT * 
           FROM sys.triggers 
           WHERE name = 'trgValidarCupoBillete')
BEGIN
    DROP TRIGGER Operaciones.trgValidarCupoBillete;
END
GO

CREATE TRIGGER Operaciones.trgValidarCupoBillete
ON Operaciones.Billetes
AFTER INSERT
AS
BEGIN
    DECLARE @id_servicio INT, @pasajerosActuales INT, @plazas INT, @id_autobus INT;

    SELECT TOP 1 @id_servicio = id_servicio FROM inserted;

    SELECT @pasajerosActuales = COUNT(*)
    FROM Operaciones.Billetes
    WHERE id_servicio = @id_servicio;

    SELECT @id_autobus = id_autobus 
    FROM Turismo.ServiciosDiarios 
    WHERE id_servicio = @id_servicio;

    SELECT @plazas = plazas 
    FROM Operaciones.Autobuses 
    WHERE id_autobus = @id_autobus;

    IF (@pasajerosActuales > @plazas)
    BEGIN
        RAISERROR('Excedido el cupo del autobús para este servicio.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END
GO
