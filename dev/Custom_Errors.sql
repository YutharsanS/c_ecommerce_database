DROP TABLE IF EXISTS custom_errors;
CREATE TABLE custom_errors (
  error_state VARCHAR(20) PRIMARY KEY,
  error_category VARCHAR(20),
  error_message TEXT
);

INSERT INTO `custom_errors` VALUES
('45001', 'INV' ,'Warehouse not found'),
('45002', 'INV','Insufficient stock'),
('45003', 'INV','Variant entry not found'),
('45004', 'INV','Quantity must be a positive integer.'),
('45005', 'INV','No items in cart'),
('45006', 'INV','Stock information not found for variant ID ');
