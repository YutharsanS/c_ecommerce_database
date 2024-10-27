-- /categories/:name/products
CREATE VIEW variant_search AS
SELECT V.*,P.product_name,C.category_name FROM variant V
JOIN product P ON V.product_id=P.product_id
JOIN product_category PC ON P.product_id=PC.product_id
JOIN category C ON PC.category_id=C.category_id;

-- /categories/:name/products/:id
CREATE VIEW categories_with_name_and_id AS
SELECT P.product_id, P.product_name, P.default_variant_id, C.category_name, V.price, D.discount FROM product P
JOIN product_category PC ON P.product_id=PC.product_id
JOIN category C ON PC.category_id=C.category_id
LEFT JOIN variant V ON V.variant_id = P.default_variant_id
LEFT JOIN discounts D ON V.discount_id = D.discount_id;

-- /categories
CREATE VIEW parent_categories AS
SELECT category_id AS id, category_name AS name FROM category
WHERE parent_category_id IS NULL;
CREATE VIEW categories AS
SELECT category_id AS id, category_name AS name FROM category;
