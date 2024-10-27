-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Variant table
INSERT INTO variant (variant_id, product_id, sku, price, weight, discount_id) VALUES
(1, 1, 'IPX-16GB-BLK', 999.99, 0.174, 1),    -- iPhone X 16GB Black
(2, 1, 'IPX-16GB-RED', 999.99, 0.174, NULL), -- iPhone X 16GB Red
(3, 1, 'IPX-32GB-BLK', 1099.99, 0.174, 2),   -- iPhone X 32GB Black
(4, 1, 'IPX-32GB-RED', 1099.99, 0.174, NULL),-- iPhone X 32GB Red
(5, 2, 'BSS-BLK', 199.99, 1.2, NULL),        -- Bose Speaker Black
(6, 3, 'LSW-SET', 89.99, 2.5, NULL);         -- LEGO Star Wars Set

-- Variants for Mobile Phones
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES
(4, 'IP15PM-128GB-BLK', 1199.99, 0.22, 1),
(4, 'IP15PM-256GB-BLK', 1299.99, 0.20, NULL),
(4, 'IP15PM-512GB-BLK', 1499.99, 0.20, 2),
(4, 'IP15PM-1TB-BLK', 1699.99, 0.20, NULL),
(4, 'IP15PM-128GB-RED', 1199.99, 0.20, 1),
-- (5, 'SGS24U-256GB-BLK', 1199.99, 0.234, NULL),
(5, 'SGS24U-512GB-BLK', 1299.99, 0.34, 4),
(5, 'SGS24U-1TB-BLK', 1399.99, 0.24, NULL),
(5, 'SGS24U-256GB-GRN', 1199.99, 0.34, 2),
(6, 'NP2-128GB-BLK', 899.99, 0.21, 3),
-- (6, 'NP2-256GB-BLK', 999.99, 0.215, 3), 
(6, 'NP2-512GB-BLK', 1099.99, 0.15, NULL),
(6, 'NP2-128GB-WHT', 899.99, 0.25, 3),
(7, 'SX1V-256GB-BLK', 1099.99, 0.10, NULL),
(7, 'SX1V-512GB-BLK', 1199.99, 0.10, 4),
(8, 'ROG8-512GB-BLK', 999.99, 0.40, NULL),
(8, 'ROG8-256GB-BLK', 899.99, 0.40, 2),
(9, 'ME40P-256GB-BLK', 849.99, 0.20, NULL),
(9, 'ME40P-512GB-BLK', 949.99, 0.21, 1),
(10, 'VXP100-256GB-BLK', 899.99, 0.20, NULL),
(10, 'VXP100-512GB-BLK', 999.99, 0.20, 2);

-- Variants for Laptops
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES
(11, 'MBP16-512GB-SPC', 2399.99, 2.2, 2),
(11, 'MBP16-1TB-SPC', 2699.99, 2.2, NULL),
(11, 'MBP16-2TB-SPC', 2999.99, 2.2, 4),
(12, 'DXPS15-512GB-SIL', 1499.99, 1.8, 1),
(12, 'DXPS15-1TB-SIL', 1699.99, 1.8, NULL),
(12, 'DXPS15-512GB-BLK', 1499.99, 1.8, 4),
-- (12, 'DXPS15-1TB-BLK', 1699.99, 1.8, NULL),
(13, 'LPX1C-512GB-BLK', 1399.99, 1.3, NULL),
(13, 'LPX1C-1TB-BLK', 1599.99, 1.3, 2),
(14, 'ASUSRG14-1TB-BLK', 1899.99, 1.6, 2),
(15, 'HPSX360-512GB-SLV', 1299.99, 1.4, NULL),
(15, 'HPSX360-1TB-SLV', 1499.99, 1.4, 3),
(16, 'RBL18-1TB-BLK', 2999.99, 3.5, NULL),
(16, 'RBL18-2TB-BLK', 3199.99, 3.5, 4),
(17, 'ASE-512GB-SIL', 1099.99, 1.2, NULL),
(18, 'MSL6-256GB-BLK', 999.99, 1.5, NULL),
(19, 'MZ17-1TB-BLK', 1999.99, 2.0, 2),
(20, 'FRM-LAPTOP-BLK', 1499.99, 1.5, NULL);

