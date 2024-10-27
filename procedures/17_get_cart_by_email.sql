DROP PROCEDURE IF EXISTS get_cart_by_email;
DELIMITER //
CREATE PROCEDURE get_cart_by_email(IN p_email VARCHAR(255))
BEGIN

select * from cart_product_details where email = p_email;
END //

DELIMITER ;

-- CALL get_cart_by_email('yutharsansivabalan@gmail.com')