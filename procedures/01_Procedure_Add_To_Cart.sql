DROP PROCEDURE IF EXISTS `Procedure_Add_To_Cart`;
DELIMITER $$

CREATE PROCEDURE Procedure_Add_To_Cart (
    IN p_customer_id INT,
    IN p_variant_id INT,
    IN p_quantity INT
)
BEGIN
    DECLARE v_cart_id INT;
    DECLARE v_warehouse_id INT;
    DECLARE v_available_quantity INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;
        /* Getting respective customer id */
        SELECT cart_id INTO v_cart_id
        FROM Cart
        WHERE customer_id = p_customer_id
        LIMIT 1;

        /* If no cart exists, create new one */
        IF v_cart_id IS NULL THEN
            INSERT INTO Cart (customer_id, created_at)
            VALUES (p_customer_id, NOW());
            SET v_cart_id = LAST_INSERT_ID();
        END IF;

        /* Getting warehouse id */
        SET v_warehouse_id = GET_Warehouse_Id(p_variant_id);

        IF v_warehouse_id IS NULL THEN
            ROLLBACK;
            SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'INV - Warehouse not found';
        END IF;

        SET v_available_quantity = Check_Variant_Availability(p_variant_id, v_warehouse_id);

        /* Update the quantity */

        CALL Update_Variant_Stock(p_variant_id, v_warehouse_id, p_quantity);

        IF v_available_quantity >= p_quantity THEN
            /* Adding variant into cart */
            INSERT INTO Cart_Items(cart_id, variant_id, quantity)
            VALUES (v_cart_id, p_variant_id, p_quantity)
            ON DUPLICATE KEY UPDATE
                quantity = quantity + p_quantity;
        END IF;

    COMMIT;
END$$
DELIMITER ;