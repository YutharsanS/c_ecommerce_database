DELIMITER //


CREATE TRIGGER trg_variant_stock_update
AFTER UPDATE ON Variant_Warehouse
FOR EACH ROW
BEGIN
    -- You could add logging or additional business logic here
    -- For example, you might want to track stock changes or send notifications
    IF NEW.stock_count <= 0 THEN
        INSERT INTO stock_alerts (variant_id, warehouse_id, alert_type)
        VALUES (NEW.variant_id, NEW.warehouse_id, 'OUT_OF_STOCK');
    END IF;
END //
DELIMITER ;