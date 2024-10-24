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