-- Variants for Speakers
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES
(51, 'BSR-BLK', 299.99, 0.9, NULL),
(51, 'BSR-SLV', 299.99, 0.9, 1),
-- (51, 'BSR-BLU', 299.99, 0.9, NULL),
(52, 'JBLPB310-BLK', 499.99, 17.4, 3),
(52, 'JBLPB310-WHT', 499.99, 17.4, 1),
(52, 'JBLPB310-BLK-BUNDLE', 549.99, 17.8, NULL),
(53, 'SXRXB43-BLK', 249.99, 1.5, NULL),
(54, 'SNMOVE-BLK', 399.99, 2.0, NULL),
(55, 'MSII-VINTAGE', 349.99, 1.2, 2),
(56, 'UEB3-BLK', 199.99, 0.8, NULL),
(57, 'SCFLARE2-BLK', 49.99, 0.5, NULL),
(58, 'KLOII-BLK', 299.99, 1.3, 4),
(59, 'HKOS6-BLK', 399.99, 1.8, NULL),
(60, 'BOL20-BLK', 599.99, 1.9, 2);

-- Variants for Tablets
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES
(61, 'IPADPRO12-128GB-SLV', 1099.99, 0.62, 1),
(61, 'IPADPRO12-256GB-SLV', 1199.99, 0.82, NULL),
(61, 'IPADPRO12-512GB-SLV', 1399.99, 0.68, 3),
(61, 'IPADPRO12-1TB-SLV', 1599.99, 0.62, NULL),
(62, 'SGTABS9-128GB-BLK', 699.99, 0.58, 2),
(62, 'SGTABS9-256GB-BLK', 799.99, 0.56, NULL),
(63, 'MSP9-128GB-BLK', 999.99, 0.82, 2),
(63, 'MSP9-256GB-BLK', 1099.99, 0.92, 4),
(64, 'AFHD10-32GB-BLK', 149.99, 0.45, NULL),
(65, 'LENOVOTABP12-128GB-BLK', 799.99, 0.660, 2),
(66, 'XMI-PAD6-128GB-BLK', 399.99, 0.50, NULL),
(67, 'ROGZ13-512GB-BLK', 1299.99, 1.1, 1),
(68, 'HMATEPADPRO-256GB-BLK', 899.99, 0.60, NULL),
(69, 'RPADX-64GB-BLK', 199.99, 0.70, 1),
(70, 'NOKIAT20-64GB-BLK', 249.99, 0.40, NULL);

-- Variants for Smart Watches
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES
(71, 'AW9-ALUM-BLK', 399.99, 0.03, 1),
(71, 'AW9-ALUM-WHT', 399.99, 0.02, 2),
(72, 'SGW6-BLK', 349.99, 0.54, NULL),
(73, 'GARMIN965-BLK', 599.99, 0.55, 1),
(74, 'FBVERSA4-BLK', 229.99, 0.38, NULL),
(75, 'AMGTR4-BLK', 199.99, 0.45, 4),
(76, 'HWGT3PRO-BLK', 499.99, 0.45, NULL),
(77, 'WSCANW-BLK', 299.99, 0.38, NULL),
(78, 'TWPRO3-BLK', 299.99, 0.05, 3),
(79, 'FOSSILGEN6-BLK', 299.99, 0.37, NULL),
(80, 'POLARGRITX-BLK', 429.99, 0.04, 1);

-- Variants for Headphones
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES
(81, 'SONYWH1000XM5-BLK', 349.99, 0.20, NULL),
(82, 'AIRPODSMAX-BLK', 549.99, 0.34, 1),
(83, 'BOSEQC45-BLK', 329.99, 0.20, NULL),
(84, 'SENHD560S-BLK', 199.99, 0.25, 1),
(85, 'JAE85T-BLK', 229.99, 0.05, NULL),
(86, 'BEATSSTUDI-BLK', 149.99, 0.17, NULL),
(87, 'AKGN700NC-BLK', 299.99, 0.20, NULL),
(88, 'ANKERSOUNDCORE3-BLK', 149.99, 0.01, 2),
(89, 'SHUREAONIC50-BLK', 349.99, 0.23, NULL),
(90, 'BOWERSPX7-BLK', 399.99, 0.25, NULL);

