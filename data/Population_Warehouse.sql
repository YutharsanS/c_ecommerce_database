-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Warehouse table
INSERT INTO warehouse (warehouse_id, warehouse_name, warehouse_location) VALUES
(1, 'Main Warehouse', 'Dallas'),
(2, 'Secondary Warehouse', 'Houston');
INSERT INTO warehouse (warehouse_id, warehouse_name, warehouse_location) VALUES
(3, 'East Coast Warehouse', 'Atlanta'),
(4, 'West Coast Warehouse', 'Los Angeles'),
(5, 'Northern Warehouse', 'Chicago'),
(6, 'Southern Warehouse', 'Miami'),
(7, 'Central Warehouse', 'Denver'),
(8, 'International Warehouse', 'New York'),
(9, 'Tech Warehouse', 'San Francisco'),
(10, 'Distribution Center', 'Seattle');


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
