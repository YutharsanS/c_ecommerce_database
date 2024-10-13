-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS variant_warehouse;

CREATE TABLE variant_warehouse (
  variant_id INT NOT NULL,
  warehouse_id INT NOT NULL,
  stock_count INT NOT NULL DEFAULT 0,
  PRIMARY KEY (variant_id, warehouse_id),
  FOREIGN KEY (variant_id) REFERENCES variant(variant_id),
  FOREIGN KEY (warehouse_id) REFERENCES warehouse(warehouse_id)
);


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
