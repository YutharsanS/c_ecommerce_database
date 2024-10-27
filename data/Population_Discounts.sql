-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Discounts table
INSERT INTO discounts (discount_id, discount) VALUES
(1, 10.00),  -- 10% discount
(2, 5.00);   -- 5% discount

INSERT INTO discounts (discount_id, discount) VALUES
(3, 15.00),  -- 15% discount
(4, 20.00);   -- 20% discount


-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;