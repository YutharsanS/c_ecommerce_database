DROP PROCEDURE IF EXISTS search;

DELIMITER $$
CREATE PROCEDURE search(
    IN p_search_term VARCHAR(100),
    IN p_limit INT,
    IN p_offset INT
)
BEGIN
    -- Concatenate wildcards with the search term
    SET p_search_term = CONCAT('%', p_search_term, '%');

    SELECT * FROM product
    WHERE product_name LIKE p_search_term
    LIMIT p_limit
    OFFSET p_offset;
END$$

DELIMITER ;

CALL search('i', 10, 0);