-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Customer;

CREATE TABLE Customer (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  password_hash VARCHAR(255) NOT NULL,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  phone_number VARCHAR(20),
  address_id INT,
  is_guest BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (address_id) REFERENCES Address(address_id)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
