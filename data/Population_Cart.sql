-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Cart table
INSERT INTO cart (cart_id, customer_id, created_at) VALUES
(1, 1, NOW()),
(3, 3, NOW());


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
