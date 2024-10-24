-- Stored Procedure for Payment Processing
DELIMITER //
CREATE PROCEDURE sp_process_payment(
    IN p_order_id INT,
    IN p_payment_method VARCHAR(50),
    IN p_amount DECIMAL(10,2)
)
BEGIN
    DECLARE v_payment_id INT;
    
    START TRANSACTION;
    
    -- Create payment record
    INSERT INTO Payment (payment_method, amount)
    VALUES (p_payment_method, p_amount);
    
    SET v_payment_id = LAST_INSERT_ID();
    
    -- Update order with payment ID
    UPDATE Orders 
    SET payment_id = v_payment_id
    WHERE order_id = p_order_id;
    
    COMMIT;
    
    SELECT v_payment_id AS payment_id;
END //
DELIMITER ;
select * from orders;
select * from Payment;
call sp_process_payment(1,'Card',1399.97);

-- Trigger to validate payment amount
DELIMITER //
CREATE TRIGGER before_payment_insert
BEFORE INSERT ON Payment
FOR EACH ROW
BEGIN
    IF NEW.amount <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Payment amount must be greater than zero';
    END IF;
END;//
DELIMITER ;