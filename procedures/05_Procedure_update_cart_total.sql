DELIMITER $$

CREATE PROCEDURE update_cart_total_price(p_cart_id INT)
BEGIN
    UPDATE cart
    SET total_price = (
        SELECT COALESCE(SUM(ci.quantity * v.price), 0)
        FROM cart_items ci
        JOIN variant v ON ci.variant_id = v.variant_id
        WHERE ci.cart_id = p_cart_id
    )
    WHERE cart_id = p_cart_id;
END $$

DELIMITER ;
