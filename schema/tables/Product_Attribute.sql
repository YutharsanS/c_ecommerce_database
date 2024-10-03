-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Product_Attribute;

CREATE TABLE Product_Attribute (
  product_id INT NOT NULL,
  attribute_id INT NOT NULL,
  attribute_value VARCHAR(255) NOT NULL,
  PRIMARY KEY (product_id, attribute_id),
  FOREIGN KEY (product_id) REFERENCES Product(product_id),
  FOREIGN KEY (attribute_id) REFERENCES Attribute(attribute_id)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
