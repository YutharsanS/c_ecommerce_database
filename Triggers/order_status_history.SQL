DELIMITER //

DROP TRIGGER IF EXISTS trg_order_status_history;

CREATE TRIGGER 

AFTER UPDATE ON Orders
FOR EACH ROW
BEGIN
    -- Only track status changes
    IF OLD.delivery_method != NEW.delivery_method THEN
        INSERT INTO Order_Status_History (
            order_id,
            old_status,
            new_status,
            changed_at
        )
        VALUES (
            NEW.order_id,
            OLD.delivery_method, -- Assuming this is the status you want to track
            NEW.delivery_method, -- Assuming this is the new status you want to track
            NOW()
        );
    END IF;
END //

DELIMITER ;

UPDATE Orders
SET delivery_method = 'Store Pickup'  -- Change to a new delivery method or status
WHERE order_id = 3;                -- Replace with a valid order ID

SELECT * FROM orders