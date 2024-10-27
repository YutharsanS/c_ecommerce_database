-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO category (category_id, category_name, parent_category_id) VALUES
(1, 'Consumer Electronics', NULL),
(2, 'Toys', NULL);
INSERT INTO category (category_id, category_name, parent_category_id) VALUES
(3,'Fashion',NULL),
(4,'Home Appliance',NULL),
(5,'Books',NULL);

-- Subcategories
INSERT INTO category (category_id, category_name, parent_category_id) VALUES
(49, 'Mobile Phones', 1),
(50, 'Speakers', 1),
(7, 'Laptops', 1),
(8, 'Tablets', 1),
(9, 'Smart Watches', 1),
(10, 'Headphones', 1),
(11, 'Gaming Consoles', 1),
(12, 'Digital Cameras', 1);

-- Toys
INSERT INTO category (category_id, category_name, parent_category_id)
VALUES
    (51, 'Educational Toys', 2),
    (52, 'Action Figures & Collectibles', 2),
    (53, 'Dolls & Accessories', 2),
    (54, 'Building & Construction Toys', 2),
    (55, 'Electronic & Robotic Toys', 2),
    (56, 'Vehicles & Playsets', 2),
    (57, 'Role-Playing Toys', 2),
    (58, 'Outdoor & Sports Toys', 2),
    (59, 'Musical & Sensory Toys', 2),
    (60, 'Board Games & Puzzles', 2),

-- Fashion subcategories
INSERT INTO category (category_id, category_name, parent_category_id) VALUES
(13, 'Men''s Clothing', 3),
(14, 'Women''s Clothing', 3),
(15, 'Kids'' Clothing', 3),
(16, 'Footwear', 3),
(17, 'Accessories', 3),
(18, 'Jewelry', 3),
(19, 'Bags & Wallets', 3),
(20, 'Sportswear', 3),
(21, 'Ethnic Wear', 3),
(22, 'Lingerie & Sleepwear', 3),
(23, 'Winter Wear', 3),
(24, 'Designer Brands', 3);

-- Home Appliance subcategories
INSERT INTO category (category_id, category_name, parent_category_id) VALUES
(25, 'Refrigerators', 4),
(26, 'Washing Machines', 4),
(27, 'Air Conditioners', 4),
(28, 'Microwave Ovens', 4),
(29, 'Dishwashers', 4),
(30, 'Water Heaters', 4),
(31, 'Vacuum Cleaners', 4),
(32, 'Kitchen Appliances', 4),
(33, 'Air Purifiers', 4),
(34, 'Food Processors', 4),
(35, 'Electric Fans', 4),
(36, 'Chimneys & Cooktops', 4);

-- Books subcategories
INSERT INTO category (category_id, category_name, parent_category_id) VALUES
(37, 'Fiction', 5),
(38, 'Non-Fiction', 5),
(39, 'Academic & Educational', 5),
(40, 'Children''s Books', 5),
(41, 'Comics & Manga', 5),
(42, 'Self-Help', 5),
(43, 'Business & Economics', 5),
(44, 'Technology & Science', 5),
(45, 'Biography & Memoirs', 5),
(46, 'History', 5),
(47, 'Literature & Poetry', 5),
(48, 'Religious & Spiritual', 5);



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
