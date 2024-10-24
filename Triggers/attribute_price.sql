DELIMITER //

CREATE TRIGGER auto_update_price
BEFORE INSERT ON variant
FOR EACH ROW
BEGIN
    DECLARE base_price DECIMAL(10,2);
    DECLARE attr_price_adjustment DECIMAL(10,2);
    
    -- Get the base price from the product table
    SELECT COALESCE(base_price, 0) INTO base_price
    FROM product
    WHERE product_id = NEW.product_id;
    
    -- Calculate price adjustment based on variant attributes
    SELECT COALESCE(SUM(pa.price_adjustment), 0) INTO attr_price_adjustment
    FROM variant_attribute va
    JOIN attribute a ON va.attribute_id = a.attribute_id
    JOIN product_attribute pa ON a.attribute_id = pa.attribute_id AND va.attribute_value = pa.attribute_value
    WHERE va.variant_id = NEW.variant_id;
    
    -- Set the new price
    SET NEW.price = base_price + attr_price_adjustment;
    
    -- Apply discount if applicable
    IF NEW.discount_id IS NOT NULL THEN
        SET NEW.price = NEW.price * (1 - (SELECT discount FROM discounts WHERE discount_id = NEW.discount_id));
    END IF;
END;
//

DELIMITER ;
