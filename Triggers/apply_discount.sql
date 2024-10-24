DELIMITER //

CREATE TRIGGER apply_discount
AFTER UPDATE ON variant
FOR EACH ROW
BEGIN
    IF NEW.discount_id IS NOT NULL AND NEW.discount_id != OLD.discount_id THEN
        UPDATE variant
        SET price = price * (1 - (SELECT discount FROM discounts WHERE discount_id = NEW.discount_id))
        WHERE variant_id = NEW.variant_id;
    END IF;
END;
//

DELIMITER ;

select * from variant;

DROP TRIGGER IF EXISTS parkkavi.apply_discount;
