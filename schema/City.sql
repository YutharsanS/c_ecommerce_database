-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS City;

CREATE TABLE City (
  city_name VARCHAR(100) PRIMARY KEY,
  is_main_city BOOLEAN DEFAULT FALSE
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
