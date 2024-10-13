-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Variant table
INSERT INTO variant (variant_id, product_id, sku, price, weight, discount_id) VALUES
(1, 1, 'IPX-16GB-BLK', 999.99, 0.174, 1),    -- iPhone X 16GB Black
(2, 1, 'IPX-16GB-RED', 999.99, 0.174, NULL), -- iPhone X 16GB Red
(3, 1, 'IPX-32GB-BLK', 1099.99, 0.174, 2),   -- iPhone X 32GB Black
(4, 1, 'IPX-32GB-RED', 1099.99, 0.174, NULL),-- iPhone X 32GB Red
(5, 2, 'BSS-BLK', 199.99, 1.2, NULL),        -- Bose Speaker Black
(6, 3, 'LSW-SET', 89.99, 2.5, NULL);         -- LEGO Star Wars Set



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
