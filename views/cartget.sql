-- /items
CREATE VIEW cart_with_email AS
SELECT C.*,CU.email FROM cart C
join customer CU on C.customer_id=CU.customer_id
WHERE CU.email = ?

CREATE USER 'BackEndlearn'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON c_ecommerce.* TO 'BackEndlearn'@'%';
FLUSH PRIVILEGES;