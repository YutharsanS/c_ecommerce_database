DELIMITER //
CREATE TRIGGER trg_variant_price_check
BEFORE INSERT ON Variant
FOR EACH ROW
BEGIN
    IF NEW.price < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Price cannot be negative';
    END IF;
END //
DELIMITER ;
