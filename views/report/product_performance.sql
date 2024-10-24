CREATE VIEW product_performance AS
SELECT 
    p.product_id,
    p.product_name,
    COUNT(DISTINCT o.order_id) as times_ordered,
    SUM(oi.quantity) as total_units_sold,
    SUM(oi.quantity * v.price) as total_revenue,
    AVG(v.price) as average_price
FROM Product p
JOIN Variant v ON p.product_id = v.product_id
JOIN Order_Items oi ON v.variant_id = oi.variant_id
JOIN Orders o ON oi.order_id = o.order_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC;

SELECT 8 FROM product_performance;