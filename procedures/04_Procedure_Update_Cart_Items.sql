DROP PROCEDURE IF EXISTS `Procedure_Update_Cart_Item_Quantity`;
DELIMITER $$

CREATE PROCEDURE Procedure_Update_Cart_Item_Quantity (
    IN p_customer_id INT,
    IN p_variant_id INT,
    IN p_quantity_change INT
)
BEGIN
    DECLARE v_cart_id INT;
    DECLARE v_current_quantity INT;
    DECLARE v_new_quantity INT;
    DECLARE v_available_quantity INT DEFAULT NULL;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    -- Validate quantity change (cannot be zero)
    IF p_quantity_change = 0 THEN
        SIGNAL SQLSTATE '45005' SET MESSAGE_TEXT = 'Quantity change cannot be zero.';
    END IF;

    START TRANSACTION;
        -- Get the customer's cart ID
        SET v_cart_id = get_cart_id(p_customer_id);

        -- Get the current quantity of the item in the cart
        SELECT quantity INTO v_current_quantity
        FROM cart_items
        WHERE cart_id = v_cart_id AND variant_id = p_variant_id
        LIMIT 1;

        IF v_current_quantity IS NULL THEN
            -- Item not found in the cart
            SIGNAL SQLSTATE '45007' SET MESSAGE_TEXT = 'Item not found in cart.';
        END IF;

        -- Calculate the new quantity
        SET v_new_quantity = v_current_quantity + p_quantity_change;

        -- Validate the new quantity
        IF v_new_quantity < 0 THEN
            SIGNAL SQLSTATE '45008' SET MESSAGE_TEXT = 'Resulting quantity cannot be negative.';
        END IF;

                -- Update or remove the item in the cart based on the new quantity
        IF v_new_quantity = 0 THEN
            -- Remove the item from the cart
            DELETE FROM cart_items
            WHERE cart_id = v_cart_id AND variant_id = p_variant_id;
        ELSE
            -- Update the item's quantity in the cart
            UPDATE cart_items
            SET quantity = v_new_quantity
            WHERE cart_id = v_cart_id AND variant_id = p_variant_id;
        END IF;
    COMMIT;
END$$
DELIMITER ;

-- CALL Procedure_Update_Cart_Item_Quantity(1, 1, -1);
