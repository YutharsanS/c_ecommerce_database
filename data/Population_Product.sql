-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Product table
INSERT INTO product (product_id, product_name, description) VALUES
(1, 'iPhone X', 'Apple smartphone with advanced features'),
(2, 'Bose SoundLink Speaker', 'Portable Bluetooth speaker with high-quality sound'),
(3, 'LEGO Star Wars Set', 'Building set for Star Wars enthusiasts');



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
