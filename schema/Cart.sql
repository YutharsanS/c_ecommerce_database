-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS cart;

CREATE TABLE cart (
  cart_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
