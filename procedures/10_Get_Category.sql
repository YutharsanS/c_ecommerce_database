DROP PROCEDURE IF EXISTS get_categories_with_name;

DELIMITER $$
CREATE PROCEDURE get_categories_with_name(
    IN p_category_name VARCHAR(100)
)
BEGIN
    SELECT * FROM categories_with_name_and_id
    WHERE category_name = p_category_name;
END$$

DELIMITER ;

--  ;
