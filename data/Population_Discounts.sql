-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Discounts table
INSERT INTO discounts (discount_id, discount) VALUES
(1, 10.00),  -- 10% discount
(2, 5.00);   -- 5% discount



-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
