DROP PROCEDURE IF EXISTS get_parent_categories;

DELIMITER $$
CREATE PROCEDURE get_parent_categories(
    IN p_limit INT,
    IN p_offset INT
)
BEGIN
    SELECT * FROM parent_categories LIMIT p_limit OFFSET p_offset;
END $$

DELIMITER ;

-- CALL get_parent_categories(10, 0);

DROP PROCEDURE IF EXISTS get_parent_categories_count;

DELIMITER $$
CREATE PROCEDURE get_parent_categories_count(

)
BEGIN
    SELECT COUNT(*) FROM parent_categories;
END $$

DELIMITER ;

-- CALL get_parent_categories_count();

DROP PROCEDURE IF EXISTS get_categories;

DELIMITER $$
CREATE PROCEDURE get_categories(
    IN p_limit INT,
    IN p_offset INT
)
BEGIN
    SELECT * FROM categories LIMIT p_limit OFFSET p_offset;
END $$

DELIMITER ;

-- CALL get_parent_categories(10, 0);

DROP PROCEDURE IF EXISTS get_categories_count;

DELIMITER $$
CREATE PROCEDURE get_categories_count(
)
BEGIN
    SELECT COUNT(*) FROM categories;
END $$

DELIMITER ;