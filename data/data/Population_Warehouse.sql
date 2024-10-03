-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Warehouse table
INSERT INTO Warehouse (warehouse_id, warehouse_name, location) VALUES
(1, 'Main Warehouse', 'Dallas'),
(2, 'Secondary Warehouse', 'Houston');



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
