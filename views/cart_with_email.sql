CREATE VIEW cart_with_email AS
SELECT C.*,CU.email FROM cart C 
join customer CU on C.customer_id=CU.customer_id 
WHERE CU.email = ?