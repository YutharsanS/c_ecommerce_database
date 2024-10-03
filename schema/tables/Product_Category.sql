-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Product_Category;

CREATE TABLE Product_Category (
  product_id INT NOT NULL,
  category_id INT NOT NULL,
  PRIMARY KEY (product_id, category_id),
  FOREIGN KEY (product_id) REFERENCES Product(product_id),
  FOREIGN KEY (category_id) REFERENCES Category(category_id)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
