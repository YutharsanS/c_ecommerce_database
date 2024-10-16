DROP PROCEDURE IF EXISTS `procedure_fetch_product_information`;
DELIMITER $$

CREATE PROCEDURE procedure_fetch_product_information(
    IN p_product_id INT
)
BEGIN
    -- Fetch product details
    SELECT
        p.product_id,
        p.product_name,
        p.description
    FROM
        product p
    WHERE
        p.product_id = p_product_id;

    -- Fetch product variants
    SELECT
        v.variant_id,
        v.sku,
        v.price,
        v.weight,
        GROUP_CONCAT(CONCAT(a.attribute_name, ': ', va.attribute_value) SEPARATOR ', ') AS variant_attributes
    FROM
        variant v
        LEFT JOIN variant_attribute va ON v.variant_id = va.variant_id
        LEFT JOIN attribute a ON va.attribute_id = a.attribute_id
    WHERE
        v.product_id = p_product_id
    GROUP BY
        v.variant_id;

    -- Fetch product categories
    SELECT
        c.category_id,
        c.category_name
    FROM
        product_category pc
        INNER JOIN category c ON pc.category_id = c.category_id
    WHERE
        pc.product_id = p_product_id;

    -- Fetch inventory levels
    SELECT
        vw.warehouse_id,
        vw.variant_id,
        vw.stock_count
    FROM
        variant_warehouse vw
        INNER JOIN warehouse w ON vw.warehouse_id = w.warehouse_id
    WHERE
        vw.variant_id IN (SELECT variant_id FROM variant WHERE product_id = p_product_id);
END$$

DELIMITER ;
