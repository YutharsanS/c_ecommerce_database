DELIMITER //

CREATE TRIGGER update_product_attributes
AFTER INSERT ON variant_attribute
FOR EACH ROW
BEGIN
    INSERT INTO product_attribute (product_id, attribute_id, attribute_value)
    SELECT v.product_id, NEW.attribute_id, NEW.attribute_value
    FROM variant v
    WHERE v.variant_id = NEW.variant_id
    ON DUPLICATE KEY UPDATE attribute_value = NEW.attribute_value;
END;
//

DELIMITER ;
