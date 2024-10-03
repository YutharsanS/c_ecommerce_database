-- Disable foreign key checks to prevent issues during data insertion
SET FOREIGN_KEY_CHECKS = 0;

-- Populate City table
INSERT INTO City (city_name, is_main_city) VALUES
('Dallas', TRUE),
('Austin', TRUE),
('Houston', TRUE),
('San Antonio', TRUE),
('Fort Worth', FALSE),
('El Paso', FALSE),
('Arlington', FALSE);

-- Populate Warehouse table
INSERT INTO Warehouse (warehouse_id, warehouse_name, location) VALUES
(1, 'Main Warehouse', 'Dallas'),
(2, 'Secondary Warehouse', 'Houston');

-- Populate Discounts table
INSERT INTO Discounts (discount_id, discount) VALUES
(1, 10.00),  -- 10% discount
(2, 5.00);   -- 5% discount

-- Populate Category table
-- Parent categories
INSERT INTO Category (category_id, category_name, parent_category_id) VALUES
(1, 'Consumer Electronics', NULL),
(2, 'Toys', NULL);

-- Subcategories
INSERT INTO Category (category_id, category_name, parent_category_id) VALUES
(3, 'Mobile Phones', 1),
(4, 'Speakers', 1),
(5, 'Action Figures', 2),
(6, 'Educational Toys', 2);

-- Populate Attribute table
INSERT INTO Attribute (attribute_id, attribute_name) VALUES
(1, 'Color'),
(2, 'Storage Capacity'),
(3, 'Brand'),
(4, 'Operating System'),
(5, 'Battery Life'),
(6, 'Dimensions'),
(7, 'Age Group'),
(8, 'Material');

-- Populate Product table
INSERT INTO Product (product_id, product_name, category_id, description) VALUES
(1, 'iPhone X', 3, 'Apple smartphone with advanced features'),
(2, 'Bose SoundLink Speaker', 4, 'Portable Bluetooth speaker with high-quality sound'),
(3, 'LEGO Star Wars Set', 6, 'Building set for Star Wars enthusiasts');

-- Populate Product_Category table
INSERT INTO Product_Category (product_id, category_id) VALUES
(1, 3),
(2, 4),
(3, 6);

-- Populate Product_Attribute table
-- iPhone X (Product ID: 1)
INSERT INTO Product_Attribute (product_id, attribute_id, attribute_value) VALUES
(1, 3, 'Apple'),             -- Brand
(1, 4, 'iOS'),               -- Operating System
(1, 5, 'Up to 14 hours');    -- Battery Life

-- Bose SoundLink Speaker (Product ID: 2)
INSERT INTO Product_Attribute (product_id, attribute_id, attribute_value) VALUES
(2, 3, 'Bose'),              -- Brand
(2, 5, '8 hours'),           -- Battery Life
(2, 6, '5 x 5 x 5 inches');  -- Dimensions

-- LEGO Star Wars Set (Product ID: 3)
INSERT INTO Product_Attribute (product_id, attribute_id, attribute_value) VALUES
(3, 3, 'LEGO'),              -- Brand
(3, 7, '8+'),                -- Age Group
(3, 8, 'Plastic'),           -- Material
(3, 6, '15 x 10 x 5 inches');-- Dimensions

-- Populate Variant table
INSERT INTO Variant (variant_id, product_id, sku, price, weight, discount_id) VALUES
(1, 1, 'IPX-16GB-BLK', 999.99, 0.174, 1),    -- iPhone X 16GB Black
(2, 1, 'IPX-16GB-RED', 999.99, 0.174, NULL), -- iPhone X 16GB Red
(3, 1, 'IPX-32GB-BLK', 1099.99, 0.174, 2),   -- iPhone X 32GB Black
(4, 1, 'IPX-32GB-RED', 1099.99, 0.174, NULL),-- iPhone X 32GB Red
(5, 2, 'BSS-BLK', 199.99, 1.2, NULL),        -- Bose Speaker Black
(6, 3, 'LSW-SET', 89.99, 2.5, NULL);         -- LEGO Star Wars Set

