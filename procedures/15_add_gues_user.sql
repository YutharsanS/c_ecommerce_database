DROP PROCEDURE IF EXISTS add_guest_user;
DELIMITER $$
CREATE PROCEDURE add_guest_user(
    IN p_customer_name VARCHAR(255),
    IN p_customer_email VARCHAR(255)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    /* Insert customer details*/
    INSERT INTO customer (customer_name, customer_email, is_guest)
    VALUES
    (p_customer_name, p_customer_email, 1);

    /* Return customer id */
    SELECT LAST_INSERT_ID() AS customer_id;
END$$
DELIMITER ;

-- CALL add_guest_user('guest_abc', 'abc@gmail.com');