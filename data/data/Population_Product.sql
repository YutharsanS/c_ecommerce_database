-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Product table
INSERT INTO Product (product_id, product_name, category_id, description) VALUES
(1, 'iPhone X', 3, 'Apple smartphone with advanced features'),
(2, 'Bose SoundLink Speaker', 4, 'Portable Bluetooth speaker with high-quality sound'),
(3, 'LEGO Star Wars Set', 6, 'Building set for Star Wars enthusiasts');



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
