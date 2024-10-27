USE c_ecommerce;

DROP PROCEDURE IF EXISTS count_product;

DELIMITER $$
CREATE PROCEDURE count_product()
BEGIN
SELECT COUNT(*) AS total FROM product;
END $$

-- CALL count_product();
