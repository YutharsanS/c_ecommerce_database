DROP PROCEDURE IF EXISTS get_order_by_email;
DELIMITER //

CREATE PROCEDURE get_order_by_email(IN p_email VARCHAR(255))
BEGIN
    SELECT *
    FROM order_details
    WHERE contact_email = p_email;
END //

DELIMITER ;
