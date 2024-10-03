-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Attribute;

CREATE TABLE Attribute (
  attribute_id INT AUTO_INCREMENT PRIMARY KEY,
  attribute_name VARCHAR(100) NOT NULL
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
