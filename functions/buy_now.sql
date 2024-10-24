DROP PROCEDURE IF EXISTS Buy_Now;
DELIMITER $$
CREATE PROCEDURE Buy_Now(
    IN p_customer_id INT,
    IN p_variant_id INT,
    IN p_quantity INT,
    IN p_warehouse_id INT,
    IN p_payment_method ENUM('Cash on Delivery', 'Card'),
    IN p_delivery_method ENUM('Store Pickup', 'Delivery')
)
BEGIN
    DECLARE v_price DECIMAL(10,2);
    DECLARE v_total_amount DECIMAL(10,2);
    DECLARE v_order_id INT;
    DECLARE v_payment_id INT;
    DECLARE v_address_id INT;
    DECLARE v_stock_count INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    -- Lock the customer row to prevent concurrent modifications
    SELECT address_id INTO v_address_id 
    FROM Customer 
    WHERE customer_id = p_customer_id 
    FOR UPDATE;

    -- Lock the variant row and get the price
    SELECT price INTO v_price 
    FROM Variant 
    WHERE variant_id = p_variant_id 
    FOR UPDATE;

    -- Lock the variant_warehouse row and get the current stock count
    SELECT stock_count INTO v_stock_count
    FROM Variant_Warehouse
    WHERE variant_id = p_variant_id AND warehouse_id = p_warehouse_id
    FOR UPDATE;

    -- Check if there's enough stock
    IF v_stock_count < p_quantity THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient stock';
    END IF;

    -- Calculate total amount
    SET v_total_amount = v_price * p_quantity;

    -- Create payment record
    INSERT INTO Payment (payment_method, amount)
    VALUES (p_payment_method, v_total_amount);
    SET v_payment_id = LAST_INSERT_ID();

    -- Create order
    INSERT INTO Orders (customer_id, address_id, payment_id, delivery_method, contact_email, contact_phone)
    SELECT customer_id, v_address_id, v_payment_id, p_delivery_method, email, phone_number
    FROM Customer
    WHERE customer_id = p_customer_id;
    SET v_order_id = LAST_INSERT_ID();

    -- Add order item
    INSERT INTO Order_Items (order_id, variant_id, quantity)
    VALUES (v_order_id, p_variant_id, p_quantity);

    -- Update inventory
    UPDATE Variant_Warehouse
    SET stock_count = stock_count - p_quantity
    WHERE variant_id = p_variant_id AND warehouse_id = p_warehouse_id;

    COMMIT;

    -- Return order details
    SELECT 
        o.order_id, 
        o.customer_id, 
        o.order_date, 
        o.delivery_method, 
        p.payment_method, 
        p.amount AS total_amount,
        'Order placed successfully' AS message
    FROM Orders o
    JOIN Payment p ON o.payment_id = p.payment_id
    WHERE o.order_id = v_order_id;

END$$
DELIMITER ;


-- checking

-- -- Insert test data
-- INSERT INTO Category (category_name) VALUES ('Test Category');
-- INSERT INTO Product (product_name, category_id, description) VALUES ('Test Product', 1, 'A test product');
-- INSERT INTO Variant (product_id, sku, price, weight) VALUES (1, 'TEST-SKU', 100.00, 1.5);
-- INSERT INTO Warehouse (warehouse_name, location) VALUES ('Test Warehouse', 'Test Location');
-- INSERT INTO Variant_Warehouse (variant_id, warehouse_id, stock_count) VALUES (1, 2, 10);
-- INSERT INTO City (city_name, is_main_city) VALUES ('Test City', TRUE);
-- INSERT INTO Address (line_1, city, zip_code) VALUES ('123 Test St', 'Test City', '12345');
-- INSERT INTO Customer (password_hash, name, email, phone_number, address_id, is_guest) 
-- VALUES ('testhash', 'Test Customer', 'test@example.com', '1234567890', 1, FALSE);

-- -- Check initial data
-- SELECT * FROM Variant_Warehouse WHERE variant_id = 1;
-- SELECT * FROM Customer WHERE customer_id = 1;

-- CALL Buy_Now(1, 1, 2, 1, 'Card', 'Delivery');

-- -- Check results
-- SELECT * FROM Orders ORDER BY order_id DESC LIMIT 1;
-- SELECT * FROM Order_Items WHERE order_id = (SELECT MAX(order_id) FROM Orders);
-- SELECT * FROM Payment ORDER BY payment_id DESC LIMIT 1;
-- SELECT * FROM Variant_Warehouse WHERE variant_id = 1;

-- CALL Buy_Now(1, 1, 40, 1, 'Card', 'Delivery');


-- -- This should raise an error

-- START TRANSACTION;
-- CALL Buy_Now(1, 1, 3, 1, 'Card', 'Delivery');
-- -- Don't commit yet
-- START TRANSACTION;
-- CALL Buy_Now(1, 1, 4, 1, 'Cash on Delivery', 'Store Pickup');
-- -- Don't commit yet

-- commit;

-- SELECT * FROM Orders ORDER BY order_id DESC LIMIT 2;
-- SELECT * FROM Order_Items WHERE order_id IN (SELECT order_id FROM Orders ORDER BY order_id DESC LIMIT 2);
-- SELECT * FROM Payment ORDER BY payment_id DESC LIMIT 2;
-- SELECT * FROM Variant_Warehouse WHERE variant_id = 1;