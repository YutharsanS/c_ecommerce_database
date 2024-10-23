DROP PROCEDURE IF EXISTS get_user_by_email;
DELIMITER $$
CREATE PROCEDURE get_user_by_email(
    IN p_customer_email VARCHAR(255)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    /* Return matching users*/
    SELECT * FROM customer where customer_email = p_customer_email;
END$$
DELIMITER ;

-- CALL get_user_by_email('guest.user@example.com');