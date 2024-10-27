DROP PROCEDURE IF EXISTS process_guest_order;
DELIMITER $$
CREATE PROCEDURE process_guest_order(
    IN p_customer_name VARCHAR(100),
    IN p_customer_email VARCHAR(100),
    IN p_phone_number VARCHAR(20),
    IN p_payment_method VARCHAR(20),
    IN p_delivery_method VARCHAR(20),
    -- Address details
    IN p_line_1 VARCHAR(255),
    IN p_line_2 VARCHAR(255),
    IN p_city VARCHAR(100),
    IN p_district VARCHAR(100),
    IN p_zip_code VARCHAR(20),
    -- Cart items as JSON array
    IN p_cart_items JSON
)
BEGIN
    DECLARE v_customer_id INT;
    DECLARE v_address_id INT;
    DECLARE v_order_id INT;
    DECLARE v_payment_id INT;
    DECLARE v_total_amount DECIMAL(10,2) DEFAULT 0;
    DECLARE v_variant_id INT;
    DECLARE v_quantity INT;
    DECLARE v_item_price DECIMAL(10,2);
    DECLARE v_warehouse_id INT;
    DECLARE i INT DEFAULT 0;
    DECLARE v_items_count INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    -- Calculate total amount first
    SET v_items_count = JSON_LENGTH(p_cart_items);

    -- Validate items count
    IF v_items_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cart is empty';
    END IF;

    -- Pre-calculate total amount and validate stock
    WHILE i < v_items_count DO
        SET v_variant_id = JSON_EXTRACT(p_cart_items, CONCAT('$[', i, '].variant_id'));
        SET v_quantity = JSON_EXTRACT(p_cart_items, CONCAT('$[', i, '].quantity'));

        -- Get current price
        SELECT price INTO v_item_price
        FROM variant
        WHERE variant_id = v_variant_id;

        IF v_item_price IS NULL THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid variant ID';
        END IF;

        -- Validate stock availability
        SET v_warehouse_id = GET_Warehouse_Id(v_variant_id);

        -- Add to total
        SET v_total_amount = v_total_amount + (v_item_price * v_quantity);

        SET i = i + 1;
    END WHILE;

    -- Validate total amount
    IF v_total_amount <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Order total must be greater than 0';
    END IF;

    -- 1. Create payment record first (now that we have the total)
    INSERT INTO payment (
        payment_method,
        amount,
        payment_date
    ) VALUES (
        p_payment_method,
        v_total_amount,
        NOW()
    );
    SET v_payment_id = LAST_INSERT_ID();

    -- 2. Create guest customer record
    INSERT INTO customer (
        customer_name,
        customer_email,
        customer_phone_number,
        password_hash,
        is_guest
    ) VALUES (
        p_customer_name,
        p_customer_email,
        p_phone_number,
        UUID(), -- temporary hash
        TRUE
    );
    SET v_customer_id = LAST_INSERT_ID();

    -- 3. Create address record
    INSERT INTO address (
        line_1,
        line_2,
        city,
        district,
        zip_code
    ) VALUES (
        p_line_1,
        p_line_2,
        p_city,
        p_district,
        p_zip_code
    );
    SET v_address_id = LAST_INSERT_ID();

    -- Update customer with address
    UPDATE customer
    SET address_id = v_address_id
    WHERE customer_id = v_customer_id;

    -- 4. Create order record
    INSERT INTO orders (
        customer_id,
        address_id,
        payment_id,
        delivery_method,
        contact_email,
        contact_phone,
        order_date
    ) VALUES (
        v_customer_id,
        v_address_id,
        v_payment_id,
        p_delivery_method,
        p_customer_email,
        p_phone_number,
        NOW()
    );
    SET v_order_id = LAST_INSERT_ID();

    -- 5. Process cart items (second pass for actual insertion)
    SET i = 0;
    WHILE i < v_items_count DO
        SET v_variant_id = JSON_EXTRACT(p_cart_items, CONCAT('$[', i, '].variant_id'));
        SET v_quantity = JSON_EXTRACT(p_cart_items, CONCAT('$[', i, '].quantity'));

        -- Update stock
        SET v_warehouse_id = GET_Warehouse_Id(v_variant_id);
        CALL Update_Variant_Stock(v_variant_id, v_warehouse_id, v_quantity);

        -- Add to order items
        INSERT INTO order_items (
            order_id,
            variant_id,
            quantity
        ) VALUES (
            v_order_id,
            v_variant_id,
            v_quantity
        );

        SET i = i + 1;
    END WHILE;

    COMMIT;

    -- Return order details
    SELECT
        o.order_id,
        o.delivery_estimate,
        p.amount as total_amount,
        p.payment_method,
        JSON_OBJECT(
            'name', c.customer_name,
            'email', c.customer_email,
            'phone', c.customer_phone_number,
            'address', JSON_OBJECT(
                'line1', a.line_1,
                'line2', a.line_2,
                'city', a.city,
                'district', a.district,
                'zipCode', a.zip_code
            )
        ) as customer_details
    FROM orders o
    JOIN customer c ON o.customer_id = c.customer_id
    JOIN address a ON o.address_id = a.address_id
    JOIN payment p ON o.payment_id = p.payment_id
    WHERE o.order_id = v_order_id;
END$$
DELIMITER ;

-- CALL process_guest_order(
--     'John Doe', -- customer name
--     'john@example.com', -- email
--     '1234567890', -- phone
--     'Cash on Delivery', -- payment method
--     'Delivery', -- delivery method
--     '123 Main St', -- address line 1
--     'Apt 4B', -- address line 2
--     'Dallas', -- city
--     'Manhattan', -- district
--     '10001', -- zip code
--     '[
--         {"variant_id": 1, "quantity": 2},
--         {"variant_id": 3, "quantity": 1}
--     ]' -- cart items as JSON
-- );