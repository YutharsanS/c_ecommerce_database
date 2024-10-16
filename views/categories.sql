-- /categories/:name/products
CREATE VIEW variant_search AS
SELECT V.*,P.product_name,C.category_name FROM variant V
JOIN product P ON V.product_id=P.product_id
JOIN product_category PC ON P.product_id=PC.product_id
JOIN category C ON PC.category_id=C.category_id
WHERE C.category_name = 'Speakers';

-- /categories/:name/products/:id
-- CREATE VIEW categories_with_name_and_id AS
-- SELECT V.*,P.product_name,C.category_name FROM variant V
-- JOIN product P ON V.product_id=P.product_id
-- JOIN product_category PC ON P.product_id=PC.product_id
-- JOIN category C ON PC.category_id=C.category_id
-- WHERE V.variant_id = ? AND C.category_name = ?;

-- -- /search
-- CREATE VIEW variants_with_name AS
-- SELECT V.*,P.product_name FROM variant V
-- JOIN product P ON V.product_id=P.product_id
-- WHERE P.product_name LIKE ?;