create trigger dbo.TR_Basket_insert_update	
on dbo.Basket
after insert
as
begin
	set nocount on;
	

	UPDATE dbo.Basket
	SET DiscountValue = 
    CASE
        WHEN t1.id_sku_count >= 2 THEN dbo.Basket.value * 0.05
        ELSE 0
    END
	FROM 
	(SELECT id_sku, COUNT(*) AS id_sku_count
    FROM inserted
    GROUP BY id_sku) AS t1
	join
	inserted
	ON
	t1.id_sku = inserted.ID_SKU
	where dbo.Basket.ID = inserted.ID

end;
