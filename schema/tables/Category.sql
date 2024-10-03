-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Category;

CREATE TABLE Category (
  category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(100) NOT NULL,
  parent_category_id INT,
  FOREIGN KEY (parent_category_id) REFERENCES Category(category_id)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
