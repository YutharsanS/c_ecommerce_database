DROP PROCEDURE IF EXISTS sp_get_products;
-- Stored procedure for paginated product listing
DELIMITER //
CREATE PROCEDURE sp_get_products(
    IN p_limit INT,
    IN p_offset INT
)
BEGIN
    -- Get paginated results
    SELECT * FROM vw_product_details
    LIMIT p_limit OFFSET p_offset;
END //
DELIMITER ;