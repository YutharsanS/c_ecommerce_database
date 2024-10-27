-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Attribute table
INSERT INTO attribute (attribute_id, attribute_name) VALUES
(1, 'Color'),
(2, 'Storage Capacity'),
(3, 'Brand'),
(4, 'Operating System'),
(5, 'Battery Life'),
(6, 'Dimensions'),
(7, 'Age Group'),
(8, 'Material');

INSERT INTO attribute (attribute_id, attribute_name) VALUES
(9,'Screen Size'),
(10,'Waterproof');



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
