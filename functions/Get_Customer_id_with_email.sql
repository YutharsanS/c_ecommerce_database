DROP FUNCTION IF EXISTS get_customer_id_with_email;

DELIMITER $$

CREATE FUNCTION get_customer_id_with_email(f_email VARCHAR(100))
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_customer_id INT;

    SELECT customer_id INTO v_customer_id
    FROM customer
    WHERE customer_email = f_email
    LIMIT 1;

    IF v_customer_id IS NULL THEN
    -- No cart exists for the customer
    SIGNAL SQLSTATE '45006' SET MESSAGE_TEXT = 'Customer does not exist for the email.';
    END IF;

    RETURN v_customer_id;
END$$

DELIMITER ;

-- SELECT get_customer_id_with_email('yutharsansivabalan@gmail.com');