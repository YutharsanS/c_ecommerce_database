DELIMITER //

CREATE TRIGGER update_variant_stock
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    UPDATE variant_warehouse
    SET stock_count = stock_count - NEW.quantity
    WHERE variant_id = NEW.variant_id;
END;
//

DELIMITER ;