DELIMITER //

DELIMITER //

CREATE PROCEDURE customer_order_report(IN c_id BIGINT)
BEGIN
    SELECT 
        o.order_id, 
        o.order_date AS date,  -- Assuming the column name is 'order_date'
        SUM(oi.quantity * v.price) AS total_payment, -- Dynamically calculating total payment
        oi.variant_id, 
        oi.quantity
    FROM orders AS o
    LEFT JOIN order_items AS oi ON o.order_id = oi.order_id
    LEFT JOIN variant AS v ON oi.variant_id = v.variant_id
    WHERE o.customer_id = c_id
    GROUP BY o.order_id, oi.variant_id;  -- Grouping by order and variant
END //

DELIMITER ;

DROP  PROCEDURE customer_order_report;
CALL customer_order_report(12345);  