-- Variants for Gaming Consoles
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES
(91, 'PS5-DIGITAL-BLK', 499.99, 4.5, NULL),
(92, 'XBX-X-BLK', 499.99, 4.4, NULL),
(93, 'NINTSWITCHOLED-BLK', 349.99, 0.42, 2),
(94, 'STEAMDECK-64GB-BLK', 399.99, 1.4, NULL),
(95, 'XBX-S-BLK', 299.99, 4.2, NULL),
(96, 'NINTSWITCHLITE-BLK', 199.99, 0.27, 1),
(97, 'PSVR2-BLK', 549.99, 0.52, NULL),
(98, 'LOGITECHG-CLOUD-BLK', 349.99, 0.40, NULL),
(99, 'ANALOGPOCKET-BLK', 199.99, 0.32, 1),
(100, 'ATARI-VCS-BLK', 299.99, 2.5, NULL);

-- Variants for Digital Cameras
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES
(101, 'CANEOSR5-8K-BLK', 3899.99, 0.78, 1),
(102, 'NIKONZ7II-BLK', 2999.99, 0.67, NULL),
(103, 'SONYA7IV-BLK', 2499.99, 0.68, NULL),
(104, 'FUJIXT5-BLK', 1699.99, 0.68, NULL),
(105, 'PANASONICGH6-BLK', 1999.99, 0.90, 2),
(106, 'LEICAQ2-BLK', 1999.99, 0.64, NULL),
(107, 'OLYMPUSOMD-BLK', 1299.99, 0.50, NULL),
(108, 'GOPROHERO12-BLK', 399.99, 0.30, NULL),
(109, 'DJIPOCKET2-BLK', 349.99, 0.25, NULL),
(110, 'RICOHGRIII-BLK', 899.99, 0.20, 3);

-- Variants for 'Classic White Shirt'
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES
(111, 'CWS-001-S', 49.99, 0.25, 1),  -- Size S
(111, 'CWS-001-M', 49.99, 0.26, 1),  -- Size M
(111, 'CWS-001-L', 49.99, 0.27, 1),  -- Size L

-- Variants for 'Slim Fit Jeans'
(112, 'SFJ-001-30', 59.99, 0.85, 1),  -- Size 30
(112, 'SFJ-001-32', 59.99, 0.86, 1),  -- Size 32
(112, 'SFJ-001-34', 59.99, 0.87, 1),  -- Size 34

-- Variants for 'Bomber Jacket'
(113, 'BJ-001-S', 79.99, 1.00, 1),  -- Size S
(113, 'BJ-001-M', 79.99, 1.05, 1),  -- Size M
(113, 'BJ-001-L', 79.99, 1.10, 1),  -- Size L

-- Variants for 'Cargo Shorts'
(114, 'CS-001-S', 39.99, 0.60, 1),  -- Size S
(114, 'CS-001-M', 39.99, 0.65, 1),  -- Size M
(114, 'CS-001-L', 39.99, 0.70, 1),  -- Size L

-- Variants for 'V-Neck Sweater'
(115, 'VNS-001-S', 49.99, 0.75, 1),  -- Size S
(115, 'VNS-001-M', 49.99, 0.80, 1),  -- Size M
(115, 'VNS-001-L', 49.99, 0.85, 1);  -- Size L

-- Variants for 'Floral Summer Dress'
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES
(116, 'FSD-01-S', 59.99, 0.50, 1),  -- Size S
(116, 'FSD-02-M', 59.99, 0.55, 1),  -- Size M
(116, 'FSD-03-L', 59.99, 0.60, 1);  -- Size L

-- Variants for 'High-Waist Jeans'
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES
(117, 'HWJ-01-30', 69.99, 0.80, 1),  -- Size 30
(117, 'HWJ-02-32', 69.99, 0.85, 1),  -- Size 32
(117, 'HWJ-03-34', 69.99, 0.90, 1);  -- Size 34

-- Variants for 'Blazer Coat'
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES
(118, 'BC-01-S', 129.99, 1.20, 1),  -- Size S
(118, 'BC-02-M', 129.99, 1.25, 1),  -- Size M
(118, 'BC-03-L', 129.99, 1.30, 1);  -- Size L

-- Variants for 'Crop Top'
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES
(119, 'CT-01-S', 29.99, 0.30, 1),  -- Size S
(119, 'CT-02-M', 29.99, 0.35, 1),  -- Size M
(119, 'CT-03-L', 29.99, 0.40, 1);  -- Size L

-- Variants for 'Midi Skirt'
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES
(120, 'MS-01-S', 39.99, 0.50, 1),  -- Size S
(120, 'MS-02-M', 39.99, 0.55, 1),  -- Size M
(120, 'MS-03-L', 39.99, 0.60, 1);  -- Size L



