-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Order_Items table
INSERT INTO Order_Items (order_id, variant_id, quantity) VALUES
(1, 1, 1),
(1, 5, 2);

-- Jane Smith's Order
INSERT INTO Order_Items (order_id, variant_id, quantity) VALUES
(2, 3, 1);

-- Guest User's Order
INSERT INTO Order_Items (order_id, variant_id, quantity) VALUES
(3, 6, 1);



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
