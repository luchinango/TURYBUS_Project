CREATE FUNCTION Operaciones.fnTotalHorasViaje (@id_pasajero INT) 
RETURNS TIME 
AS 
BEGIN 
    DECLARE @total INT = 0;  -- Total en minutos 
    SELECT @total = SUM(DATEDIFF(MINUTE, hora_salida, hora_llegada)) 
    FROM Operaciones.Billetes 
    WHERE id_pasajero = @id_pasajero; 
    RETURN DATEADD(MINUTE, @total, '00:00'); 
END 
GO 