-- Populate Variant_Attribute table
-- iPhone X Variants
INSERT INTO Variant_Attribute (variant_id, attribute_id, attribute_value) VALUES
(1, 1, 'Black'),   -- Color
(1, 2, '16GB'),    -- Storage Capacity
(2, 1, 'Red'),
(2, 2, '16GB'),
(3, 1, 'Black'),
(3, 2, '32GB'),
(4, 1, 'Red'),
(4, 2, '32GB');

-- Bose Speaker Variant
INSERT INTO Variant_Attribute (variant_id, attribute_id, attribute_value) VALUES
(5, 1, 'Black');

-- Populate Variant_Warehouse table
INSERT INTO Variant_Warehouse (variant_id, warehouse_id, stock_count) VALUES
(1, 1, 50),
(2, 1, 30),
(3, 1, 20),
(4, 1, 10),
(5, 1, 100),
(6, 2, 75);

-- Populate Address table
INSERT INTO Address (address_id, line_1, line_2, city, district, zip_code) VALUES
(1, '123 Main St', NULL, 'Dallas', 'Dallas County', '75001'),
(2, '456 Elm St', 'Apt 2B', 'Arlington', 'Tarrant County', '76010');

-- Populate Customer table
INSERT INTO Customer (customer_id, password_hash, name, email, phone_number, address_id, is_guest) VALUES
(1, 'hashed_password_1', 'John Doe', 'john.doe@example.com', '555-1234', 1, FALSE),
(2, 'hashed_password_2', 'Jane Smith', 'jane.smith@example.com', '555-5678', 2, FALSE),
(3, '', 'Guest User', 'guest.user@example.com', NULL, NULL, TRUE);

-- Populate Cart table
INSERT INTO Cart (cart_id, customer_id, created_at) VALUES
(1, 1, NOW()),
(2, 2, NOW()),
(3, 3, NOW());

-- Populate Cart_Items table
-- John Doe's Cart
INSERT INTO Cart_Items (cart_id, variant_id, quantity) VALUES
(1, 1, 1),
(1, 5, 2);

-- Jane Smith's Cart
INSERT INTO Cart_Items (cart_id, variant_id, quantity) VALUES
(2, 3, 1);

-- Guest User's Cart
INSERT INTO Cart_Items (cart_id, variant_id, quantity) VALUES
(3, 6, 1);

-- Populate Payment table
INSERT INTO Payment (payment_id, payment_method, amount, payment_date) VALUES
(1, 'Card', 1399.97, NOW()),       -- John Doe's payment (adjusted amount)
(2, 'Cash on Delivery', 1099.99, NOW()), -- Jane Smith's payment
(3, 'Card', 89.99, NOW());         -- Guest User's payment

-- Populate Orders table
INSERT INTO Orders (order_id, customer_id, address_id, payment_id, order_date, delivery_estimate, delivery_method, contact_email, contact_phone) VALUES
(1, 1, 1, 1, NOW(), DATE_ADD(NOW(), INTERVAL 5 DAY), 'Delivery', 'john.doe@example.com', '555-1234'),
(2, 2, 2, 2, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY), 'Delivery', 'jane.smith@example.com', '555-5678'),
(3, 3, NULL, 3, NOW(), DATE_ADD(NOW(), INTERVAL 5 DAY), 'Store Pickup', 'guest.user@example.com', NULL);

-- Populate Order_Items table
-- John Doe's Order
INSERT INTO Order_Items (order_id, variant_id, quantity) VALUES
(1, 1, 1),
(1, 5, 2);

-- Jane Smith's Order
INSERT INTO Order_Items (order_id, variant_id, quantity) VALUES
(2, 3, 1);

-- Guest User's Order
INSERT INTO Order_Items (order_id, variant_id, quantity) VALUES
(3, 6, 1);

-- Update inventory in Variant_Warehouse after orders
-- Decrease stock counts accordingly
UPDATE Variant_Warehouse SET stock_count = stock_count - 1 WHERE variant_id = 1 AND warehouse_id = 1;
UPDATE Variant_Warehouse SET stock_count = stock_count - 2 WHERE variant_id = 5 AND warehouse_id = 1;
UPDATE Variant_Warehouse SET stock_count = stock_count - 1 WHERE variant_id = 3 AND warehouse_id = 1;
UPDATE Variant_Warehouse SET stock_count = stock_count - 1 WHERE variant_id = 6 AND warehouse_id = 2;

-- Re-enable foreign key checks after data insertion
SET FOREIGN_KEY_CHECKS = 1;