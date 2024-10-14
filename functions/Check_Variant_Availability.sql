DROP FUNCTION IF EXISTS `Check_Variant_Availability`;

DELIMITER $$
CREATE FUNCTION Check_Variant_Availability(f_variant_id INT, f_warehouse_id INT)
RETURNS INT
NOT DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE available_quantity INT;

    /* Get current quantity */
    SELECT stock_count INTO available_quantity
    FROM variant_warehouse
    WHERE warehouse_id = f_warehouse_id AND variant_id = f_variant_id
    LIMIT 1;

    IF available_quantity IS NULL THEN
    SIGNAL SQLSTATE '45003' SET MESSAGE_TEXT = 'INV - Variant entry not found';
    END IF;

    RETURN available_quantity;
END$$

DELIMITER ;
