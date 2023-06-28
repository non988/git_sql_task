CREATE PROCEDURE dbo.usp_MakeFamilyPurchase
	@FamilySurName varchar(255)
AS
BEGIN
	DECLARE @id INT; 
	DECLARE @sumval DECIMAL(18, 2)
	
	SELECT TOP 1 @id = id
	FROM dbo.Family
	WHERE SurName = @FamilySurName;
	
	IF @id IS NULL
	BEGIN
		RAISERROR('Surname does not exist.', 16, 1);
		RETURN; 
	END
	
	SELECT @sumval = SUM(Value)
	FROM dbo.Basket
	WHERE ID_Family = @id;

	UPDATE dbo.Family
	set BudgetValue = BudgetValue - @sumval;
END;

