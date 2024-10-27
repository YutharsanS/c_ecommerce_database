DROP PROCEDURE IF EXISTS delete_cart_item;

DELIMITER $$

CREATE PROCEDURE delete_cart_item(
    IN p_cart_id INT,
    IN p_variant_id INT
)
BEGIN
    DELETE FROM cart_items
    WHERE cart_id = p_cart_id
    AND
    variant_id = p_variant_id;
END$$
DELIMITER ;

-- CALL delete_cart_item(1, 5)

DROP PROCEDURE IF EXISTS delete_cart_item_by_email;
DELIMITER $$
CREATE PROCEDURE `delete_cart_item_by_email_id`(
    IN p_email VARCHAR(100),
    IN p_variant_id INT
)
BEGIN
    DECLARE v_customer_id INT;
    DECLARE v_cart_id INT;
    SET v_customer_id = get_customer_id_with_email(p_email);
    SET v_cart_id = get_cart_id(v_customer_id);

    DELETE FROM cart_items
    WHERE cart_id = v_cart_id
    AND
    variant_id = p_variant_id;
END $$

DROP PROCEDURE IF EXISTS delete_cart_item_by_email;
CREATE PROCEDURE `delete_cart_item_by_email`(
    IN p_email VARCHAR(100)
)
BEGIN
    DECLARE v_customer_id INT;
    DECLARE v_cart_id INT;
    SET v_customer_id = get_customer_id_with_email(p_email);
    SET v_cart_id = get_cart_id(v_customer_id);

    DELETE FROM cart_items
    WHERE cart_id = v_cart_id;
END

-- CALL delete_cart_item_by_email('yutharsansivabalan@gmail.com');