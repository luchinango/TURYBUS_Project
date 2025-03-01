# Proyecto TURYBUS

## Descripción del Proyecto

TURYBUS es una empresa de transporte turístico que lanza una campaña estival ofreciendo servicios diarios para rutas seleccionadas. Cada servicio tiene un horario fijo y puede operar en días festivos o laborables. Los pasajeros reciben un billete con detalles del viaje y, para efectos promocionales, se registra el empleado que los atiende. También se llevan registros de revisiones y reparaciones de autobuses, con procedimientos específicos para su gestión.

El sistema permite:

1. **Gestionar Rutas e Itinerarios:**  
   - Tabla `Rutas` para la información de cada ruta (nombre, descripción, costo base, km recorridos).  
   - Tabla `Paradas` para representar el itinerario (lugares, hora prevista, actividad, tiempo de parada).

2. **Administrar Servicios Diarios:**  
   - Tabla `ServiciosDiarios` para programar las rutas con hora de salida, hora de llegada y días de operación.  
   - Asignar un autobús y un conductor a cada servicio.

3. **Registrar Pasajeros, Empleados y Billetes:**  
   - Tabla `Pasajeros` para la información de cada cliente (DNI, nombre, apellidos, teléfono).  
   - Tabla `Empleados` para el personal que atiende las ventas y se encarga de promociones.  
   - Tabla `Billetes` para los viajes contratados (incluye `id_empleado` para registrar quién atendió la venta).

4. **Controlar Autobuses y Conductores:**  
   - Tabla `Autobuses` (matrícula, modelo, fabricante, plazas, características).  
   - Tabla `Conductores` (DNI, nombre, apellidos, teléfono, dirección).  
   - Procedimiento para asignar autobuses y conductores a los servicios.

5. **Revisiones y Reparaciones de Autobuses:**  
   - Tabla `Revisiones` para registrar fecha, diagnóstico y matrícula del autobús.  
   - Tabla `Reparaciones` para detallar las reparaciones efectuadas (código, tiempo empleado, comentario).  
   - Procedimiento `spRegistrarRevision` para crear una revisión y devolver su identificador.

6. **Reportes y Consultas:**  
   - **Media de viajeros** por ruta y servicio diario.  
   - **Kilómetros diarios** por autobús y conductor (según la ruta asignada).  
   - **Total de horas de viaje** por pasajero (para premiar a los mejores usuarios).  
   - Uso de vistas, consultas y funciones definidas por el usuario.

---

## Tecnologías y Herramientas

