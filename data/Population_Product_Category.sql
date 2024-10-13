-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Product_Category table
INSERT INTO product_category (product_id, category_id) VALUES
(1, 3),
(2, 4),
(3, 6);



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
