-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS order_items;

CREATE TABLE order_items (
    order_id INT NOT NULL,
    variant_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, variant_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (variant_id) REFERENCES variant(variant_id)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
