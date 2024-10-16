CREATE VIEW variant_details AS
SELECT V.*,D.discount,P.product_name,P.description,C.category_name FROM variant V
join product P on V.product_id=P.product_id
join product_category PC on P.product_id=PC.product_id
join category C on PC.category_id=C.category_id
join discounts D on V.discount_id=D.discount_id
  LIMIT 1 OFFSET 2;


CREATE VIEW variant_count AS
SELECT COUNT(*) AS total FROM variant;


CREATE VIEW variant_details_with_variant_id AS
SELECT V.*,D.discount,P.product_name,P.description,C.category_name FROM variant V
join product P on V.product_id=P.product_id
join product_category PC on P.product_id=PC.product_id
join category C on PC.category_id=C.category_id
join discounts D on V.discount_id=D.discount_id
WHERE V.variant_id = 2;