-- /items
CREATE VIEW cart_with_email AS
SELECT C.*,CU.customer_email FROM cart C
JOIN customer CU on C.customer_id=CU.customer_id;
