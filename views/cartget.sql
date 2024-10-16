-- /items
CREATE VIEW cart_with_email AS
SELECT C.*,CU.customer_email FROM cart C
join customer CU on C.customer_id=CU.customer_id
WHERE CU.customer_email = 'john.doe@example.com';
