drop VIEW IF EXISTS variant_details_with_variant_id;

CREATE VIEW variant_details_with_variant_id AS
SELECT V.*,D.discount,P.product_name,P.description,C.category_name FROM variant V
join product P on V.product_id=P.product_id
join product_category PC on P.product_id=PC.product_id
join category C on PC.category_id=C.category_id
join discounts D on V.discount_id=D.discount_id;

-- DROP VIEW IF EXISTS featured_product

-- CREATE VIEW featured_product AS
-- SELECT P.product_name,V.price from product P
-- JOIN variant V ;


DROP VIEW IF EXISTS vw_product_details;
-- View for product listing with category and variant information
DELIMITER $$
CREATE VIEW vw_product_details AS
SELECT
    p.product_id AS id,
    p.product_name AS name,
    p.description AS description,
    c.category_name AS category,
    MAX(v.price) as old_price,
    ROUND(v.price * (1 - COALESCE(d.discount, 0)/100), 2) AS new_price,
    SUM(vw.stock_count) as available
    -- COUNT(DISTINCT v.variant_id) as variant_count
FROM product p
LEFT JOIN product_category pc ON pc.product_id = p.product_id
LEFT JOIN category c ON pc.category_id = c.category_id
LEFT JOIN variant v ON p.default_variant_id = v.variant_id
LEFT JOIN variant_warehouse vw ON v.variant_id = vw.variant_id
LEFT JOIN discounts d ON d.discount_id = v.discount_id
GROUP BY p.product_id, p.product_name, p.description, c.category_name;
$$

-- select * from cart_product_details where email = 'yutharsansivabalan@gmail.com'