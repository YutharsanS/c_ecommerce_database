DELIMITER //

DROP PROCEDURE IF EXISTS quarters_with_most_interest;

CREATE PROCEDURE quarters_with_most_interest(IN p_id INT)
BEGIN
    SELECT 
        si.year,
        si.quarter,
        SUM(si.sales) AS total_sales,
        SUM(si.earnings) AS total_earnings
    FROM 
        sales_item si
    JOIN 
        Variant v ON si.variant_id = v.variant_id
    WHERE 
        v.product_id = p_id
    GROUP BY 
        si.year, si.quarter
    ORDER BY 
        total_sales DESC, total_earnings DESC;
END //

DELIMITER ;


call quarters_with_most_interest(45);