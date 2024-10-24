CREATE PROCEDURE product_by_id(IN p_product_id INT)
BEGIN
    SELECT *
    FROM vw_product_details
    WHERE product_id = p_product_id;
END //

DELIMITER ;
call product_by_id(1);
