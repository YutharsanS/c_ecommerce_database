DROP FUNCTION IF EXISTS get_cart_id;

DELIMITER $$

CREATE FUNCTION get_cart_id (f_customer_id INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_cart_id INT;

    SELECT cart_id INTO v_cart_id
    FROM cart
    WHERE customer_id = f_customer_id
    LIMIT 1;

    IF v_cart_id IS NULL THEN
    -- No cart exists for the customer
    SIGNAL SQLSTATE '45006' SET MESSAGE_TEXT = 'Cart does not exist for the customer.';
    END IF;

    RETURN v_cart_id;
END$$

DELIMITER ;