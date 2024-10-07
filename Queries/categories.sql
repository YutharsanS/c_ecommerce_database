-- /categories
SELECT * FROM product_category LIMIT ? OFFSET ? ;
SELECT COUNT(*) AS total FROM product_category;


-- /categories/:name/products
SELECT V.*,P.* FROM variant V join product P on V.product_id=P.product_id join product_category PC on P.product_id=PC.product_id join category C on PC.category_id=C.category_id WHERE C.category_name = ?

-- /categories/:name/products/:id
SELECT V.*,P.*,C.* FROM variant V JOIN product P ON V.product_id=P.product_id JOIN product_category PC ON P.product_id=PC.product_id JOIN category C ON PC.category_id=C.category_id WHERE V.variant_id = ? AND C.category_name = ?;

-- /search
SELECT V.*,P.* FROM variant V JOIN product P ON V.product_id=P.product_id WHERE P.product_name LIKE "i%";