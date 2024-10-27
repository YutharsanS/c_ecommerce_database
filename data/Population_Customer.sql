-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Customer table
INSERT INTO customer (customer_id, password_hash, customer_name, customer_email, customer_phone_number, address_id, is_guest) VALUES
(1, 'hashed_password_1', 'John Doe', 'john.doe@example.com', '555-1234', 1, FALSE),
(2, 'hashed_password_2', 'Jane Smith', 'jane.smith@example.com', '555-5678', 2, FALSE),
(3, NULL, 'Guest User', 'guest.user@example.com', NULL, NULL, TRUE);



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
