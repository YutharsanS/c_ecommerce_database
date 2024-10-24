DROP PROCEDURE IF EXISTS Update_customer_address;
DELIMITER $$
CREATE PROCEDURE Update_customer_address (
    IN p_customer_id INT,
    IN p_line_1 VARCHAR(255),
    IN p_line_2 VARCHAR(255),
    IN p_city VARCHAR(100),
    IN p_district VARCHAR(100),
    IN p_zip_code VARCHAR(20)
)
BEGIN
    DECLARE v_address_id INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    -- Check if the customer exists
    IF NOT EXISTS (SELECT 1 FROM customer WHERE customer_id = p_customer_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'customer does not exist';
    END IF;

    -- Check if the city exists
    IF NOT EXISTS (SELECT 1 FROM city WHERE city_name = p_city) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'city does not exist';
    END IF;

    -- Check if the customer already has an address
    SELECT address_id INTO v_address_id
    FROM customer
    WHERE customer_id = p_customer_id;

    IF v_address_id IS NULL THEN
        -- If no address exists, insert a new one
        INSERT INTO address (line_1, line_2, city, district, zip_code)
        VALUES (p_line_1, p_line_2, p_city, p_district, p_zip_code);

        SET v_address_id = LAST_INSERT_ID();

        -- Update the customer with the new address_id
        UPDATE customer
        SET address_id = v_address_id
        WHERE customer_id = p_customer_id;
    ELSE
        -- If address exists, update it
        UPDATE address
        SET
            line_1 = p_line_1,
            line_2 = p_line_2,
            city = p_city,
            district = p_district,
            zip_code = p_zip_code
        WHERE address_id = v_address_id;
    END IF;

    COMMIT;
END$$
DELIMITER ;


-- checking works


-- INSERT INTO City (city_name, is_main_city) VALUES ('New York', TRUE);

-- INSERT INTO Customer (password_hash, name, email, phone_number, is_guest)
-- VALUES ('hashed_password', 'John Doe', 'john@example.com', '1234567890', FALSE);

-- CALL Update_Customer_Address(
--     1,  -- customer_id (adjust this to match your inserted customer's ID)
--     '123 Main St',  -- line_1
--     'Apt 4B',  -- line_2
--     'New York',  -- city
--     'Manhattan',  -- district
--     '10001'  -- zip_code
-- );

-- SELECT c.customer_id, c.name, a.*
-- FROM Customer c
-- JOIN Address a ON c.address_id = a.address_id
-- WHERE c.customer_id = 1;  -- adjust this to match your customer's ID

-- CALL Update_Customer_Address(
--     1,  -- customer_id (same as before)
--     '456 Elm St',  -- new line_1
--     'Suite 7C',  -- new line_2
--     'New York',  -- city (same as before)
--     'Brooklyn',  -- new district
--     '11201'  -- new zip_code
-- );

-- SELECT c.customer_id, c.name, a.*
-- FROM Customer c
-- JOIN Address a ON c.address_id = a.address_id
-- WHERE c.customer_id = 1;  -- adjust this to match your customer's ID

-- CALL Update_Customer_Address(
--     1,  -- customer_id
--     '789 Oak St',  -- line_1
--     NULL,  -- line_2
--     'NonexistentCity',  -- city (this should cause an error)
--     'SomeDistrict',  -- district
--     '12345'  -- zip_code
-- );