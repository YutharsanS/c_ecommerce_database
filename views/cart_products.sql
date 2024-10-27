CREATE VIEW cart_product_details AS
SELECT
    ci.cart_id,
    p.product_id,
    c.customer_email as email,
    -- Get color from variant_attribute table
    (SELECT va.attribute_value
     FROM variant_attribute va
     JOIN attribute a ON va.attribute_id = a.attribute_id
     WHERE va.variant_id = ci.variant_id
     AND a.attribute_name = 'color') as color,
    ci.quantity,
    p.product_name,
    -- Calculate new price (with discount if applicable)
    CASE
        WHEN d.discount IS NOT NULL
        THEN v.price * (1 - d.discount/100)
        ELSE v.price
    END as new_price,
    v.price as old_price,
    p.description,
    -- Get image from variant_attribute (assuming it's stored there)
    (SELECT va.attribute_value
     FROM variant_attribute va
     JOIN attribute a ON va.attribute_id = a.attribute_id
     WHERE va.variant_id = ci.variant_id
     AND a.attribute_name = 'image') as image,
    -- Get category name
    (SELECT c.category_name
     FROM category c
     JOIN product_category pc ON c.category_id = pc.category_id
     WHERE pc.product_id = p.product_id
     LIMIT 1) as category
FROM cart_items ci
JOIN variant v ON ci.variant_id = v.variant_id
JOIN product p ON v.product_id = p.product_id
JOIN cart ca ON ci.cart_id = ca.cart_id
JOIN customer c ON ca.customer_id = c.customer_id
LEFT JOIN discounts d ON v.discount_id = d.discount_id;

-- SELECT * FROM cart_product_details;