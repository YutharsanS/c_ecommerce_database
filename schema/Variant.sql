-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS variant;

CREATE TABLE variant (
    variant_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    sku VARCHAR(100) UNIQUE,
    price DECIMAL(10, 2) NOT NULL,
    weight DECIMAL(10, 2),
    discount_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (discount_id) REFERENCES discounts(discount_id)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