- **SQL Server 2022 Developer Edition**: Motor de base de datos donde se despliega TURYBUS.  
- **SQL Server Management Studio (SSMS)**: Para ejecutar scripts, administrar la base de datos y probar la lógica.  
- **Visual Studio Community**: Para crear el proyecto de base de datos (`TURYBUS_OLTP.sqlproj`), organizar scripts y conectarse con Git.  
- **GitHub**: Repositorio principal del proyecto (por ejemplo, [https://github.com/luchinango/TURYBUS_Project](https://github.com/luchinango/TURYBUS_Project)).

---

## Estructura del Repositorio

    /TURYBUS_Project
    │
    ├── /Scripts
    │   ├── /DDL
    │   │   ├── 01_CreateDatabase.sql
    │   │   ├── 02_Rutas.sql
    │   │   ├── 03_Paradas.sql
    │   │   ├── 04_ServiciosDiarios.sql
    │   │   ├── 05_Pasajeros.sql
    │   │   ├── 06_Billetes.sql
    │   │   ├── 07_Autobuses.sql
    │   │   ├── 08_Conductores.sql
    │   │   ├── 09_Revisiones.sql
    │   │   └── 10_Reparaciones.sql
    │   │   └── 12_empleados.sql
    │   └── /DML
    │       └── 11_InsertDatosPrueba.sql
    │
    ├── /StoredProcedures
    │   ├── spInsertBillete.sql
    │   ├── spAsignarAutobusConductor.sql
    │   └── spRegistrarRevision.sql
    │
    ├── /UserDefinedFunctions
    │   └── fnTotalHorasViaje.sql
    │
    ├── /Triggers
    │   └── trgValidarCupoBillete.sql
    │
    ├── /Vistas
    │   └── Vw_PromedioViajeros.sql
    │
    ├── /Consultas
    │   ├── Consulta_KmDiarios.sql
    │   └── Consulta_HorasViaje.sql
    │
    ├── /Documentacion
    │   ├── TURYBUS_Diagrama_ER.pdf
    │   └── Guia_TURYBUS.pdf
    │
    ├── README.md
    └── TURYBUS.sln
---

## Distribución de Tareas

- **Caro**  
  - `09_Revisiones.sql`, `10_Reparaciones.sql`, `spRegistrarRevision.sql`.  
  - (Opcional) Tabla y lógica de **Empleados** si se decide que sea parte de Seguridad.

- **Luis**  
  - `07_Autobuses.sql`, `08_Conductores.sql`, `spAsignarAutobusConductor.sql`.

- **Oscar**  
  - `05_Pasajeros.sql`, `06_Billetes.sql` (con columna `id_empleado`), `spInsertBillete.sql`, `fnTotalHorasViaje.sql`, `Consulta_HorasViaje.sql`.

- **Nicolas**  
  - `04_ServiciosDiarios.sql`, `Vw_PromedioViajeros.sql`, `Consulta_KmDiarios.sql`, `trgValidarCupoBillete.sql`.

- **Joseph**  
  - `02_Rutas.sql`, `03_Paradas.sql`.

- **Script de Datos de Prueba (`11_InsertDatosPrueba.sql`)**: Coordinado por todo el equipo para insertar registros de ejemplo.

---

## Instrucciones de Despliegue

### 1. Configuración en GitHub

    1. **Creación del Repositorio**  
    - Luis crea el repositorio en [https://github.com/luchinango/TURYBUS_Project](https://github.com/luchinango/TURYBUS_Project).  
    - Da acceso al equipo para clonar y hacer commits.

    2. **Clonar el Repositorio**  
    ```bash
    git clone https://github.com/luchinango/TURYBUS_Project.git 

    3.	Estructura de Carpetas
        Verifica que la estructura esté igual a la descrita arriba.

    4.	Ramas y Pull Requests
        Cada miembro crea su rama para las tareas asignadas: 
        git checkout -b [nombre_usuario]_rutas
        Al terminar cambios: 
        git add .
        git commit -m "Creación de tabla Rutas"
        git push origin [nombre_usuario]_rutas
        Crear un Pull Request en GitHub para integrar los cambios a la rama principal.

### 2. SQL Server 2022 Developer Edition y SSMS

    1.	Instalación
        o	Instala SQL Server 2022 Developer Edition y SQL Server Management Studio (SSMS).

    2.	Creación de la Base de Datos
        o	Abre SSMS, conéctate a la instancia y ejecuta 01_CreateDatabase.sql para crear TURYBUS_DB.

    3.	Ejecución de Scripts DDL
        o	Ejecuta en orden los scripts en /Scripts/DDL/ (02_Rutas, 03_Paradas, 04_ServiciosDiarios, 05_Pasajeros, 06_Billetes, 07_Autobuses, 08_Conductores,      09_Revisiones, 10_Reparaciones, etc.).

    4.	Inserción de Datos de Prueba
        o	Ejecuta 11_InsertDatosPrueba.sql para poblar las tablas con ejemplos de rutas, paradas, pasajeros, empleados, billetes, autobuses, conductores, revisiones y reparaciones.

    5.	Despliegue de Procedimientos, Funciones y Triggers
        o	Ejecuta los archivos en /StoredProcedures/, /UserDefinedFunctions/ y /Triggers/ para habilitar la lógica de negocio (insertar billetes, asignar autobuses, registrar revisiones, validar cupo, etc.).

    6.	Visual Studio Community (Proyecto de Base de Datos)
        o	Abre TURYBUS.sln en Visual Studio.
        o	Usa el proyecto TURYBUS_OLTP.sqlproj para administrar y publicar los scripts de forma automática si lo deseas (opcional).

### 3. Verificación de Reportes y Lógica

    1.	Vw_PromedioViajeros.sql
    
        SELECT * FROM Reportes.Vw_PromedioViajeros;

        o	Verifica la media de viajeros por servicio y ruta.


    2.	Consulta_KmDiarios.sql
    
        -- Ver km recorridos según la ruta asignada a cada autobús

        SELECT a.matricula, a.modelo, s.id_servicio, s.hora_salida, s.hora_llegada, r.km_recorrido
        FROM Operaciones.Autobuses a
        INNER JOIN Turismo.ServiciosDiarios s ON a.id_autobus = s.id_autobus
        INNER JOIN Turismo.Rutas r ON s.id_ruta = r.id_ruta;


    3.	Consulta_HorasViaje.sql

        SELECT p.nombre, p.apellidos, Operaciones.fnTotalHorasViaje(p.id_pasajero) AS total_horas
        FROM Operaciones.Pasajeros p;

    4.	Empleados y Promociones
        o	Se registra el id_empleado en la tabla Billetes para rastrear quién realizó la venta.
        o	La lógica de promociones se puede implementar en la aplicación que consuma estos datos o con un procedimiento adicional si se desea.

    5.	Revisiones y Reparaciones
        o	Ejecutar spRegistrarRevision para crear una revisión y obtener el id_revision resultante.
        o	Insertar reparaciones relacionadas en la tabla Reparaciones.

    6.	Triggers y Transacciones
        o	Probar trgValidarCupoBillete insertando varios billetes para el mismo servicio y verificar que no se supere el número de plazas.
