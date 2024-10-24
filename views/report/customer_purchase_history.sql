CREATE VIEW customer_purchase_history AS
SELECT 
    c.customer_id,
    c.name as customer_name,
    c.email,
    COUNT(DISTINCT o.order_id) as total_orders,
    SUM(oi.quantity * v.price) as total_spent,
    MAX(o.order_date) as last_order_date
FROM Customer c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
LEFT JOIN Order_Items oi ON o.order_id = oi.order_id
LEFT JOIN Variant v ON oi.variant_id = v.variant_id
GROUP BY c.customer_id, c.name, c.email;

select * from customer_purchase_history;