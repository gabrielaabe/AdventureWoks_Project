-- Selecionando apenas as colunas que irei precisar / Fazendo Left Join para trazer a informação de Product Category (para isso, é necessário 1 fazer um left com a tabela Subcategory e depois com Product Category / LEFT join para trazer Subcatgory Name (chave subcategory key)
CREATE OR ALTER VIEW Product_v2 AS
SELECT 
  [ProductKey], 
  [EnglishProductName] AS 'Product Name', 
  [ProductAlternateKey] AS 'Product Item Code', 
  [EnglishProductSubcategoryName] AS 'Product Subcategory Name', 
  [EnglishProductCategoryName] AS 'Product Category Name', 
  [Color] AS 'Product Color', 
  [Size] AS 'Product Size', 
  [ProductLine], 
  [ModelName] AS 'Product Model Name', 
  [EnglishDescription] AS 'Product Description', 
  [Status] AS 'Product Status' 
FROM 
  [AdventureWorksDW2019].[dbo].[DimProduct] 
  LEFT JOIN DimProductSubcategory ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey 
  LEFT JOIN DimProductCategory ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey



