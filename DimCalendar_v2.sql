-- Limpando Tabela de Data:
---Seleção apenas de colunas que serão úteis / Renomeando colunas / Criando coluna de ShortMonth /Aplicando where para selecionar apenas anos acima ou igual a 2013

---CREATE OR ALTER VIEW Date_v2 AS

SELECT 
  [DateKey], 
  [FullDateAlternateKey] AS Date, 
  [EnglishDayNameOfWeek] AS Day, 
  [WeekNumberOfYear] AS WeekNr, 
  [EnglishMonthName] AS Month,
  LEFT([EnglishMonthName],3) AS ShortMonth, 
  [MonthNumberOfYear] AS MonthNo, 
  [CalendarQuarter] AS Quarter, 
  [CalendarYear] AS Year
FROM 
  [AdventureWorksDW2019].[dbo].[DimDate]
WHERE [CalendarYear] >= 2013 AND DateKey = '20190229'

