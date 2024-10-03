-- Disable foreign key checks to prevent issues during table creation
SET FOREIGN_KEY_CHECKS = 0;

-- Drop tables if they exist
DROP TABLE IF EXISTS Order_Items;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Cart_Items;
DROP TABLE IF EXISTS Cart;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Address;
DROP TABLE IF EXISTS Variant_Attribute;
DROP TABLE IF EXISTS Variant_Warehouse;
DROP TABLE IF EXISTS Variant;
DROP TABLE IF EXISTS Product_Attribute;
DROP TABLE IF EXISTS Product_Category;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Attribute;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Discounts;
DROP TABLE IF EXISTS Warehouse;
DROP TABLE IF EXISTS City;

-- Create Discounts table
CREATE TABLE Discounts (
  discount_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  discount DECIMAL(5, 2) NOT NULL
);

-- Create Category table
CREATE TABLE Category (
  category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(100) NOT NULL,
  parent_category_id INT,
  FOREIGN KEY (parent_category_id) REFERENCES Category(category_id)
);

-- Create Attribute table
CREATE TABLE Attribute (
  attribute_id INT AUTO_INCREMENT PRIMARY KEY,
  attribute_name VARCHAR(100) NOT NULL
);

-- Create Product table
CREATE TABLE Product (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(255) NOT NULL,
  description TEXT,
);

-- Create Product_Category table
CREATE TABLE Product_Category (
  product_id INT NOT NULL,
  category_id INT NOT NULL,
  PRIMARY KEY (product_id, category_id),
  FOREIGN KEY (product_id) REFERENCES Product(product_id),
  FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

-- Create Product_Attribute table
CREATE TABLE Product_Attribute (
  product_id INT NOT NULL,
  attribute_id INT NOT NULL,
  attribute_value VARCHAR(255) NOT NULL,
  PRIMARY KEY (product_id, attribute_id),
  FOREIGN KEY (product_id) REFERENCES Product(product_id),
  FOREIGN KEY (attribute_id) REFERENCES Attribute(attribute_id)
);

-- Create Variant table
CREATE TABLE Variant (
  variant_id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT NOT NULL,
  sku VARCHAR(100) UNIQUE,
  price DECIMAL(10,2) NOT NULL,
  weight DECIMAL(10,2),
  discount_id INT,
  FOREIGN KEY (product_id) REFERENCES Product(product_id),
  FOREIGN KEY (discount_id) REFERENCES Discounts(discount_id)
);

-- Create Variant_Attribute table
CREATE TABLE Variant_Attribute (
  variant_id INT NOT NULL,
  attribute_id INT NOT NULL,
  attribute_value VARCHAR(255) NOT NULL,
  PRIMARY KEY (variant_id, attribute_id),
  FOREIGN KEY (variant_id) REFERENCES Variant(variant_id),
  FOREIGN KEY (attribute_id) REFERENCES Attribute(attribute_id)
);

-- Create Warehouse table
CREATE TABLE Warehouse (
  warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
  warehouse_name VARCHAR(100) NOT NULL,
  location VARCHAR(255)
);

-- Create Variant_Warehouse table
CREATE TABLE Variant_Warehouse (
  variant_id INT NOT NULL,
  warehouse_id INT NOT NULL,
  stock_count INT NOT NULL DEFAULT 0,
  PRIMARY KEY (variant_id, warehouse_id),
  FOREIGN KEY (variant_id) REFERENCES Variant(variant_id),
  FOREIGN KEY (warehouse_id) REFERENCES Warehouse(warehouse_id)
);

-- Create City table
CREATE TABLE City (
  city_name VARCHAR(100) PRIMARY KEY,
  is_main_city BOOLEAN DEFAULT FALSE
);

-- Create Address table
CREATE TABLE Address (
  address_id INT AUTO_INCREMENT PRIMARY KEY,
  line_1 VARCHAR(255) NOT NULL,
  line_2 VARCHAR(255),
  city VARCHAR(100) NOT NULL,
  district VARCHAR(100),
  zip_code VARCHAR(20),
  FOREIGN KEY (city) REFERENCES City(city_name)
);

-- Create Customer table
CREATE TABLE Customer (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  password_hash VARCHAR(255) NOT NULL,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  phone_number VARCHAR(20),
  address_id INT,
  is_guest BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (address_id) REFERENCES Address(address_id)
);

-- Create Cart table
CREATE TABLE Cart (
  cart_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- Create Cart_Items table
CREATE TABLE Cart_Items (
  cart_id INT NOT NULL,
  variant_id INT NOT NULL,
  quantity INT NOT NULL,
  PRIMARY KEY (cart_id, variant_id),
  FOREIGN KEY (cart_id) REFERENCES Cart(cart_id),
  FOREIGN KEY (variant_id) REFERENCES Variant(variant_id)
);

-- Create Payment table
CREATE TABLE Payment (
  payment_id INT AUTO_INCREMENT PRIMARY KEY,
  payment_method ENUM('Cash on Delivery', 'Card') NOT NULL,
  amount DECIMAL(10, 2) NOT NULL,
  payment_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Create Orders table
CREATE TABLE Orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  address_id INT,
  payment_id INT NOT NULL,
  order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  delivery_estimate DATETIME,
  delivery_method ENUM('Store Pickup', 'Delivery') NOT NULL,
  contact_email VARCHAR(100) NOT NULL,
  contact_phone VARCHAR(20),
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
  FOREIGN KEY (address_id) REFERENCES Address(address_id),
  FOREIGN KEY (payment_id) REFERENCES Payment(payment_id)
);

-- Create Order_Items table
CREATE TABLE Order_Items (
  order_id INT NOT NULL,
  variant_id INT NOT NULL,
  quantity INT NOT NULL,
  PRIMARY KEY (order_id, variant_id),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (variant_id) REFERENCES Variant(variant_id)
);

-- Re-enable foreign key checks after table creation
SET FOREIGN_KEY_CHECKS = 1;