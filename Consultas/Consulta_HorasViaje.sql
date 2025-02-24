--Consulta_HorasViaje
USE TURYBUS_DB; 
GO 

SELECT p.nombre, p.apellidos, Operaciones.fnTotalHorasViaje(p.id_pasajero) AS total_horas_viaje 
FROM Operaciones.Pasajeros p;
GO 
