-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS variant_attribute;

CREATE TABLE variant_attribute (
    variant_id INT NOT NULL,
    attribute_id INT NOT NULL,
    attribute_value VARCHAR(255) NOT NULL,
    PRIMARY KEY (variant_id, attribute_id),
    FOREIGN KEY (variant_id) REFERENCES variant(variant_id),
    FOREIGN KEY (attribute_id) REFERENCES attribute(attribute_id)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
