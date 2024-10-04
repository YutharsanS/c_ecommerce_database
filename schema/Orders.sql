-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  address_id INT,
  payment_id INT NOT NULL,
  order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  delivery_estimate DATETIME,
  delivery_method ENUM('Store Pickup', 'Delivery') NOT NULL,
  contact_email VARCHAR(100) NOT NULL,
  contact_phone VARCHAR(20),
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
  FOREIGN KEY (address_id) REFERENCES Address(address_id),
  FOREIGN KEY (payment_id) REFERENCES Payment(payment_id)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
