-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Product_Attribute table
INSERT INTO product_attribute (product_id, attribute_id, attribute_value) VALUES
(1, 3, 'Apple'),             -- Brand
(1, 4, 'iOS'),               -- Operating System
(1, 5, 'Up to 14 hours');    -- Battery Life

-- Bose SoundLink Speaker (Product ID: 2)
INSERT INTO product_attribute (product_id, attribute_id, attribute_value) VALUES
(2, 3, 'Bose'),              -- Brand
(2, 5, '8 hours'),           -- Battery Life
(2, 6, '5 x 5 x 5 inches');  -- Dimensions

-- LEGO Star Wars Set (Product ID: 3)
INSERT INTO product_attribute (product_id, attribute_id, attribute_value) VALUES
(3, 3, 'LEGO'),              -- Brand
(3, 7, '8+'),                -- Age Group
(3, 8, 'Plastic'),           -- Material
(3, 6, '15 x 10 x 5 inches');-- Dimensions



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
