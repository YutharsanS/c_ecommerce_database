-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS cart_items;

CREATE TABLE cart_items (
  cart_id INT NOT NULL,
  variant_id INT NOT NULL,
  quantity INT NOT NULL,
  PRIMARY KEY (cart_id, variant_id),
  FOREIGN KEY (cart_id) REFERENCES Cart(cart_id),
  FOREIGN KEY (variant_id) REFERENCES Variant(variant_id)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
