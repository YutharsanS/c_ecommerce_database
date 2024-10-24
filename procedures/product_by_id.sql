DROP PROCEDURE IF EXISTS product_by_id;
DELIMITER //
CREATE PROCEDURE product_by_id(IN p_product_id INT)
BEGIN
    SELECT *
    FROM product
    WHERE product_id = p_product_id;
END //

DELIMITER ;