-- Variants for products after product_id 120

INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES
(121, 'GRAPHIC-T-SHIRT-S', 15.99, 0.25, NULL),
(121, 'GRAPHIC-T-SHIRT-M', 15.99, 0.26, NULL),
(121, 'GRAPHIC-T-SHIRT-L', 15.99, 0.27, NULL),

(122, 'KIDS-DENIM-SHORTS-3Y', 19.99, 0.30, NULL),
(122, 'KIDS-DENIM-SHORTS-5Y', 19.99, 0.32, NULL),
(122, 'KIDS-DENIM-SHORTS-7Y', 19.99, 0.34, NULL),

(123, 'WINTER-JACKET-S', 49.99, 1.00, NULL),
(123, 'WINTER-JACKET-M', 49.99, 1.02, NULL),
(123, 'WINTER-JACKET-L', 49.99, 1.05, NULL),

(124, 'SCHOOL-UNIFORM-SET-3Y', 39.99, 0.75, NULL),
(124, 'SCHOOL-UNIFORM-SET-5Y', 39.99, 0.80, NULL),
(124, 'SCHOOL-UNIFORM-SET-7Y', 39.99, 0.85, NULL),

(125, 'PAJAMA-SET-S', 25.99, 0.50, NULL),
(125, 'PAJAMA-SET-M', 25.99, 0.55, NULL),
(125, 'PAJAMA-SET-L', 25.99, 0.60, NULL),

(126, 'RUNNING-SHOES-8', 59.99, 0.75, NULL),
(126, 'RUNNING-SHOES-9', 59.99, 0.77, NULL),
(126, 'RUNNING-SHOES-10', 59.99, 0.80, NULL),

(127, 'LEATHER-BOOTS-8', 89.99, 1.20, NULL),
(127, 'LEATHER-BOOTS-9', 89.99, 1.25, NULL),
(127, 'LEATHER-BOOTS-10', 89.99, 1.30, NULL),

(128, 'FORMAL-SHOES-8', 69.99, 0.90, NULL),
(128, 'FORMAL-SHOES-9', 69.99, 0.95, NULL),
(128, 'FORMAL-SHOES-10', 69.99, 1.00, NULL),

(129, 'FLIP-FLOPS-S', 14.99, 0.30, NULL),
(129, 'FLIP-FLOPS-M', 14.99, 0.32, NULL),
(129, 'FLIP-FLOPS-L', 14.99, 0.34, NULL),

(130, 'SANDALS-S', 24.99, 0.40, NULL),
(130, 'SANDALS-M', 24.99, 0.42, NULL),
(130, 'SANDALS-L', 24.99, 0.44, NULL),

(131, 'LEATHER-BELT-S', 29.99, 0.20, NULL),
(131, 'LEATHER-BELT-M', 29.99, 0.22, NULL),
(131, 'LEATHER-BELT-L', 29.99, 0.24, NULL),

(132, 'SUNGLASSES-BLACK', 49.99, 0.15, NULL),
(132, 'SUNGLASSES-BROWN', 49.99, 0.15, NULL),
(132, 'SUNGLASSES-RED', 49.99, 0.15, NULL),

(133, 'BASEBALL-CAP-BLACK', 19.99, 0.10, NULL),
(133, 'BASEBALL-CAP-WHITE', 19.99, 0.10, NULL),
(133, 'BASEBALL-CAP-RED', 19.99, 0.10, NULL),

(134, 'SCARF-RED', 15.99, 0.25, NULL),
(134, 'SCARF-BLUE', 15.99, 0.25, NULL),
(134, 'SCARF-GREEN', 15.99, 0.25, NULL),

(135, 'WATCH-CLASSIC', 99.99, 0.50, NULL),
(135, 'WATCH-SPORT', 109.99, 0.55, NULL),
(135, 'WATCH-DIGITAL', 89.99, 0.45, NULL);

-- Jewelry Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(136, 'GJ-001-GOLD', 150.00, 0.05, NULL),
(136, 'GJ-001-SILVER', 120.00, 0.05, 1),
(137, 'GJ-002-SILVER', 80.00, 0.03, NULL),
(137, 'GJ-002-BLACK', 85.00, 0.03, 2),
(138, 'GJ-003-ROUND', 200.00, 0.07, NULL),
(138, 'GJ-003-OVAL', 220.00, 0.07, 2),
(139, 'GJ-004-WHITE', 90.00, 0.04, NULL),
(140, 'GJ-005-BLUE', 70.00, 0.02, NULL),
(140, 'GJ-005-PINK', 75.00, 0.02, 2);

