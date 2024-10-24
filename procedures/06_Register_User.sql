DROP PROCEDURE IF EXISTS register_user;
DELIMITER $$
CREATE PROCEDURE register_user (
    IN p_customer_name VARCHAR(255),
    IN p_customer_email VARCHAR(255),
    IN p_password_hash VARCHAR(255),
    IN p_phone_number VARCHAR(100)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    /* Insert customer details*/
    INSERT INTO customer (customer_name, customer_email, password_hash, customer_phone_number)
    VALUES
    (p_customer_name, p_customer_email, p_password_hash, p_phone_number);

    /* Return customer id */
    SELECT LAST_INSERT_ID() AS customer_id;
END$$
DELIMITER ;