-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate inventory table
UPDATE Variant_Warehouse SET stock_count = stock_count - 1 WHERE variant_id = 1 AND warehouse_id = 1;
UPDATE Variant_Warehouse SET stock_count = stock_count - 2 WHERE variant_id = 5 AND warehouse_id = 1;
UPDATE Variant_Warehouse SET stock_count = stock_count - 1 WHERE variant_id = 3 AND warehouse_id = 1;
UPDATE Variant_Warehouse SET stock_count = stock_count - 1 WHERE variant_id = 6 AND warehouse_id = 2;

-- Re-enable foreign key checks after data insertion


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
