-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Payment table
INSERT INTO Payment (payment_id, payment_method, amount, payment_date) VALUES
(1, 'Card', 1399.97, NOW()),       -- John Doe's payment (adjusted amount)
(2, 'Cash on Delivery', 1099.99, NOW()), -- Jane Smith's payment
(3, 'Card', 89.99, NOW());         -- Guest User's payment



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
