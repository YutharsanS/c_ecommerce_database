-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS customer;

CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    password_hash VARCHAR(255),
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL UNIQUE,
    customer_phone_number VARCHAR(20),
    address_id INT,
    is_guest BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (address_id) REFERENCES address(address_id)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
