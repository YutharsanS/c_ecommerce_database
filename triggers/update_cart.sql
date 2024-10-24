SET FOREIGN_KEY_CHECKS = 0;

DELIMITER $$

CREATE TRIGGER update_cart_after_insert_update
AFTER INSERT ON cart_items
FOR EACH ROW
BEGIN
    CALL update_cart_total_price(NEW.cart_id);
END $$

CREATE TRIGGER update_cart_after_update
AFTER UPDATE ON cart_items
FOR EACH ROW
BEGIN
    CALL update_cart_total_price(NEW.cart_id);
END $$

CREATE TRIGGER update_cart_after_delete
AFTER DELETE ON cart_items
FOR EACH ROW
BEGIN
    CALL update_cart_total_price(OLD.cart_id);
END $$

DELIMITER ;

SET FOREIGN_KEY_CHECKS = 1;
