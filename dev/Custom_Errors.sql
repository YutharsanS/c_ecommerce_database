CREATE TABLE custom_errors (
  error_state VARCHAR(20) PRIMARY KEY,
  error_category VARCHAR(20),
  error_message TEXT
);

INSERT INTO `custom_errors` VALUES
('45001', 'INV' ,'Warehouse not found'),
('45002', 'INV','Insufficient stock'),
('45003', 'INV','Variant entry not found');
