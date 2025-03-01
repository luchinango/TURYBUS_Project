CREATE PROCEDURE Seguridad.spRegistrarRevision
@matricula_autobus VARCHAR(20),
@fecha_revision DATE,
@diagnostico VARCHAR(500),
@id_revision INT OUTPUT
AS
BEGIN
SET NOCOUNT ON;
BEGIN TRY
BEGIN TRANSACTION;
INSERT INTO Seguridad.Revisiones (matricula_autobus, fecha_revision, diagnostico)
VALUES (@matricula_autobus, @fecha_revision, @diagnostico);
SET @id_revision = SCOPE_IDENTITY();
COMMIT TRANSACTION;
END TRY
BEGIN CATCH
IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
END CATCH
END
GO