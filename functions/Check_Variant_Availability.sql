
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
    FROM Variant_Warehouse
    WHERE warehouse_id = f_warehouse_id AND variant_id = f_variant_id
    LIMIT 1;

    RETURN available_quantity;
END$$
DELIMITER ;