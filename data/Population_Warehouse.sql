-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Warehouse table
INSERT INTO warehouse (warehouse_id, warehouse_name, warehouse_location) VALUES
(1, 'Main Warehouse', 'Dallas'),
(2, 'Secondary Warehouse', 'Houston');



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
