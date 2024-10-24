-- Inventory Status View
CREATE VIEW inventory_status AS
SELECT 
    p.product_id,
    p.product_name,
    v.variant_id,
    v.sku,
    w.warehouse_name,
    vw.stock_count,
    CASE 
        WHEN vw.stock_count = 0 THEN 'Out of Stock'
        WHEN vw.stock_count < 10 THEN 'Low Stock'
        ELSE 'In Stock'
    END as stock_status
FROM Product p
JOIN Variant v ON p.product_id = v.product_id
JOIN Variant_Warehouse vw ON v.variant_id = vw.variant_id
JOIN Warehouse w ON vw.warehouse_id = w.warehouse_id;

SELECT * FROM inventory_status;