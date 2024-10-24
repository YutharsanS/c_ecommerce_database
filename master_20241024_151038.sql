-- Master SQL file generated on Thu Oct 24 03:10:38 PM +0530 2024
DROP DATABASE IF EXISTS c_ecommerce;
CREATE DATABASE c_ecommerce;
USE c_ecommerce;


-- ============================================
-- Beginning of schema section
-- ============================================

-- File: schema/Address.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS address;

CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    line_1 VARCHAR(255) NOT NULL,
    line_2 VARCHAR(255),
    city VARCHAR(100) NOT NULL,
    district VARCHAR(100),
    zip_code VARCHAR(20),
    FOREIGN KEY (city) REFERENCES city(city_name)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: schema/Attribute.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS attribute;

CREATE TABLE attribute (
    attribute_id INT AUTO_INCREMENT PRIMARY KEY,
    attribute_name VARCHAR(100) NOT NULL
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: schema/Cart_Items.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS cart_items;

CREATE TABLE cart_items (
    cart_id INT NOT NULL,
    variant_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (cart_id, variant_id),
    FOREIGN KEY (cart_id) REFERENCES cart(cart_id),
    FOREIGN KEY (variant_id) REFERENCES variant(variant_id)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: schema/Cart.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS cart;

CREATE TABLE cart (
  cart_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  total_price DECIMAL(10, 2),
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: schema/Category.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS category;

CREATE TABLE category (
    category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    parent_category_id INT,
    FOREIGN KEY (parent_category_id) REFERENCES category(category_id)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: schema/City.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS city;

CREATE TABLE city (
    city_name VARCHAR(100) PRIMARY KEY,
    is_main_city BOOLEAN DEFAULT FALSE
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: schema/Customer.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS customer;

CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    password_hash VARCHAR(255) NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL UNIQUE,
    customer_phone_number VARCHAR(20),
    address_id INT,
    is_guest BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (address_id) REFERENCES address(address_id)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: schema/Discounts.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS discounts;

CREATE TABLE discounts (
    discount_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    discount DECIMAL(5, 2) NOT NULL
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: schema/Order_Items.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS order_items;

CREATE TABLE order_items (
    order_id INT NOT NULL,
    variant_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, variant_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (variant_id) REFERENCES variant(variant_id)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: schema/Orders.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    address_id INT,
    payment_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    delivery_estimate DATETIME,
    delivery_method ENUM('Store Pickup', 'Delivery') NOT NULL,
    contact_email VARCHAR(100) NOT NULL,
    contact_phone VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (payment_id) REFERENCES payment(payment_id)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: schema/Payment.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS payment;

CREATE TABLE payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    payment_method ENUM('Cash on Delivery', 'Card') NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: schema/Product_Attribute.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS product_attribute;

CREATE TABLE product_attribute (
    product_id INT NOT NULL,
    attribute_id INT NOT NULL,
    attribute_value VARCHAR(255) NOT NULL,
    PRIMARY KEY (product_id, attribute_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_id) REFERENCES attribute(attribute_id)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: schema/Product_Category.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS product_category;

CREATE TABLE product_category (
    product_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (product_id, category_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: schema/Product.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS product;

CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    description TEXT
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: schema/Variant_Attribute.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS variant_attribute;

CREATE TABLE variant_attribute (
    variant_id INT NOT NULL,
    attribute_id INT NOT NULL,
    attribute_value VARCHAR(255) NOT NULL,
    PRIMARY KEY (variant_id, attribute_id),
    FOREIGN KEY (variant_id) REFERENCES variant(variant_id),
    FOREIGN KEY (attribute_id) REFERENCES attribute(attribute_id)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: schema/Variant.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS variant;

CREATE TABLE variant (
    variant_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    sku VARCHAR(100) UNIQUE,
    price DECIMAL(10, 2) NOT NULL,
    weight DECIMAL(10, 2),
    discount_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (discount_id) REFERENCES discounts(discount_id)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: schema/Variant_Warehouse.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS variant_warehouse;

CREATE TABLE variant_warehouse (
    variant_id INT NOT NULL,
    warehouse_id INT NOT NULL,
    stock_count INT NOT NULL DEFAULT 0,
    PRIMARY KEY (variant_id, warehouse_id),
    FOREIGN KEY (variant_id) REFERENCES variant(variant_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse(warehouse_id)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: schema/Warehouse.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS warehouse;

CREATE TABLE warehouse (
    warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_name VARCHAR(100) NOT NULL,
    warehouse_location VARCHAR(255)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;



-- ============================================
-- Beginning of procedures section
-- ============================================

-- File: procedures/00_Update_Variant_Stock.sql
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
            UPDATE variant_warehouse
            SET stock_count = stock_count - p_quantity
            WHERE variant_id = p_variant_id AND warehouse_id = p_warehouse_id;
        ELSE
            SIGNAL SQLSTATE '45002'
            SET MESSAGE_TEXT = 'INV - Insufficient Stock';
        END IF;
    COMMIT;
END$$
DELIMITER ;

-- File: procedures/01_Procedure_Add_To_Cart.sql
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

    /* Validate quantity */
    IF p_quantity <= 0 THEN
        SIGNAL SQLSTATE '45004' SET MESSAGE_TEXT = 'Quantity must be a positive integer.';
    END IF;

    START TRANSACTION;
        /* Getting respective customer id */
        SELECT cart_id INTO v_cart_id
        FROM cart
        WHERE customer_id = p_customer_id
        LIMIT 1;

        /* If no cart exists, create new one */
        IF v_cart_id IS NULL THEN
            INSERT INTO cart (customer_id, created_at)
            VALUES (p_customer_id, NOW());
            SET v_cart_id = LAST_INSERT_ID();
        END IF;

        /* Adding variant into cart */
        INSERT INTO cart_items(cart_id, variant_id, quantity)
        VALUES (v_cart_id, p_variant_id, p_quantity)
        ON DUPLICATE KEY UPDATE
            quantity = quantity + p_quantity;
    COMMIT;
END$$
DELIMITER ;


-- CALL Procedure_Add_To_Cart(1, 3, 2);


-- File: procedures/02_Procedure_Fetch_Product.sql
DROP PROCEDURE IF EXISTS `procedure_fetch_product_information`;
DELIMITER $$

CREATE PROCEDURE procedure_fetch_product_information(
    IN p_product_id INT
)
BEGIN
    -- Fetch product details
    SELECT
        p.product_id,
        p.product_name,
        p.description
    FROM
        product p
    WHERE
        p.product_id = p_product_id;

    -- Fetch product variants
    SELECT
        v.variant_id,
        v.sku,
        v.price,
        v.weight,
        GROUP_CONCAT(CONCAT(a.attribute_name, ': ', va.attribute_value) SEPARATOR ', ') AS variant_attributes
    FROM
        variant v
        LEFT JOIN variant_attribute va ON v.variant_id = va.variant_id
        LEFT JOIN attribute a ON va.attribute_id = a.attribute_id
    WHERE
        v.product_id = p_product_id
    GROUP BY
        v.variant_id;

    -- Fetch product categories
    SELECT
        c.category_id,
        c.category_name
    FROM
        product_category pc
        INNER JOIN category c ON pc.category_id = c.category_id
    WHERE
        pc.product_id = p_product_id;

    -- Fetch inventory levels
    SELECT
        vw.warehouse_id,
        vw.variant_id,
        vw.stock_count
    FROM
        variant_warehouse vw
        INNER JOIN warehouse w ON vw.warehouse_id = w.warehouse_id
    WHERE
        vw.variant_id IN (SELECT variant_id FROM variant WHERE product_id = p_product_id);
END$$

DELIMITER ;


-- File: procedures/03_Procedure_Checkout.sql
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

-- File: procedures/04_Procedure_Update_Cart_Items.sql
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


-- File: procedures/05_Procedure_update_cart_total.sql
DROP PROCEDURE IF EXISTS update_cart_total_price;
DELIMITER $$

CREATE PROCEDURE update_cart_total_price(p_cart_id INT)
BEGIN
    UPDATE cart
    SET total_price = (
        SELECT COALESCE(SUM(ci.quantity * v.price), 0)
        FROM cart_items ci
        JOIN variant v ON ci.variant_id = v.variant_id
        WHERE ci.cart_id = p_cart_id
    )
    WHERE cart_id = p_cart_id;
END $$

DELIMITER ;


-- File: procedures/06_Register_User.sql
DROP PROCEDURE IF EXISTS register_user;
DELIMITER $$
CREATE PROCEDURE register_user (
    IN p_customer_name VARCHAR(255),
    IN p_customer_email VARCHAR(255),
    IN p_password_hash VARCHAR(255),
    IN p_phone_number VARCHAR(100)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    /* Insert customer details*/
    INSERT INTO customer (customer_name, customer_email, password_hash, customer_phone_number)
    VALUES
    (p_customer_name, p_customer_email, p_password_hash, p_phone_number);

    /* Return customer id */
    SELECT LAST_INSERT_ID() AS customer_id;
END$$
DELIMITER ;

-- File: procedures/07_Get_Cart_Items_By_Id.sql
-- Active: 1729174041098@@127.0.0.1@3306@c_ecommerce
DROP PROCEDURE IF EXISTS get_cart_items;
DELIMITER $$
CREATE PROCEDURE get_cart_items(
    IN p_cart_id INT
)
BEGIN
    SELECT variant_id, product_id, product_name, price, quantity FROM cart as c
    INNER JOIN cart_items USING (cart_id)
    INNER JOIN variant USING (variant_id)
    INNER JOIN product USING (product_id)
    WHERE c.cart_id = p_cart_id;
END$$

DELIMITER ;

-- CALL get_cart_items(1)

-- File: procedures/08_Delete_Cart_Item.sql
DROP PROCEDURE IF EXISTS delete_cart_item;

DELIMITER $$

CREATE PROCEDURE delete_cart_item(
    IN p_cart_id INT,
    IN p_variant_id INT
)
BEGIN
    DELETE FROM cart_items
    WHERE cart_id = p_cart_id
    AND
    variant_id = p_variant_id;
END$$
DELIMITER ;

-- CALL delete_cart_item(1, 5)

-- File: procedures/09_Get_Cart.sql
DROP PROCEDURE IF EXISTS get_cart;

DELIMITER $$
CREATE PROCEDURE get_cart(
    IN p_customer_id INT
)
BEGIN
    SELECT * FROM cart
    WHERE cart.customer_id = p_customer_id;
END$$
DELIMITER ;

CALL get_cart(1);

-- File: procedures/10_Get_Category.sql
DROP PROCEDURE IF EXISTS get_categories_with_name;

DELIMITER $$
CREATE PROCEDURE get_categories_with_name(
    IN p_category_name VARCHAR(100)
)
BEGIN
    SELECT * FROM categories_with_name_and_id
    WHERE category_name = p_category_name;
END$$

DELIMITER ;

--  ;


-- File: procedures/11_Search.sql
DROP PROCEDURE IF EXISTS search;

DELIMITER $$
CREATE PROCEDURE search(
    IN p_search_term VARCHAR(100),
    IN p_limit INT,
    IN p_offset INT
)
BEGIN
    -- Concatenate wildcards with the search term
    SET p_search_term = CONCAT('%', p_search_term, '%');

    SELECT * FROM product
    WHERE product_name LIKE p_search_term
    LIMIT p_limit
    OFFSET p_offset;
END$$

DELIMITER ;


-- File: procedures/customer_address.sql
DROP PROCEDURE IF EXISTS Update_customer_address;
DELIMITER $$
CREATE PROCEDURE Update_customer_address (
    IN p_customer_id INT,
    IN p_line_1 VARCHAR(255),
    IN p_line_2 VARCHAR(255),
    IN p_city VARCHAR(100),
    IN p_district VARCHAR(100),
    IN p_zip_code VARCHAR(20)
)
BEGIN
    DECLARE v_address_id INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    -- Check if the customer exists
    IF NOT EXISTS (SELECT 1 FROM customer WHERE customer_id = p_customer_id) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'customer does not exist';
    END IF;

    -- Check if the city exists
    IF NOT EXISTS (SELECT 1 FROM city WHERE city_name = p_city) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'city does not exist';
    END IF;

    -- Check if the customer already has an address
    SELECT address_id INTO v_address_id
    FROM customer
    WHERE customer_id = p_customer_id;

    IF v_address_id IS NULL THEN
        -- If no address exists, insert a new one
        INSERT INTO address (line_1, line_2, city, district, zip_code)
        VALUES (p_line_1, p_line_2, p_city, p_district, p_zip_code);

        SET v_address_id = LAST_INSERT_ID();

        -- Update the customer with the new address_id
        UPDATE customer
        SET address_id = v_address_id
        WHERE customer_id = p_customer_id;
    ELSE
        -- If address exists, update it
        UPDATE address
        SET
            line_1 = p_line_1,
            line_2 = p_line_2,
            city = p_city,
            district = p_district,
            zip_code = p_zip_code
        WHERE address_id = v_address_id;
    END IF;

    COMMIT;
END$$
DELIMITER ;


-- checking works


-- INSERT INTO City (city_name, is_main_city) VALUES ('New York', TRUE);

-- INSERT INTO Customer (password_hash, name, email, phone_number, is_guest)
-- VALUES ('hashed_password', 'John Doe', 'john@example.com', '1234567890', FALSE);

-- CALL Update_Customer_Address(
--     1,  -- customer_id (adjust this to match your inserted customer's ID)
--     '123 Main St',  -- line_1
--     'Apt 4B',  -- line_2
--     'New York',  -- city
--     'Manhattan',  -- district
--     '10001'  -- zip_code
-- );

-- SELECT c.customer_id, c.name, a.*
-- FROM Customer c
-- JOIN Address a ON c.address_id = a.address_id
-- WHERE c.customer_id = 1;  -- adjust this to match your customer's ID

-- CALL Update_Customer_Address(
--     1,  -- customer_id (same as before)
--     '456 Elm St',  -- new line_1
--     'Suite 7C',  -- new line_2
--     'New York',  -- city (same as before)
--     'Brooklyn',  -- new district
--     '11201'  -- new zip_code
-- );

-- SELECT c.customer_id, c.name, a.*
-- FROM Customer c
-- JOIN Address a ON c.address_id = a.address_id
-- WHERE c.customer_id = 1;  -- adjust this to match your customer's ID

-- CALL Update_Customer_Address(
--     1,  -- customer_id
--     '789 Oak St',  -- line_1
--     NULL,  -- line_2
--     'NonexistentCity',  -- city (this should cause an error)
--     'SomeDistrict',  -- district
--     '12345'  -- zip_code
-- );

-- File: procedures/Get_Users_By_Email.sql
DROP PROCEDURE IF EXISTS get_user_by_email;
DELIMITER $$
CREATE PROCEDURE get_user_by_email(
    IN p_customer_email VARCHAR(255)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    /* Return matching users*/
    SELECT * FROM customer where customer_email = p_customer_email;
END$$
DELIMITER ;

-- CALL get_user_by_email('guest.user@example.com');

-- File: procedures/login.sql
DROP PROCEDURE IF EXISTS customer_login;
DELIMITER $$
CREATE PROCEDURE customer_login(
    IN p_email VARCHAR(100),
    IN p_password_hash VARCHAR(255)
)
BEGIN
    DECLARE v_customer_id INT;
    DECLARE v_customer_name VARCHAR(100);
    DECLARE v_is_guest BOOLEAN;

    -- Check if a customer exists with the given email and password hash
    SELECT customer_id, customer_name, is_guest
    INTO v_customer_id, v_customer_name, v_is_guest
    FROM customer
    WHERE email = p_email AND password_hash = p_password_hash
    LIMIT 1;

    -- If a customer is found, return the customer information
    IF v_customer_id IS NOT NULL THEN
        SELECT
            v_customer_id AS customer_id,
            v_customer_name AS customer_name,
            v_is_guest AS is_guest,
            'Login successful' AS message;
    ELSE
        -- If no customer is found, return an error message
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid email or password';
    END IF;
END$$
DELIMITER ;


-- checking works
-- INSERT INTO Customer (password_hash, name, email, phone_number, is_guest)
-- VALUES ('hashed_password123', 'John Doe', 'joh@example.com', '1234567890', FALSE);

-- CALL Customer_Login('joh@example.com', 'hashed_password123');

-- CALL Customer_Login('joh@example.com', 'wrong_password');

-- File: procedures/product_by_id.sql
DROP PROCEDURE IF EXISTS product_by_id;
DELIMITER //
CREATE PROCEDURE product_by_id(IN p_product_id INT)
BEGIN
    SELECT *
    FROM product
    WHERE product_id = p_product_id;
END //

DELIMITER ;


-- File: procedures/sp_get_product_by_id.sql
-- Stored procedure for getting product details by ID
DELIMITER //
CREATE PROCEDURE sp_get_product_by_id(
    IN p_product_id INT
)
BEGIN
    -- Get main product info
    SELECT 
        p.*,
        c.category_name,
        GROUP_CONCAT(DISTINCT pc.category_id) as additional_categories
    FROM Product p
    LEFT JOIN Category c ON p.category_id = c.category_id
    LEFT JOIN Product_Category pc ON p.product_id = pc.product_id
    WHERE p.product_id = p_product_id
    GROUP BY p.product_id;
    
    -- Get product attributes
    SELECT 
        a.attribute_name,
        pa.attribute_value
    FROM Product_Attribute pa
    JOIN Attribute a ON pa.attribute_id = a.attribute_id
    WHERE pa.product_id = p_product_id;
    
    -- Get variants with their attributes and stock
    SELECT 
        v.variant_id,
        v.sku,
        v.price,
        v.weight,
        d.discount,
        GROUP_CONCAT(
            CONCAT(a.attribute_name, ': ', va.attribute_value)
            SEPARATOR '; '
        ) as variant_attributes,
        SUM(vw.stock_count) as total_stock
    FROM Variant v
    LEFT JOIN Discounts d ON v.discount_id = d.discount_id
    LEFT JOIN Variant_Attribute va ON v.variant_id = va.variant_id
    LEFT JOIN Attribute a ON va.attribute_id = a.attribute_id
    LEFT JOIN Variant_Warehouse vw ON v.variant_id = vw.variant_id
    WHERE v.product_id = p_product_id
    GROUP BY v.variant_id;
END //
DELIMITER ;


-- File: procedures/sp_get_products.sql
-- Stored procedure for paginated product listing
DELIMITER //
CREATE PROCEDURE sp_get_products(
    IN p_limit INT,
    IN p_offset INT,
    OUT p_total INT
)
BEGIN
    -- Get total count
    SELECT COUNT(*) INTO p_total FROM vw_product_details;
    
    -- Get paginated results
    SELECT * FROM vw_product_details
    LIMIT p_limit OFFSET p_offset;
END //
DELIMITER ;

-- File: procedures/sp_process_payment.sql
-- Stored Procedure for Payment Processing
DELIMITER //
CREATE PROCEDURE sp_process_payment(
    IN p_order_id INT,
    IN p_payment_method VARCHAR(50),
    IN p_amount DECIMAL(10,2)
)
BEGIN
    DECLARE v_payment_id INT;
    
    START TRANSACTION;
    
    -- Create payment record
    INSERT INTO Payment (payment_method, amount)
    VALUES (p_payment_method, p_amount);
    
    SET v_payment_id = LAST_INSERT_ID();
    
    -- Update order with payment ID
    UPDATE Orders 
    SET payment_id = v_payment_id
    WHERE order_id = p_order_id;
    
    COMMIT;
    
    SELECT v_payment_id AS payment_id;
END //
DELIMITER ;



-- ============================================
-- Beginning of triggers section
-- ============================================

-- File: triggers/apply_discount.sql
DELIMITER //

CREATE TRIGGER apply_discount
AFTER UPDATE ON variant
FOR EACH ROW
BEGIN
    IF NEW.discount_id IS NOT NULL AND NEW.discount_id != OLD.discount_id THEN
        UPDATE variant
        SET price = price * (1 - (SELECT discount FROM discounts WHERE discount_id = NEW.discount_id))
        WHERE variant_id = NEW.variant_id;
    END IF;
END;
//

DELIMITER ;


-- File: triggers/before_payment_insert.sql
DELIMITER //
CREATE TRIGGER before_payment_insert
BEFORE INSERT ON payment
FOR EACH ROW
BEGIN
    IF NEW.amount <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Payment amount must be greater than zero';
    END IF;
END;//
DELIMITER ;

-- File: triggers/trg_variant_price_check.sql
DELIMITER //
CREATE TRIGGER trg_variant_price_check
BEFORE INSERT ON variant
FOR EACH ROW
BEGIN
    IF NEW.price < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Price cannot be negative';
    END IF;
END //
DELIMITER ;


-- File: triggers/trg_variant_stock_update.sql
DELIMITER //


CREATE TRIGGER trg_variant_stock_update
AFTER UPDATE ON variant_warehouse
FOR EACH ROW
BEGIN
    -- You could add logging or additional business logic here
    -- For example, you might want to track stock changes or send notifications
    IF NEW.stock_count <= 0 THEN
        INSERT INTO stock_alerts (variant_id, warehouse_id, alert_type)
        VALUES (NEW.variant_id, NEW.warehouse_id, 'OUT_OF_STOCK');
    END IF;
END //
DELIMITER ;

-- File: triggers/update_inventory.sql
DELIMITER //

CREATE TRIGGER adjust_inventory_on_order_delete
BEFORE DELETE ON orders
FOR EACH ROW
BEGIN
    UPDATE variant_warehouse vw
    JOIN order_items oi ON vw.variant_id = oi.variant_id
    SET vw.quantity = vw.quantity + oi.quantity
    WHERE oi.order_id = OLD.order_id;

    DELETE FROM order_items WHERE order_id = OLD.order_id;
END;
//

DELIMITER ;


-- File: triggers/update_product_attributes.sql
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


-- File: triggers/update_variant_stock.sql
DELIMITER //

CREATE TRIGGER update_variant_stock
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    UPDATE variant_warehouse
    SET stock_count = stock_count - NEW.quantity
    WHERE variant_id = NEW.variant_id;
END;
//

DELIMITER ;



-- ============================================
-- Beginning of views section
-- ============================================

-- File: views/cartget.sql
-- /items
CREATE VIEW cart_with_email AS
SELECT C.*,CU.customer_email FROM cart C
JOIN customer CU on C.customer_id=CU.customer_id;


-- File: views/cart_with_email.sql
DROP VIEW IF EXISTS cart_with_email;

CREATE VIEW cart_with_email AS
SELECT C.*,CU.customer_email FROM cart C
JOIN customer CU on C.customer_id=CU.customer_id;

-- File: views/categories.sql
-- /categories/:name/products
CREATE VIEW variant_search AS
SELECT V.*,P.product_name,C.category_name FROM variant V
JOIN product P ON V.product_id=P.product_id
JOIN product_category PC ON P.product_id=PC.product_id
JOIN category C ON PC.category_id=C.category_id
WHERE C.category_name = 'Speakers';

-- /categories/:name/products/:id
CREATE VIEW categories_with_name_and_id AS
SELECT P.*, C.category_name FROM product P
JOIN product_category PC ON P.product_id=PC.product_id
JOIN category C ON PC.category_id=C.category_id;

-- -- /search
-- CREATE VIEW variants_with_name AS
-- SELECT V.*,P.product_name FROM variant V
-- JOIN product P ON V.product_id=P.product_id
-- WHERE P.product_name LIKE ?;

DROP VIEW categories_with_name_and_id;


-- File: views/featured product.sql

CREATE VIEW variant_details_with_variant_id AS
SELECT V.*,D.discount,P.product_name,P.description,C.category_name FROM variant V
join product P on V.product_id=P.product_id
join product_category PC on P.product_id=PC.product_id
join category C on PC.category_id=C.category_id
join discounts D on V.discount_id=D.discount_id;


CREATE VIEW featured_product AS
SELECT P.product_name,V.price from product P
JOIN variant V;

select * from featured_product;

DROP VIEW IF EXISTS featured_product;


-- View for product listing with category and variant information
CREATE VIEW vw_product_details AS
SELECT
    p.product_id,
    p.product_name,
    p.description,
    c.category_name,
    MIN(v.price) as min_price,
    MAX(v.price) as max_price,
    SUM(vw.stock_count) as total_stock,
    COUNT(DISTINCT v.variant_id) as variant_count
FROM product p
LEFT JOIN product_category pc ON pc.product_id = p.product_id
LEFT JOIN category c ON pc.category_id = c.category_id
LEFT JOIN variant v ON p.product_id = v.product_id
LEFT JOIN variant_warehouse vw ON v.variant_id = vw.variant_id
GROUP BY p.product_id, p.product_name, p.description, c.category_name;

-- select * from vw_product_details;
-- Stored procedure for paginated product listing



-- ============================================
-- Beginning of dev section
-- ============================================

-- File: dev/Custom_Errors.sql
DROP TABLE IF EXISTS custom_errors;
CREATE TABLE custom_errors (
  error_state VARCHAR(20) PRIMARY KEY,
  error_category VARCHAR(20),
  error_message TEXT
);

INSERT INTO `custom_errors` VALUES
('45001', 'INV' ,'Warehouse not found'),
('45002', 'INV','Insufficient stock'),
('45003', 'INV','Variant entry not found'),
('45004', 'INV','Quantity must be a positive integer.'),
('45005', 'INV','No items in cart'),
('45006', 'INV','Stock information not found for variant ID ');



-- ============================================
-- Beginning of functions section
-- ============================================

-- File: functions/buy_now.sql
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
    FROM customer
    WHERE customer_id = p_customer_id
    FOR UPDATE;

    -- Lock the variant row and get the price
    SELECT price INTO v_price
    FROM variant
    WHERE variant_id = p_variant_id
    FOR UPDATE;

    -- Lock the variant_warehouse row and get the current stock count
    SELECT stock_count INTO v_stock_count
    FROM variant_warehouse
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
    INSERT INTO payment (payment_method, amount)
    VALUES (p_payment_method, v_total_amount);
    SET v_payment_id = LAST_INSERT_ID();

    -- Create order
    INSERT INTO orders (customer_id, address_id, payment_id, delivery_method, contact_email, contact_phone)
    SELECT customer_id, v_address_id, v_payment_id, p_delivery_method, email, phone_number
    FROM customer
    WHERE customer_id = p_customer_id;
    SET v_order_id = LAST_INSERT_ID();

    -- Add order item
    INSERT INTO order_items (order_id, variant_id, quantity)
    VALUES (v_order_id, p_variant_id, p_quantity);

    -- Update inventory
    UPDATE variant_warehouse
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
    JOIN payment p ON o.payment_id = p.payment_id
    WHERE o.order_id = v_order_id;

END$$
DELIMITER ;

-- Insert test data
-- INSERT INTO category (category_name) VALUES ('Test category');
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

-- File: functions/Check_Variant_Availability.sql
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


-- File: functions/Get_Customer_Id.sql
DROP FUNCTION IF EXISTS get_cart_id;

DELIMITER $$

CREATE FUNCTION get_cart_id (f_customer_id INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_cart_id INT;

    SELECT cart_id INTO v_cart_id
    FROM cart
    WHERE customer_id = f_customer_id
    LIMIT 1;

    IF v_cart_id IS NULL THEN
    -- No cart exists for the customer
    SIGNAL SQLSTATE '45006' SET MESSAGE_TEXT = 'Cart does not exist for the customer.';
    END IF;

    RETURN v_cart_id;
END$$

DELIMITER ;

-- File: functions/Get_Warehouse_Id.sql
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



-- ============================================
-- Beginning of indexes section
-- ============================================

-- File: indexes/indexes.sql
CREATE INDEX index_product_product_name ON product(product_name);

CREATE INDEX index_property_price_increment ON variant(price);

CREATE INDEX Index_Customer_Id ON cart(customer_id);

-- DROP INDEX index_product_product_name;

-- doubt
-- CREATE INDEX index_sales_item_year_quarter ON sales_item(year, quarter);


-- ============================================
-- Beginning of data section
-- ============================================

-- File: data/Population_Address.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Address table
INSERT INTO address (address_id, line_1, line_2, city, district, zip_code) VALUES
(1, '123 Main St', NULL, 'Dallas', 'Dallas County', '75001'),
(2, '456 Elm St', 'Apt 2B', 'Arlington', 'Tarrant County', '76010');



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: data/Population_Attribute.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Attribute table
INSERT INTO attribute (attribute_id, attribute_name) VALUES
(1, 'Color'),
(2, 'Storage Capacity'),
(3, 'Brand'),
(4, 'Operating System'),
(5, 'Battery Life'),
(6, 'Dimensions'),
(7, 'Age Group'),
(8, 'Material');



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: data/Population_Cart_Items.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Cart_Items table
INSERT INTO cart_items (cart_id, variant_id, quantity) VALUES
(1, 1, 1),
(1, 5, 2);

-- Guest User's Cart
INSERT INTO cart_items (cart_id, variant_id, quantity) VALUES
(3, 6, 1);



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: data/Population_Cart.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Cart table
INSERT INTO cart (cart_id, customer_id, created_at) VALUES
(1, 1, NOW()),
(3, 3, NOW());


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: data/Population_Category.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Category table
INSERT INTO category (category_id, category_name, parent_category_id) VALUES
(1, 'Consumer Electronics', NULL),
(2, 'Toys', NULL);

-- Subcategories
INSERT INTO category (category_id, category_name, parent_category_id) VALUES
(3, 'Mobile Phones', 1),
(4, 'Speakers', 1),
(5, 'Action Figures', 2),
(6, 'Educational Toys', 2);



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: data/Population_City.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate City table
INSERT INTO city (city_name, is_main_city) VALUES
('Dallas', TRUE),
('Austin', TRUE),
('Houston', TRUE),
('San Antonio', TRUE),
('Fort Worth', FALSE),
('El Paso', FALSE),
('Arlington', FALSE);



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: data/Population_Customer.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Customer table
INSERT INTO customer (customer_id, password_hash, customer_name, customer_email, customer_phone_number, address_id, is_guest) VALUES
(1, 'hashed_password_1', 'John Doe', 'john.doe@example.com', '555-1234', 1, FALSE),
(2, 'hashed_password_2', 'Jane Smith', 'jane.smith@example.com', '555-5678', 2, FALSE),
(3, '', 'Guest User', 'guest.user@example.com', NULL, NULL, TRUE);



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: data/Population_Discounts.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Discounts table
INSERT INTO discounts (discount_id, discount) VALUES
(1, 10.00),  -- 10% discount
(2, 5.00);   -- 5% discount



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: data/Population_inventory.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate inventory table
UPDATE
variant_warehouse
SET stock_count = stock_count - 1
WHERE variant_id = 1
    AND warehouse_id = 1;

UPDATE
variant_warehouse
SET stock_count = stock_count - 2
WHERE variant_id = 5
    AND warehouse_id = 1;

UPDATE
variant_warehouse
SET stock_count = stock_count - 1
WHERE variant_id = 3
    AND warehouse_id = 1;
UPDATE variant_warehouse
SET stock_count = stock_count - 1
WHERE variant_id = 6
    AND warehouse_id = 2;

-- Re-enable foreign key checks after data insertion


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: data/Population_Order_Items.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Order_Items table
INSERT INTO order_items (order_id, variant_id, quantity) VALUES
(1, 1, 1),
(1, 5, 2);

-- Jane Smith's Order
INSERT INTO order_items (order_id, variant_id, quantity) VALUES
(2, 3, 1);

-- Guest User's Order
INSERT INTO order_items (order_id, variant_id, quantity) VALUES
(3, 6, 1);



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: data/Population_Orders.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Orders table
INSERT INTO orders (order_id, customer_id, address_id, payment_id, order_date, delivery_estimate, delivery_method, contact_email, contact_phone) VALUES
(1, 1, 1, 1, NOW(), DATE_ADD(NOW(), INTERVAL 5 DAY), 'Delivery', 'john.doe@example.com', '555-1234'),
(2, 2, 2, 2, NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY), 'Delivery', 'jane.smith@example.com', '555-5678'),
(3, 3, NULL, 3, NOW(), DATE_ADD(NOW(), INTERVAL 5 DAY), 'Store Pickup', 'guest.user@example.com', NULL);



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: data/Population_Payment.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Payment table
INSERT INTO payment (payment_id, payment_method, amount, payment_date) VALUES
(1, 'Card', 1399.97, NOW()),       -- John Doe's payment (adjusted amount)
(2, 'Cash on Delivery', 1099.99, NOW()), -- Jane Smith's payment
(3, 'Card', 89.99, NOW());         -- Guest User's payment



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: data/Population_Product_Attribute.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Product_Attribute table
INSERT INTO product_attribute (product_id, attribute_id, attribute_value) VALUES
(1, 3, 'Apple'),             -- Brand
(1, 4, 'iOS'),               -- Operating System
(1, 5, 'Up to 14 hours');    -- Battery Life

-- Bose SoundLink Speaker (Product ID: 2)
INSERT INTO product_attribute (product_id, attribute_id, attribute_value) VALUES
(2, 3, 'Bose'),              -- Brand
(2, 5, '8 hours'),           -- Battery Life
(2, 6, '5 x 5 x 5 inches');  -- Dimensions

-- LEGO Star Wars Set (Product ID: 3)
INSERT INTO product_attribute (product_id, attribute_id, attribute_value) VALUES
(3, 3, 'LEGO'),              -- Brand
(3, 7, '8+'),                -- Age Group
(3, 8, 'Plastic'),           -- Material
(3, 6, '15 x 10 x 5 inches');-- Dimensions



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: data/Population_Product_Category.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Product_Category table
INSERT INTO product_category (product_id, category_id) VALUES
(1, 3),
(2, 4),
(3, 6);



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: data/Population_Product.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Product table
INSERT INTO product (product_id, product_name, description) VALUES
(1, 'iPhone X', 'Apple smartphone with advanced features'),
(2, 'Bose SoundLink Speaker', 'Portable Bluetooth speaker with high-quality sound'),
(3, 'LEGO Star Wars Set', 'Building set for Star Wars enthusiasts');



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: data/Population_Variant_Attribute.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Variant_Attribute table
INSERT INTO variant_attribute (variant_id, attribute_id, attribute_value) VALUES
(1, 1, 'Black'),   -- Color
(1, 2, '16GB'),    -- Storage Capacity
(2, 1, 'Red'),
(2, 2, '16GB'),
(3, 1, 'Black'),
(3, 2, '32GB'),
(4, 1, 'Red'),
(4, 2, '32GB');

-- Bose Speaker Variant
INSERT INTO variant_attribute (variant_id, attribute_id, attribute_value) VALUES
(5, 1, 'Black');



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: data/Population_Variant.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Variant table
INSERT INTO variant (variant_id, product_id, sku, price, weight, discount_id) VALUES
(1, 1, 'IPX-16GB-BLK', 999.99, 0.174, 1),    -- iPhone X 16GB Black
(2, 1, 'IPX-16GB-RED', 999.99, 0.174, NULL), -- iPhone X 16GB Red
(3, 1, 'IPX-32GB-BLK', 1099.99, 0.174, 2),   -- iPhone X 32GB Black
(4, 1, 'IPX-32GB-RED', 1099.99, 0.174, NULL),-- iPhone X 32GB Red
(5, 2, 'BSS-BLK', 199.99, 1.2, NULL),        -- Bose Speaker Black
(6, 3, 'LSW-SET', 89.99, 2.5, NULL);         -- LEGO Star Wars Set



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: data/Population_Variant_Warehouse.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Variant_Warehouse table
INSERT INTO variant_warehouse (variant_id, warehouse_id, stock_count) VALUES
(1, 1, 50),
(2, 1, 30),
(3, 1, 20),
(4, 1, 10),
(5, 1, 100),
(6, 2, 75);



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


-- File: data/Population_Warehouse.sql
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Warehouse table
INSERT INTO warehouse (warehouse_id, warehouse_name, warehouse_location) VALUES
(1, 'Main Warehouse', 'Dallas'),
(2, 'Secondary Warehouse', 'Houston');



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;


