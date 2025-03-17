-- Iniciar una transacción para mantener la integridad de datos
BEGIN TRANSACTION;

-- Verificar si la tabla ya existe y crearla si es necesario
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Dim_Calendar')
BEGIN
    CREATE TABLE dbo.Dim_Calendar (
        DateKey INT PRIMARY KEY,
        DateValue DATE,
        DayNumber INT,
        DayName NVARCHAR(20),
        MonthNumber INT,
        MonthName NVARCHAR(20),
        YearNumber INT,
        FiscalYear NVARCHAR(10),
        FiscalQuarter NVARCHAR(10),
        FiscalMonth NVARCHAR(10),
        FiscalWeek INT,
        FiscalWeekName NVARCHAR(10),
        DayOfWeek INT,
        DayOfYear INT,
        WeekOfYear INT,
        StartOfFiscalYear DATE,
        EndOfFiscalYear DATE
    );
END;

-- Definir parámetros de configuración fiscal
DECLARE @StartDate DATE = '2020-01-01';
DECLARE @EndDate DATE = '2030-12-31';
DECLARE @FirstFiscalMonth INT = 1;
DECLARE @CurrentDate DATE = @StartDate;

-- Insertar solo fechas que no existan ya en la tabla
WHILE @CurrentDate <= @EndDate
BEGIN
    IF NOT EXISTS (SELECT 1 FROM dbo.Dim_Calendar WHERE DateValue = @CurrentDate)
    BEGIN
        DECLARE @Year INT = YEAR(@CurrentDate);
        DECLARE @Month INT = MONTH(@CurrentDate);
        DECLARE @WeekOfYear INT = DATEPART(WEEK, @CurrentDate);
        DECLARE @DayOfYear INT = DATEPART(DAYOFYEAR, @CurrentDate);
        DECLARE @DayOfWeek INT = DATEPART(WEEKDAY, @CurrentDate);
        DECLARE @StartFiscalYear DATE, @EndFiscalYear DATE;
        DECLARE @FiscalYear INT, @FiscalQuarter NVARCHAR(10), @FiscalMonth NVARCHAR(10), @FiscalWeek INT, @FiscalWeekName NVARCHAR(10);

        -- Calcular año fiscal
        IF @Month >= @FirstFiscalMonth
            SET @FiscalYear = @Year;
        ELSE
            SET @FiscalYear = @Year - 1;

        -- Calcular trimestre fiscal
        SET @FiscalQuarter = 
            CASE 
                WHEN @Month >= @FirstFiscalMonth AND @Month < @FirstFiscalMonth + 3 THEN 'FQ1'
                WHEN @Month >= @FirstFiscalMonth + 3 AND @Month < @FirstFiscalMonth + 6 THEN 'FQ2'
                WHEN @Month >= @FirstFiscalMonth + 6 AND @Month < @FirstFiscalMonth + 9 THEN 'FQ3'
                ELSE 'FQ4'
            END;

        -- Calcular mes fiscal
        SET @FiscalMonth = CONCAT('FM', RIGHT('0' + CAST(@Month AS NVARCHAR(2)), 2));

        -- Calcular semana fiscal
        SET @FiscalWeek = DATEDIFF(WEEK, DATEFROMPARTS(@FiscalYear, @FirstFiscalMonth, 1), @CurrentDate) + 1;
        SET @FiscalWeekName = CONCAT('FW', RIGHT('0' + CAST(@FiscalWeek AS NVARCHAR(2)), 2));

        -- Calcular inicio y fin del año fiscal
        SET @StartFiscalYear = DATEFROMPARTS(@FiscalYear, @FirstFiscalMonth, 1);
        SET @EndFiscalYear = DATEADD(DAY, -1, DATEFROMPARTS(@FiscalYear + 1, @FirstFiscalMonth, 1));

        -- Insertar datos en Dim_Calendar
        INSERT INTO dbo.Dim_Calendar (
            DateKey, DateValue, DayNumber, DayName, MonthNumber, MonthName, 
            YearNumber, FiscalYear, FiscalQuarter, FiscalMonth, 
            FiscalWeek, FiscalWeekName, DayOfWeek, DayOfYear, WeekOfYear, 
            StartOfFiscalYear, EndOfFiscalYear
        )
        VALUES (
            CAST(FORMAT(@CurrentDate, 'yyyyMMdd') AS INT),
            @CurrentDate,
            DAY(@CurrentDate),
            DATENAME(WEEKDAY, @CurrentDate),
            @Month,
            DATENAME(MONTH, @CurrentDate),
            @Year,
            CONCAT('FY', @FiscalYear),
            @FiscalQuarter,
            @FiscalMonth,
            @FiscalWeek,
            @FiscalWeekName,
            @DayOfWeek,
            @DayOfYear,
            @WeekOfYear,
            @StartFiscalYear,
            @EndFiscalYear
        );
    END;

    -- Avanzar al siguiente día
    SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate);
END;

-- Confirmar los cambios
COMMIT TRANSACTION;
GO
