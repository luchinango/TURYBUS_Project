@echo off

echo Creando subcarpetas dentro de TURYBUS_Project...

REM Crear la carpeta Scripts y sus subcarpetas
if not exist Scripts md Scripts
if not exist Scripts\DDL md Scripts\DDL
if not exist Scripts\DML md Scripts\DML

REM Crear carpetas para lógica de negocio y documentación
if not exist StoredProcedures md StoredProcedures
if not exist UserDefinedFunctions md UserDefinedFunctions
if not exist Triggers md Triggers
if not exist Vistas md Vistas
if not exist Consultas md Consultas
if not exist Documentacion md Documentacion

echo Estructura de subcarpetas para TURYBUS creada exitosamente.
pause
