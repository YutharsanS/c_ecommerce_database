-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Variant_Warehouse table
INSERT INTO Variant_Warehouse (variant_id, warehouse_id, stock_count) VALUES
(1, 1, 50),
(2, 1, 30),
(3, 1, 20),
(4, 1, 10),
(5, 1, 100),
(6, 2, 75);



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
