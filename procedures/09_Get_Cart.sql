DROP PROCEDURE IF EXISTS get_cart;

DELIMITER $$
CREATE PROCEDURE get_cart(
    IN p_customer_id INT
)
BEGIN
    SELECT * FROM cart
    WHERE cart.customer_id = p_customer_id;
END$$
DELIMITER ;

CALL get_cart(1);