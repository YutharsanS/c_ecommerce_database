CREATE TABLE Custom_Errors (
  error_state VARCHAR(20) PRIMARY KEY,
  error_category VARCHAR(20),
  error_message TEXT
);

INSERT INTO `Custom_Errors` VALUES
('45001', 'INV' ,'Warehouse not found'),
('45002', 'INV','Insufficient stock');