-- Stored procedure for paginated product listing
DELIMITER //
CREATE PROCEDURE sp_get_products(
    IN p_limit INT,
    IN p_offset INT,
    OUT p_total INT
)
BEGIN
    -- Get total count
    SELECT COUNT(*) INTO p_total FROM vw_product_details;
    
    -- Get paginated results
    SELECT * FROM vw_product_details
    LIMIT p_limit OFFSET p_offset;
END //
DELIMITER ;