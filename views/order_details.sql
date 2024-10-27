CREATE VIEW order_details AS
SELECT
    o.order_id,
    o.customer_id as user_id,
    o.address_id,
    o.payment_id,
    o.order_date,
    o.delivery_estimate,
    o.delivery_method,
    o.contact_email,
    o.contact_phone
FROM orders o;