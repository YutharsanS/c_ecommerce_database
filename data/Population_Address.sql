-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Address table
INSERT INTO address (address_id, line_1, line_2, city, district, zip_code) VALUES
(1, '123 Main St', NULL, 'Dallas', 'Dallas County', '75001'),
(2, '456 Elm St', 'Apt 2B', 'Arlington', 'Tarrant County', '76010');



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
