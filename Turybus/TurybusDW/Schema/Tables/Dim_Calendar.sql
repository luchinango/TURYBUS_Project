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
