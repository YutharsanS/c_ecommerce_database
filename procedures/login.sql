DROP PROCEDURE IF EXISTS customer_login;
DELIMITER $$
CREATE PROCEDURE customer_login(
    IN p_email VARCHAR(100),
    IN p_password_hash VARCHAR(255)
)
BEGIN
    DECLARE v_customer_id INT;
    DECLARE v_customer_name VARCHAR(100);
    DECLARE v_is_guest BOOLEAN;

    -- Check if a customer exists with the given email and password hash
    SELECT customer_id, customer_name, is_guest
    INTO v_customer_id, v_customer_name, v_is_guest
    FROM customer
    WHERE email = p_email AND password_hash = p_password_hash
    LIMIT 1;

    -- If a customer is found, return the customer information
    IF v_customer_id IS NOT NULL THEN
        SELECT
            v_customer_id AS customer_id,
            v_customer_name AS customer_name,
            v_is_guest AS is_guest,
            'Login successful' AS message;
    ELSE
        -- If no customer is found, return an error message
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid email or password';
    END IF;
END$$
DELIMITER ;

-- INSERT INTO customer (password_hash, name, email, phone_number, is_guest)
-- VALUES ('hashed_password123', 'John Doe', 'joh@example.com', '1234567890', FALSE);

-- CALL customer_login('joh@example.com', 'hashed_password123');

-- CALL customer_login('joh@example.com', 'wrong_password');