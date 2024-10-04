-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Category table
INSERT INTO Category (category_id, category_name, parent_category_id) VALUES
(1, 'Consumer Electronics', NULL),
(2, 'Toys', NULL);

-- Subcategories
INSERT INTO Category (category_id, category_name, parent_category_id) VALUES
(3, 'Mobile Phones', 1),
(4, 'Speakers', 1),
(5, 'Action Figures', 2),
(6, 'Educational Toys', 2);



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
