DELIMITER //

CREATE TRIGGER update_cart
AFTER INSERT ON cart_items
FOR EACH ROW
BEGIN
    UPDATE cart
    SET total_price = (
        SELECT SUM(ci.quantity * v.price)
        FROM cart_items ci
        JOIN variant v ON ci.variant_id = v.variant_id
        WHERE ci.cart_id = NEW.cart_id
    )
    WHERE cart_id = NEW.cart_id;
END;
//

CREATE TRIGGER update_cart_on_update
AFTER UPDATE ON cart_items
FOR EACH ROW
BEGIN
    UPDATE cart
    SET total_price = (
        SELECT SUM(ci.quantity * v.price)
        FROM cart_items ci
        JOIN variant v ON ci.variant_id = v.variant_id
        WHERE ci.cart_id = NEW.cart_id
    )
    WHERE cart_id = NEW.cart_id;
END;
//

DELIMITER ;
