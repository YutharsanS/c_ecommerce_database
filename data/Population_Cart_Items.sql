-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Cart_Items table
INSERT INTO Cart_Items (cart_id, variant_id, quantity) VALUES
(1, 1, 1),
(1, 5, 2);

-- Guest User's Cart
INSERT INTO Cart_Items (cart_id, variant_id, quantity) VALUES
(3, 6, 1);



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
