-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Variant_Attribute;

CREATE TABLE Variant_Attribute (
  variant_id INT NOT NULL,
  attribute_id INT NOT NULL,
  attribute_value VARCHAR(255) NOT NULL,
  PRIMARY KEY (variant_id, attribute_id),
  FOREIGN KEY (variant_id) REFERENCES Variant(variant_id),
  FOREIGN KEY (attribute_id) REFERENCES Attribute(attribute_id)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
