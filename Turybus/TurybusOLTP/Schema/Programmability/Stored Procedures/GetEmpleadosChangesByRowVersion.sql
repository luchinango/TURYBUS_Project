CREATE PROCEDURE [dbo].[GetEmpleadosChangesByRowVersion]
(
   @startRow BIGINT,
   @endRow BIGINT
)
AS
BEGIN
    SELECT [id_empleado]
        ,[DNI]
        ,[nombre]
        ,[apellidos]
        ,[telefono]
        ,[email]
    FROM [Operaciones].[Empleados]
    WHERE [rowversion] > CONVERT(ROWVERSION, @startRow)
    AND [rowversion] <= CONVERT(ROWVERSION, @endRow)
END
GO
