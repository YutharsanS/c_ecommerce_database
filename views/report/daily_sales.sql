-- Daily Sales Report View
CREATE VIEW daily_sales AS
SELECT 
    DATE(o.order_date) as sale_date,
    COUNT(DISTINCT o.order_id) as total_orders,
    SUM(oi.quantity * v.price) as total_revenue,
    COUNT(DISTINCT o.customer_id) as unique_customers
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Variant v ON oi.variant_id = v.variant_id
GROUP BY DATE(o.order_date)
ORDER BY sale_date DESC;

SELECT * FROM daily_sales;