-- Bags & Wallets Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(141, 'BW-001-BROWN', 50.00, 0.6, NULL),
(141, 'BW-001-BLACK', 55.00, 0.6, 2),
(142, 'BW-002-BLACK', 60.00, 0.5, NULL),
(142, 'BW-002-GREEN', 65.00, 0.5, 2),
(143, 'BW-003-RED', 45.00, 0.4, NULL),
(144, 'BW-004-NAVY', 40.00, 0.4, NULL),
(145, 'BW-005-GLITTER', 75.00, 0.5, 2);

-- Sportswear Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(146, 'SW-001-M', 30.00, 0.2, NULL),
(146, 'SW-001-L', 32.00, 0.2, 2),
(147, 'SW-002-S', 28.00, 0.2, NULL),
(147, 'SW-002-M', 30.00, 0.2, 1),
(148, 'SW-003-S', 35.00, 0.25, NULL),
(149, 'SW-004-M', 33.00, 0.25, 1),
(150, 'SW-005-L', 40.00, 0.25, NULL);

-- Ethnic Wear Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(151, 'EW-001-RED', 100.00, 0.4, NULL),
(151, 'EW-001-BLUE', 110.00, 0.4, 1),
(152, 'EW-002-L', 120.00, 0.5, NULL),
(152, 'EW-002-XL', 125.00, 0.5, 1),
(153, 'EW-003-GREEN', 90.00, 0.3, NULL),
(154, 'EW-004-EMBROIDERED', 140.00, 0.6, 2),
(155, 'EW-005-YELLOW', 95.00, 0.3, NULL);

-- Lingerie & Sleepwear Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(156, 'LS-001-S', 25.00, 0.1, NULL),
(156, 'LS-001-M', 27.00, 0.1, 1),
(157, 'LS-002-BLACK', 30.00, 0.1, NULL),
(158, 'LS-003-S', 28.00, 0.1, 1),
(159, 'LS-004-RED', 26.00, 0.1, NULL),
(160, 'LS-005-M', 29.00, 0.1, 1);

-- Winter Wear Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(161, 'WW-001-XL', 80.00, 1.0, NULL),
(161, 'WW-001-XXL', 85.00, 1.0, 1),
(162, 'WW-002-GREY', 75.00, 0.8, NULL),
(163, 'WW-003-S', 70.00, 0.6, NULL),
(164, 'WW-004-RED', 90.00, 0.9, 1),
(165, 'WW-005-BLACK', 95.00, 0.9, NULL);

-- Designer Brands Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(166, 'DB-001-BLACK', 200.00, 1.5, NULL),
(166, 'DB-001-BROWN', 210.00, 1.5, 2),
(167, 'DB-002-GREY', 180.00, 1.4, NULL),
(168, 'DB-003-38', 190.00, 1.3, 1),
(169, 'DB-004-32', 185.00, 1.3, NULL),
(170, 'DB-005-NAVY', 195.00, 1.4, 1);

-- Refrigerators Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(171, 'RF-001-SMALL', 500.00, 30.0, NULL),
(172, 'RF-002-MEDIUM', 800.00, 60.0, 1),
(173, 'RF-003-LARGE', 1200.00, 80.0, NULL),
(174, 'RF-004-COMPACT', 400.00, 25.0, 1),
(175, 'RF-005-FRENCH', 1500.00, 100.0, NULL);

-- Washing Machines Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(176, 'WM-001-FRONT', 600.00, 50.0, NULL),
(177, 'WM-002-TOP', 550.00, 45.0, 1),
(178, 'WM-003-AUTOMATIC', 750.00, 55.0, NULL),
(179, 'WM-004-SEMI', 400.00, 40.0, 1),
(180, 'WM-005-PREMIUM', 900.00, 60.0, NULL);

-- Air Conditioners Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(181, 'AC-001-1T', 300.00, 30.0, NULL),
(182, 'AC-002-1.5T', 400.00, 40.0, 1),
(183, 'AC-003-2T', 500.00, 50.0, NULL),
(184, 'AC-004-PORTABLE', 350.00, 35.0, 1),
(185, 'AC-005-TOWER', 450.00, 45.0, NULL);

