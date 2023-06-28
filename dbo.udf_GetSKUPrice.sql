CREATE FUNCTION dbo.udf_GetSKUPrice (@ID_SKU INT)
RETURNS DECIMAL(18, 2)
AS
BEGIN
	DECLARE @price DECIMAL(18, 2);

	SELECT @price = ROUND(CAST(sum(value) as decimal(18, 2)) / sum(quantity), 2)
	FROM dbo.Basket
	WHERE ID_SKU = @ID_SKU

	RETURN @price
END;