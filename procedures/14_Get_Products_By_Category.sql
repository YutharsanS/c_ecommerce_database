DROP PROCEDURE IF EXISTS get_product_by_category;

DELIMITER $$
CREATE PROCEDURE get_product_by_category(
    IN p_category VARCHAR(100)
)
BEGIN
    SELECT * FROM vw_product_details WHERE category = p_category;
END $$

DELIMITER ;

CALL get_product_by_category('Consumer Electronics');
-- INSERT INTO product_category(product_id, category_id)
-- VALUES
-- (2, 1);