-- Microwave Ovens Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(186, 'MO-001-CONVECTION', 150.00, 20.0, NULL),
(187, 'MO-002-SOLO', 100.00, 15.0, 2),
(188, 'MO-003-INVERTER', 200.00, 25.0, NULL),
(189, 'MO-004-GRILL', 180.00, 22.0, 1),
(190, 'MO-005-OTG', 170.00, 18.0, NULL);

-- Dishwashers Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(256, 'DW-001-ECO', 400.00, 40.0, NULL),
(257, 'DW-002-FULL', 500.00, 50.0, 1),
(258, 'DW-003-COMPACT', 350.00, 35.0, NULL),
(259, 'DW-004-STYLISH', 450.00, 45.0, 1),
(260, 'DW-005-AFFORDABLE', 300.00, 30.0, NULL);

-- Water Heaters Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(261, 'WH-001-15L', 100.00, 10.0, NULL),
(262, 'WH-002-25L', 120.00, 15.0, 2),
(263, 'WH-003-10L', 90.00, 8.0, NULL),
(264, 'WH-004-SMART', 150.00, 12.0, 2),
(265, 'WH-005-DIGITAL', 140.00, 11.0, NULL);

-- Vacuum Cleaners Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(266, 'VC-001-BAGLESS', 120.00, 5.0, NULL),
(267, 'VC-002-BAGGED', 100.00, 4.0, 1),
(268, 'VC-003-HANDHELD', 150.00, 3.0, NULL),
(269, 'VC-004-ROBOTIC', 200.00, 6.0, 1),
(270, 'VC-005-CORDLESS', 180.00, 5.0, NULL);

-- Furniture Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(271, 'FUR-001-CHAIR', 150.00, 10.0, NULL),
(272, 'FUR-002-TABLE', 300.00, 25.0, 1),
(273, 'FUR-003-SOFA', 700.00, 50.0, NULL),
(274, 'FUR-004-BED', 800.00, 60.0, 1),
(275, 'FUR-005-DESK', 200.00, 20.0, NULL);

-- Kitchen Appliances Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(276, 'KA-001-TOASTER', 50.00, 2.0, NULL),
(277, 'KA-002-BLENDER', 80.00, 3.0, 1),
(278, 'KA-003-COFFEE', 60.00, 1.5, NULL),
(279, 'KA-004-SLOWCOOKER', 90.00, 4.0, 1),
(280, 'KA-005-MIXER', 120.00, 3.5, NULL);

-- Gaming Consoles Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(281, 'GC-001-PLAYSTATION', 499.00, 3.0, NULL),
(282, 'GC-002-XBOX', 499.00, 3.5, 1),
(283, 'GC-003-SWITCH', 299.00, 2.5, NULL),
(284, 'GC-004-STEAMDECK', 399.00, 3.0, 1),
(285, 'GC-005-RETRO', 199.00, 2.0, NULL);

-- Books Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(286, 'BK-001-FICTION', 15.00, 0.5, NULL),
(287, 'BK-002-NONFICTION', 20.00, 0.7, 1),
(288, 'BK-003-COOKBOOK', 25.00, 0.8, NULL),
(289, 'BK-004-MYSTERY', 18.00, 0.6, 1),
(290, 'BK-005-SCIENCE', 22.00, 0.5, NULL);

-- Toys Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(291, 'TY-001-BEAR', 30.00, 1.0, NULL),
(292, 'TY-002-DOLL', 25.00, 0.5, 1),
(293, 'TY-003-LEGO', 35.00, 1.5, NULL),
(294, 'TY-004-CAR', 20.00, 0.4, 1),
(295, 'TY-005-PUZZLE', 15.00, 0.3, NULL);

-- Outdoor Gear Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(296, 'OG-001-TENT', 200.00, 5.0, NULL),
(297, 'OG-002-SLEEPINGBAG', 80.00, 2.0, 1),
(298, 'OG-003-BACKPACK', 100.00, 1.5, NULL),
(299, 'OG-004-CAMPINGCHAIR', 60.00, 2.0, 1),
(300, 'OG-005-HIKINGBOOT', 120.00, 1.0, NULL);

-- Home Decor Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(301, 'HD-001-WALLART', 75.00, 1.5, NULL),
(302, 'HD-002-CANDLE', 15.00, 0.3, 1),
(303, 'HD-003-VASE', 25.00, 0.5, NULL),
(304, 'HD-004-RUG', 150.00, 5.0, 2),
(305, 'HD-005-THROW', 40.00, 1.0, NULL);

