
CREATE VIEW variant_details_with_variant_id AS
SELECT V.*,D.discount,P.product_name,P.description,C.category_name FROM variant V
join product P on V.product_id=P.product_id
join product_category PC on P.product_id=PC.product_id
join category C on PC.category_id=C.category_id
join discounts D on V.discount_id=D.discount_id
WHERE V.variant_id = ?;


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
FROM Product p
LEFT JOIN Category c ON p.category_id = c.category_id
LEFT JOIN Variant v ON p.product_id = v.product_id
LEFT JOIN Variant_Warehouse vw ON v.variant_id = vw.variant_id
GROUP BY p.product_id, p.product_name, p.description, c.category_name;

select * from vw_product_details;
-- Stored procedure for paginated product listing

