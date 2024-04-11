-- Especificando quais colunas quero manter na visão / Criando coluna de nome completo / Criando coluna Gender Descrip. / LEFT JOIN para buscar a cidade na tabela DimGeography / Ordenando tabela por Customer Key

CREATE OR ALTER VIEW Customer_v2 AS
SELECT 
  [CustomerKey], 
  [FirstName], 
  [LastName], 
  ([FirstName] + ' ' + [LastName]) AS FullName, 
  [BirthDate], 
  [MaritalStatus], 
  [Gender], 
  CASE WHEN Gender = 'M' THEN 'Male' ELSE 'Female' END AS 'Gender Descrip.',
  [DateFirstPurchase], 
  [EnglishCountryRegionName],
  [City] 
FROM 
  [AdventureWorksDW2019].[dbo].[DimCustomer] 
  LEFT JOIN DimGeography ON DimCustomer.GeographyKey = DimGeography.GeographyKey 

