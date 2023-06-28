CREATE VIEW dbo.vw_SKUPrice
AS
SELECT 
	ID,
	CODE,
	NAME,
       dbo.udf_GetSKUPrice(ID) AS SKUPrice
FROM dbo.SKU;
