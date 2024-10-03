-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Address;

CREATE TABLE Address (
  address_id INT AUTO_INCREMENT PRIMARY KEY,
  line_1 VARCHAR(255) NOT NULL,
  line_2 VARCHAR(255),
  city VARCHAR(100) NOT NULL,
  district VARCHAR(100),
  zip_code VARCHAR(20),
  FOREIGN KEY (city) REFERENCES City(city_name)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
