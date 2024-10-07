DROP PROCEDURE IF EXISTS Update_Variant_Stock;
DELIMITER $$

CREATE PROCEDURE Update_Variant_Stock (
    IN p_variant_id INT,
    IN p_warehouse_id INT,
    IN p_quantity INT
)
BEGIN
    DECLARE v_available_quantity INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;
        SET v_available_quantity = Check_Variant_Availability(p_variant_id, p_warehouse_id);

        IF v_available_quantity >= p_quantity THEN
            /* Deducting from the warehouse */
            UPDATE Variant_Warehouse
            SET stock_count = stock_count - p_quantity
            WHERE variant_id = p_variant_id AND warehouse_id = p_warehouse_id;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Insufficient Stock';
        END IF;
    COMMIT;
END$$
DELIMITER ;