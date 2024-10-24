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
FROM Product p
LEFT JOIN Category c ON p.category_id = c.category_id
LEFT JOIN Variant v ON p.product_id = v.product_id
LEFT JOIN Variant_Warehouse vw ON v.variant_id = vw.variant_id
GROUP BY p.product_id, p.product_name, p.description, c.category_name;

select * from vw_product_details;
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

-- Trigger to update product stock when variant stock changes
DELIMITER //

call sp_get_product_by_id(1);
CREATE TRIGGER trg_variant_stock_update
AFTER UPDATE ON Variant_Warehouse
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

-- Trigger to ensure minimum price is not negative
DELIMITER //
CREATE TRIGGER trg_variant_price_check
BEFORE INSERT ON Variant
FOR EACH ROW
BEGIN
    IF NEW.price < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Price cannot be negative';
    END IF;
END //
DELIMITER ;

-- view details of product in procedure
DELIMITER //

CREATE PROCEDURE product_by_id(IN p_product_id INT)
BEGIN
    SELECT *
    FROM vw_product_details
    WHERE product_id = p_product_id;
END //

DELIMITER ;
call product_by_id(1)