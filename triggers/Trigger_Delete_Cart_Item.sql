DROP TRIGGER IF EXISTS delete_cart_item_if_no_quantity;

DELIMITER $$
CREATE TRIGGER delete_cart_item_if_no_quantity
AFTER UPDATE ON cart_items
FOR EACH ROW
BEGIN
    IF NEW.quantity = 0 THEN
        /* Remove the item from the cart */
        DELETE FROM cart_items
        WHERE cart_id = NEW.cart_id AND variant_id = NEW.variant_id;
    END IF;
END $$

DELIMITER ;