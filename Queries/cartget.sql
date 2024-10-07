
-- /items
SELECT * FROM cart C join customer CU on C.customer_id=CU.customer_id WHERE CU.email = 'john.doe@example.com';


SET FOREIGN_KEY_CHECKS = 0;
-- /items/:id
DELETE FROM cart WHERE cart_id = 1 AND customer_id = (SELECT customer_id FROM customer WHERE email = 'john.doe@example.com');
-- foreign key problem
SET FOREIGN_KEY_CHECKS = 1;