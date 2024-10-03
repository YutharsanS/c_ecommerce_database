-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Warehouse;

CREATE TABLE Warehouse (
  warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
  warehouse_name VARCHAR(100) NOT NULL,
  location VARCHAR(255)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
