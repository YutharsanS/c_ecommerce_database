DROP FUNCTION IF EXISTS `Get_Warehouse_Id`;

DELIMITER $$

CREATE FUNCTION `Get_Warehouse_Id`(f_variant_id INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_warehouse_id INT;
    /* Finding right warehouse -- could be changed later */
    SELECT warehouse_id INTO v_warehouse_id
    FROM variant_warehouse
    WHERE variant_id = f_variant_id
    ORDER BY stock_count DESC
    LIMIT 1;

    IF v_warehouse_id IS NULL THEN
        SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'Warehouse not found for variant.';
    END IF;

    RETURN v_warehouse_id;
END
$$

DELIMITER ;
