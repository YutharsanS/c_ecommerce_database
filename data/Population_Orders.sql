-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Orders table
INSERT INTO orders (order_id, customer_id, address_id, payment_id, order_date, delivery_estimate, delivery_method, contact_email, contact_phone) VALUES
(1, 1, 1, 1, NOW(), DATE_ADD(NOW(), INTERVAL 5 DAY), 'Delivery', 'john.doe@example.com', '555-1234'),
(2, 2, 2, 2, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY), 'Delivery', 'jane.smith@example.com', '555-5678'),
(3, 3, NULL, 3, NOW(), DATE_ADD(NOW(), INTERVAL 5 DAY), 'Store Pickup', 'guest.user@example.com', NULL);



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
