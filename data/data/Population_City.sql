-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate City table
INSERT INTO City (city_name, is_main_city) VALUES
('Dallas', TRUE),
('Austin', TRUE),
('Houston', TRUE),
('San Antonio', TRUE),
('Fort Worth', FALSE),
('El Paso', FALSE),
('Arlington', FALSE);



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
