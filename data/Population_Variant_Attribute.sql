-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Variant_Attribute table
INSERT INTO variant_attribute (variant_id, attribute_id, attribute_value) VALUES
(1, 1, 'Black'),   -- Color
(1, 2, '16GB'),    -- Storage Capacity
(2, 1, 'Red'),
(2, 2, '16GB'),
(3, 1, 'Black'),
(3, 2, '32GB'),
(4, 1, 'Red'),
(4, 2, '32GB');

-- Bose Speaker Variant
INSERT INTO variant_attribute (variant_id, attribute_id, attribute_value) VALUES
(5, 1, 'Black');



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
