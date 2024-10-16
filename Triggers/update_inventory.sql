DELIMITER //

CREATE TRIGGER adjust_inventory_on_order_delete
BEFORE DELETE ON orders
FOR EACH ROW
BEGIN
    UPDATE variant_warehouse vw
    JOIN order_items oi ON vw.variant_id = oi.variant_id
    SET vw.quantity = vw.quantity + oi.quantity
    WHERE oi.order_id = OLD.order_id;

    DELETE FROM order_items WHERE order_id = OLD.order_id;
END;
//

DELIMITER ;
