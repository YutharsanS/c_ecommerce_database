DELIMITER //

CREATE PROCEDURE products_with_most_sales(IN y SMALLINT, IN q SMALLINT)
BEGIN
    SELECT vo.product_id,
           SUM(oi.quantity) AS total_sales, 
           SUM(p.amount) AS total_earnings 
    FROM Variant v
    JOIN Order_Items oi ON v.variant_id = oi.variant_id
    JOIN Orders o ON oi.order_id = o.order_id
    JOIN Payment p ON o.payment_id = p.payment_id
    JOIN (SELECT DISTINCT product_id FROM Product) AS vo ON v.product_id = vo.product_id
    WHERE YEAR(o.order_date) = y AND QUARTER(o.order_date) = q
    GROUP BY vo.product_id
    ORDER BY total_sales DESC, total_earnings DESC;
END //

DELIMITER ;

CALL products_with_most_sales(2024, 3);  