-- Electronics Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(306, 'EL-001-LAPTOP', 999.00, 2.5, NULL),
(307, 'EL-002-SMARTPHONE', 699.00, 0.4, 1),
(308, 'EL-003-TABLET', 499.00, 1.0, NULL),
(309, 'EL-004-HEADPHONES', 150.00, 0.2, 2),
(310, 'EL-005-SMARTWATCH', 250.00, 0.3, NULL);

-- Clothing Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(311, 'CL-001-T-SHIRT', 20.00, 0.2, NULL),
(312, 'CL-002-JEANS', 40.00, 0.5, 3),
(313, 'CL-003-JACKET', 80.00, 1.0, NULL),
(314, 'CL-004-DRESS', 60.00, 0.6, 3),
(315, 'CL-005-HAT', 15.00, 0.1, NULL);

-- Footwear Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(316, 'FW-001-SNEAKERS', 70.00, 1.0, NULL),
(317, 'FW-002-BOOT', 120.00, 1.5, 2),
(318, 'FW-003-SANDAL', 40.00, 0.5, NULL),
(319, 'FW-004-LOAFER', 60.00, 0.8, 2),
(320, 'FW-005-BALLET', 35.00, 0.4, NULL);

-- Sports Equipment Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(321, 'SE-001-BASKETBALL', 30.00, 1.0, NULL),
(322, 'SE-002-SOCCERBALL', 25.00, 0.9, 1),
(323, 'SE-003-TENNISRAQUET', 50.00, 0.5, NULL),
(324, 'SE-004-YOGAMAT', 40.00, 2.0, 1),
(325, 'SE-005-DUMBBELL', 80.00, 5.0, NULL);

-- Health and Beauty Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(326, 'HB-001-FACECREAM', 25.00, 0.3, NULL),
(327, 'HB-002-SHAMPOO', 15.00, 0.4, 1),
(328, 'HB-003-SOAP', 10.00, 0.2, NULL),
(329, 'HB-004-LIPBALM', 5.00, 0.1, 2),
(330, 'HB-005-DEODORANT', 20.00, 0.3, NULL);

-- Pet Supplies Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(331, 'PS-001-PETFOOD', 50.00, 2.0, NULL),
(332, 'PS-002-COLLAR', 10.00, 0.3, 2),
(333, 'PS-003-TOY', 15.00, 0.4, NULL),
(334, 'PS-004-BED', 80.00, 3.0, 1),
(335, 'PS-005-WATERBOWL', 20.00, 1.0, NULL);

-- Baby Products Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(336, 'BP-001-DIAPERS', 30.00, 1.5, NULL),
(337, 'BP-002-BABYLOTION', 15.00, 0.5, 1),
(338, 'BP-003-CARRIAGE', 200.00, 15.0, NULL),
(339, 'BP-004-BOTTLE', 10.00, 0.3, 1),
(340, 'BP-005-TOYS', 25.00, 0.4, NULL);

-- Musical Instruments Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(341, 'MI-001-GUITAR', 150.00, 2.5, NULL),
(342, 'MI-002-PIANO', 300.00, 20.0, 1),
(343, 'MI-003-DRUM', 250.00, 10.0, NULL),
(344, 'MI-004-VIOLIN', 200.00, 1.5, 1),
(345, 'MI-005-FLUTE', 75.00, 0.5, NULL);

-- Office Supplies Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(346, 'OS-001-PEN', 3.00, 0.1, NULL),
(347, 'OS-002-PAPER', 5.00, 0.5, 1),
(348, 'OS-003-ENVELOPE', 10.00, 0.2, NULL),
(349, 'OS-004-BINDER', 8.00, 0.7, 1),
(350, 'OS-005-STAPLER', 15.00, 1.0, NULL);

-- Craft Supplies Variants
INSERT INTO variant (product_id, sku, price, weight, discount_id) VALUES 
(351, 'CS-001-YARN', 20.00, 0.5, NULL),
(352, 'CS-002-PAPER', 10.00, 0.3, 1),
(353, 'CS-003-GLUE', 5.00, 0.1, NULL),
(354, 'CS-004-SCISSORS', 7.00, 0.2, 1),
(355, 'CS-005-BRUSH', 8.00, 0.3, NULL);

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
