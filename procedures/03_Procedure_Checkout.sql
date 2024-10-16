DROP PROCEDURE IF EXISTS Procedure_Checkout;
DELIMITER $$

CREATE PROCEDURE Procedure_Checkout (
    IN p_customer_id INT,
    IN p_payment_method VARCHAR(20),
    IN p_delivery_method VARCHAR(20),
    -- IN p_address_id INT,
    IN p_contact_email VARCHAR(100),
    IN p_contact_phone VARCHAR(20)
)
BEGIN
    DECLARE v_cart_id INT;
    DECLARE v_order_id INT;
    DECLARE v_payment_id INT;
    DECLARE v_variant_id INT;
    DECLARE v_quantity INT;
    DECLARE v_warehouse_id INT;
    DECLARE v_available_quantity INT;
    DECLARE v_address_id INT;

    DECLARE done INT DEFAULT FALSE;
    DECLARE cart_cursor CURSOR FOR
        SELECT variant_id, quantity FROM cart_items WHERE cart_id = v_cart_id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;
        /* Get the address id of the customer */
        SELECT address_id INTO v_address_id
        FROM customer
        WHERE customer_id = p_customer_id;

        /* Get the customer's cart */
        SELECT cart_id INTO v_cart_id
        FROM cart
        WHERE customer_id = p_customer_id
        LIMIT 1;

        IF v_cart_id IS NULL THEN
            SIGNAL SQLSTATE '45003' SET MESSAGE_TEXT = 'No items in cart';
        END IF;

        /* Create payment record */
        INSERT INTO payment (payment_method, amount)
        VALUES (p_payment_method, 0); -- Amount to be updated later
        SET v_payment_id = LAST_INSERT_ID();

        /* Create order */
        INSERT INTO orders(customer_id, address_id, payment_id, delivery_method, contact_email, contact_phone)
        VALUES (p_customer_id, v_address_id, v_payment_id, p_delivery_method, p_contact_email, p_contact_phone);
        SET v_order_id = LAST_INSERT_ID();

        /* Process each item in the cart */
        OPEN cart_cursor;

        read_loop: LOOP
            FETCH cart_cursor INTO v_variant_id, v_quantity;
            IF done THEN
                LEAVE read_loop;
            END IF;

            /* Get warehouse ID */
            SET v_warehouse_id = GET_Warehouse_Id(v_variant_id);

            /* Check stock availability with row-level locking */
            SELECT stock_count INTO v_available_quantity
            FROM variant_warehouse
            WHERE variant_id = v_variant_id AND warehouse_id = v_warehouse_id
            FOR UPDATE;

            IF v_available_quantity IS NULL THEN
                ROLLBACK;
                -- SIGNAL SQLSTATE '45006' SET MESSAGE_TEXT = CONCAT ('Stock information not found for variant ID ', v_variant_id);
            END IF;

            IF v_available_quantity < v_quantity THEN
                ROLLBACK;
                -- SIGNAL SQLSTATE '45007' SET MESSAGE_TEXT = CONCAT('Insufficient stock for variant ID ', v_variant_id, '. Available: ', v_available_quantity, ', Requested: ', v_quantity);
            END IF;

            /* Deduct stock */
            CALL Update_Variant_Stock(v_variant_id, v_warehouse_id, v_quantity);

            /* Add item to order */
            INSERT INTO order_items (order_id, variant_id, quantity)
            VALUES (v_order_id, v_variant_id, v_quantity);
        END LOOP;

        CLOSE cart_cursor;

        /* Calculate total amount */
        UPDATE payment
        SET amount = (
            SELECT SUM(v.price * ci.quantity)
            FROM cart_items ci
            JOIN variant v ON ci.variant_id = v.variant_id
            WHERE ci.cart_id = v_cart_id
        )
        WHERE payment_id = v_payment_id;

        /* Empty the cart */
        DELETE FROM cart_items WHERE cart_id = v_cart_id;
        DELETE FROM cart WHERE cart_id = v_cart_id;

    COMMIT;
END$$
DELIMITER ;

-- CALL Procedure_Checkout(1, 'Cash On Delivery', 'Delivery', 1, 'test@email.com', '0777777777');