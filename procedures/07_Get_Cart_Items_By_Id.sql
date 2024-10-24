-- Active: 1729174041098@@127.0.0.1@3306@c_ecommerce
DROP PROCEDURE IF EXISTS get_cart_items;
DELIMITER $$
CREATE PROCEDURE get_cart_items(
    IN p_cart_id INT
)
BEGIN
    SELECT variant_id, product_id, product_name, price, quantity FROM cart as c
    INNER JOIN cart_items USING (cart_id)
    INNER JOIN variant USING (variant_id)
    INNER JOIN product USING (product_id)
    WHERE c.cart_id = p_cart_id;
END$$

DELIMITER ;

-- CALL get_cart_items(1)