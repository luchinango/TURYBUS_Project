# **Proyecto TURYBUS** 🚍
---

Implementación del sistema de gestión y análisis de datos para la empresa de transporte **Turybus**.  
Este proyecto forma parte del módulo de *Data Management & Business Intelligence*, enfocado en la gestión de datos de **autobuses, rutas, pasajeros y ventas**.

---

### 📖 Más detalles sobre el modelado y estructura del proyecto

Para conocer más sobre la arquitectura, modelado y estructura del proyecto **TURYBUS**, consulta la documentación completa en el siguiente enlace:

🔗 [Documentación del Proyecto](https://docs.google.com/document/d/10H9aQ5S33HvZorjhvyLHt-MemCIvxBwW9bISywuYGm4/edit?usp=drive_link)

---

### **📌Integrantes del Proyecto Turybus**

| **Avatar** | <img src="https://github.com/noportor.png" width="60"> | <img src="https://github.com/cbellob.png" width="60"> | <img src="https://github.com/oscarloayza.png" width="60"> | <img src="https://github.com/josephus-scriptor.png" width="60"> | <img src="https://github.com/luchinango.png" width="60"> |
|-----------------------------|------------------------|------------------------|------------------------|--------------------------|-----------------------|
| **Nombre**                  | Nicolas Oporto        | Carolina Bello        | Oscar Loayza          | Joseph Thenier          | Luis Martinez        |
| **GitHub**                  | [@noportor](https://github.com/noportor) | [@cbellob](https://github.com/cbellob) | [@oscarloayza](https://github.com/oscarloayza) | [@josephus-scriptor](https://github.com/josephus-scriptor) | [@luchinango](https://github.com/luchinango) |




---

## 🚀 **Instalación y Configuración**

Antes de comenzar con la instalación y configuración del Proyecto Turybus, asegúrate de tener las siguientes herramientas instaladas en tu equipo.

---

| Herramienta/Extensión | Descripción | Enlace de Descarga |
|------------------------|-------------|---------------------|
| **Git** | Sistema de control de versiones para gestionar el código del proyecto. | [Descargar](https://git-scm.com/) |
| **Visual Studio Community 2022** | Entorno de desarrollo para la creación y administración de proyectos de BI. | [Descargar](https://visualstudio.microsoft.com/downloads/) |
| **SQL Server 2022** | Motor de base de datos para gestionar la información del proyecto. | [Descargar](https://www.microsoft.com/en-us/sql-server/sql-server-downloads) |
| **SQL Server Management Studio (SSMS)** | Herramienta de administración para SQL Server. | [Descargar](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver15) |
| **Microsoft Data Tools Integration Services (SSIS)** | Extensión para desarrollar y ejecutar paquetes SSIS en Visual Studio. | [Descargar](https://marketplace.visualstudio.com/items?itemName=SSIS.MicrosoftDataToolsIntegrationServices) |
| **Microsoft Analysis Services Modeling Projects** | Herramienta para modelado y gestión de Analysis Services en Visual Studio. | [Descargar](https://marketplace.visualstudio.com/items?itemName=ProBITools.MicrosoftAnalysisServicesModelingProjects2022) |
| **Power BI Desktop** | Herramienta de análisis y visualización de datos. | [Descargar](https://www.microsoft.com/en-us/download/details.aspx?id=58494) |


---

## 📥 Clonar el Repositorio
Para clonar este repositorio, ejecuta el siguiente comando en tu terminal:

```bash
git clone https://github.com/luchinango/TURYBUS_Project.git
```

---
## ⚠ **Creación de Bases de Datos en SQL Server Management Studio (SSMS)**

Antes de realizar cualquier despliegue, es necesario crear las bases de datos en **SQL Server** utilizando **SQL Server Management Studio (SSMS)**.

### 🔹 **Pasos para Crear las Bases de Datos**
1️⃣ **Abrir SQL Server Management Studio (SSMS)** y conectarse al servidor.  
2️⃣ **Ejecutar los siguientes comandos en una nueva consulta:**



```sql
CREATE DATABASE TURYBUS_DB;
GO
```
```sql
CREATE DATABASE TurybusDW;
GO
```
3️⃣ Verificar que las bases de datos se hayan creado correctamente en el explorador de objetos de SQL Server.
4️⃣ Continuar con el despliegue de los sistemas en Visual Studio.

---

## 🚀 Deploy OLTP

### 🔹 **Opción 1: Desplegar desde Visual Studio**
1️⃣ **Abrir la solución de Visual Studio** desde:
```sh
TURYBUS_Project\Turybus\Turybus.sln
```
2️⃣ **Ejecutar el Deploy** desde Visual Studio (`Build > Deploy`).  
3️⃣ **Verificar en SQL Server** que la base de datos y sus objetos se crearon correctamente.  

### 🔹 **Opción 2: Restaurar desde Backup**
1️⃣ **Abrir SQL Server Management Studio (SSMS)**.  
2️⃣ **Ir a "Bases de datos" > Clic derecho > Restaurar Base de Datos**.  
3️⃣ **Seleccionar "Desde un archivo de respaldo (.bak)"**.  
4️⃣ **Elegir el archivo ubicado en:** 
```sh
 TURYBUS_Project\Turybus\Turybus.sln
```

5️⃣ **Ejecutar la restauración** y verificar que la base de datos esté lista.

---

## 🚀 Deploy Data Warehouse

### 🔹 **Opción 1: Desplegar desde Visual Studio**
1️⃣ **Abrir la solución de Visual Studio** desde:
```sh
TURYBUS_Project\Turybus\TurybusDW.sln`
```
2️⃣ **Ejecutar el Deploy** desde Visual Studio (`Build > Deploy`).  
3️⃣ **Verificar en SQL Server** que las tablas y los datos se hayan cargado correctamente.  

### 🔹 **Opción 2: Restaurar desde Backup**
1️⃣ **Abrir SQL Server Management Studio (SSMS)**.  
2️⃣ **Ir a "Bases de datos" > Clic derecho > Restaurar Base de Datos**.  
3️⃣ **Seleccionar "Desde un archivo de respaldo (.bak)"**.  
4️⃣ **Elegir el archivo ubicado en:** 
```sh
TURYBUS_Project\Turybus\Backup\TurybusDW.bak
```
5️⃣ **Ejecutar la restauración** y verificar que la base de datos esté lista.



---

## 🚀 Deploy Integration Services (SSIS)

### 🔹 **Opción 1: Desplegar desde Visual Studio**
1️⃣ **Abrir la solución de Visual Studio** desde:
```sh
TURYBUS_Project\Turybus\TurybusETL.sln
```
2️⃣ **Ejecutar los paquetes de integración (`.dtsx`) en el siguiente orden**:

- 📂`AutobusesMantenimiento.dtsx`
- 📂`Conductores.dtsx`
- 📂`Empleado.dtsx`
- 📂`Paradas.dtsx`
- 📂`Pasajeros.dtsx`
- 📂`Rutas.dtsx`
- 📂`Servicios.dtsx`
- 📂`VentasServicios.dtsx`
  
3️⃣ **Validar la ejecución de los paquetes** en SSIS y verificar la carga en el Data Warehouse.  

### 🔹 **Opción 2: Restaurar desde Backup**
1️⃣ **Abrir SQL Server Management Studio (SSMS)**.  
2️⃣ **Abrir SQL Server Integration Services (SSIS) y desplegar el paquete**.  
3️⃣ **Importar el paquete `.ispac` desde la ruta:**
```sh
TURYBUS_Project\Turybus\Backup\TurybusETL.ispac
```
4️⃣ **Ejecutar el paquete en SQL Server Agent o manualmente en SSIS**.

## ⚡ (Opcional) Configurar un Job en SQL Server Agent

Para programar la ejecución automática de los paquetes SSIS, sigue estos pasos:

### 🔹 Crear el Job en SQL Server Agent
1️⃣ **Abrir SQL Server Management Studio (SSMS)** y expandir `SQL Server Agent`.  
2️⃣ **Clic derecho en `Jobs` > `New Job...`**.  
3️⃣ En la pestaña **General**, asignar un nombre al Job (`Turybus_ETL_Job`).  
4️⃣ Ir a la pestaña **Steps** y hacer clic en `New...`.  

### 🔹 Configurar un Step para ejecutar SSIS
1️⃣ En el campo **Type**, seleccionar `SQL Server Integration Services Package`.  
2️⃣ En **Run as**, elegir `SQL Server Agent Service Account`.  
3️⃣ En **Server**, ingresar la instancia de SQL Server.  
4️⃣ En **Package Source**, elegir `File System` y buscar los paquetes `.dtsx`.  
5️⃣ En **Command Line Parameters**, agregar opciones si es necesario.  
6️⃣ Hacer clic en `OK`.  

### 🔹 Configurar la Programación del Job
1️⃣ Ir a la pestaña **Schedules** y hacer clic en `New...`.  
2️⃣ Configurar la **frecuencia** (`Diaria`, `Semanal`, `Mensual`).  
3️⃣ Especificar la **hora de ejecución** (`Ejemplo: Todos los días a las 02:00 AM`).  
4️⃣ Hacer clic en `OK`.  

### 🔹 Activar y Probar el Job
1️⃣ **Guardar el Job** y asegurarse de que `SQL Server Agent` está `Running`.  
2️⃣ **Ejecutar el Job manualmente** (`Clic derecho en el Job > Start Job at Step`).  
3️⃣ **Revisar los logs en `Job Activity Monitor`** para verificar errores o confirmaciones.  

---

## 🚀 Deploy OLAP (Cubo SSAS)

### 🔹 **Opción 1: Desplegar desde Visual Studio**
1️⃣ **Abrir la solución de Visual Studio** desde:
```sh
TURYBUS_Project\Turybus\TurybusOLAP.sln
```  
2️⃣ **Ejecutar el Deploy** desde Visual Studio (`Build > Deploy`).  
3️⃣ **Verificar en SSAS** que el cubo se haya procesado correctamente y probar consultas MDX o Power BI.  

### 🔹 **Opción 2: Restaurar desde Backup**
1️⃣ **Abrir SQL Server Management Studio (SSMS)** y conectar con **SQL Server Analysis Services (SSAS)**.  
2️⃣ **Ir a "Bases de datos OLAP" > Clic derecho > Restaurar Base de Datos**.  
3️⃣ **Seleccionar "Desde un archivo de respaldo (.abf)"**.  
4️⃣ **Elegir el archivo ubicado en:** 
```sh
TURYBUS_Project\Turybus\Backup\TurybusOLAP.abf
```

---

## 📊 Visualización en Power BI

### 🔹 Pasos para abrir Power BI
1️⃣ **Abrir Power BI Desktop** en tu computadora.  
2️⃣ **Abrir el archivo `.pbix`. desde la ruta:**
```sh
TURYBUS_Project\Turybus\TurybusVisuals\TurybusVisuals.pbix
```
3️⃣ **Actualizar los datos** (`Refresh`) para asegurarte de que reflejan la información más reciente.  
4️⃣ **Explorar los reportes e indicadores** de la solución **TURYBUS**.  


---

# 📄 Licencia

Este proyecto está bajo la licencia **MIT**, lo que permite su uso, modificación y distribución sin restricciones significativas.  
Consulta el archivo [`LICENSE`](LICENSE) para más detalles.


