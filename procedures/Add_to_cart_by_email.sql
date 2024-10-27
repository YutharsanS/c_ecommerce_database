DROP PROCEDURE IF EXISTS add_to_cart_email;

DELIMITER $$
CREATE PROCEDURE add_to_cart_email(
    IN p_email VARCHAR(100),
    IN p_variant_id INT,
    IN p_quantity INT
)
BEGIN
    DECLARE v_customer_id INT;
    SET v_customer_id = get_customer_id_with_email(p_email);

    CALL Procedure_Add_To_Cart(v_customer_id, p_variant_id, p_quantity);
END $$

DELIMITER ;

-- CALL add_to_cart_email('jane.smith@example.com', 1, 1);