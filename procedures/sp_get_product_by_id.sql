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
