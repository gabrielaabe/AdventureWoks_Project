--- Selecionar apenas datas maiores que 2013 com uso de WHERE e uso de JOIN com tabela customer para trazer informação de data de nascimento
CREATE 
OR ALTER VIEW FactInternetSales_v2 AS 
SELECT 
  fis.[ProductKey], 
  [EnglishProductCategoryName] AS 'Category', 
  [OrderDateKey], 
  [FullDateAlternateKey], 
  fis.[CustomerKey], 
  [BirthDate] AS 'Birth Date', 
  [PromotionKey], 
  [CurrencyKey], 
  [SalesTerritoryKey], 
  [SalesOrderNumber], 
  [OrderQuantity], 
  [UnitPrice], 
  [UnitPriceDiscountPct], 
  [DiscountAmount], 
  [TotalProductCost] AS 'Total Cost', 
  [SalesAmount] AS 'Sales Amount', 
  [TaxAmt] AS 'Tax Amount', 
  [Freight] AS 'Freight Cost' 
FROM 
  [AdventureWorksDW2019].[dbo].[FactInternetSales] fis 
  LEFT JOIN DimCustomer dc ON fis.CustomerKey = dc.CustomerKey 
  LEFT JOIN DimDate dt ON fis.OrderDateKey = dt.DateKey
  LEFT JOIN DimProduct dp ON fis.ProductKey = dp.ProductKey
  LEFT JOIN DimProductSubcategory dps ON dps.ProductSubcategoryKey = dp.ProductSubcategoryKey
  LEFT JOIN DimProductCategory dpc ON dps.ProductCategoryKey = dpc.ProductCategoryKey
WHERE 
  LEFT (OrderDateKey, 4) >= YEAR(
    GETDATE()
  ) -11---extrai os primeiros quatro caracteres da coluna OrderDateKey (que é assumido que seja uma string representando uma data no formato AAAAMMDD) e compara com o ano atual (YEAR(GETDATE())) subtraído de 8 anos.
