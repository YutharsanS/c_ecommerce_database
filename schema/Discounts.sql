-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Discounts;

CREATE TABLE Discounts (
  discount_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  discount DECIMAL(5, 2) NOT NULL
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
