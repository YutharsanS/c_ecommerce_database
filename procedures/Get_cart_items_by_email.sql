-- Active: 1729174041098@@127.0.0.1@3306@c_ecommerce
DROP PROCEDURE IF EXISTS get_cart_items_by_email;
DELIMITER $$
CREATE PROCEDURE get_cart_items_by_email(
    IN p_email VARCHAR(100)
)
BEGIN
    DECLARE v_customer_id INT;
    DECLARE v_cart_id INT;
    SET v_customer_id = get_customer_id_with_email(p_email);
    SET v_cart_id = get_cart_id(v_customer_id);

    SELECT variant_id, product_id, product_name, price, quantity FROM cart as c
    INNER JOIN cart_items USING (cart_id)
    INNER JOIN variant USING (variant_id)
    INNER JOIN product USING (product_id)
    WHERE c.cart_id = v_cart_id;
END$$

DELIMITER ;

-- CALL get_cart_items_by_email('john.doe@example.com');u