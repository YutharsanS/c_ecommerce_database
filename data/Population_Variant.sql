-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- First create variants
INSERT INTO variant (variant_id, product_id, sku, price, weight, discount_id) VALUES
(1001, 4, 'IPH15PM-256-BLK', 1299.99, 0.240, NULL), -- iPhone 15 Pro Max 256GB Black
(1002, 4, 'IPH15PM-256-WHT', 1299.99, 0.240, NULL), -- iPhone 15 Pro Max 256GB White
(1003, 4, 'IPH15PM-512-BLK', 1499.99, 0.240, NULL), -- iPhone 15 Pro Max 512GB Black
(1004, 5, 'SSGLS24U-256-BLK', 1199.99, 0.233, NULL), -- Samsung S24 Ultra 256GB Black
(1005, 5, 'SSGLS24U-512-BLK', 1399.99, 0.233, NULL), -- Samsung S24 Ultra 512GB Black
(1006, 5, 'SSGLS24U-1TB-BLK', 1599.99, 0.233, NULL), -- Samsung S24 Ultra 1TB Black
(1007, 6, 'NTP2-256-BLK', 699.99, 0.201, NULL), -- Nothing Phone 2 256GB Black
(1008, 6, 'NTP2-256-WHT', 699.99, 0.201, NULL), -- Nothing Phone 2 256GB White
(1009, 7, 'SNYXP1V-256-BLK', 1299.99, 0.187, NULL), -- Sony Xperia 1 V Black
(1010, 7, 'SNYXP1V-256-SLV', 1299.99, 0.187, NULL), -- Sony Xperia 1 V Silver
(1011, 8, 'ASUSROG8-512-BLK', 1099.99, 0.225, NULL), -- ASUS ROG Phone 8 512GB
(1012, 9, 'MOTOEDG40-256-BLK', 899.99, 0.195, NULL), -- Motorola Edge 40 Pro
(1013, 10, 'VIVOX100P-512-BLK', 999.99, 0.220, NULL), -- Vivo X100 Pro
(1014, 11, 'MBP16-M3-1TB-GRY', 2499.99, 2.15, NULL), -- MacBook Pro 16" M3 1TB Space Gray
(1015, 11, 'MBP16-M3-1TB-SLV', 2499.99, 2.15, NULL), -- MacBook Pro 16" M3 1TB Silver
(1016, 11, 'MBP16-M3-2TB-GRY', 2899.99, 2.15, NULL), -- MacBook Pro 16" M3 2TB Space Gray
(1017, 12, 'DXPS15-1TB-BLK', 1899.99, 1.96, NULL), -- Dell XPS 15 1TB Black
(1018, 12, 'DXPS15-2TB-BLK', 2199.99, 1.96, NULL), -- Dell XPS 15 2TB Black
(1019, 13, 'LNVX1C-512-BLK', 1599.99, 1.12, NULL), -- ThinkPad X1 Carbon 512GB
(1020, 13, 'LNVX1C-1TB-BLK', 1799.99, 1.12, NULL), -- ThinkPad X1 Carbon 1TB
(1021, 14, 'ASUSG14-1TB-BLK', 1699.99, 1.65, NULL), -- ROG Zephyrus G14
(1022, 15, 'HPX360-512-SLV', 1399.99, 1.35, NULL), -- HP Spectre x360
(1023, 16, 'RZB18-2TB-BLK', 3499.99, 3.10, NULL), -- Razer Blade 18
(1024, 71, 'AWS9-41-BLK', 399.99, 0.032, NULL), -- Apple Watch Series 9 41mm Black
(1025, 71, 'AWS9-45-BLK', 429.99, 0.039, NULL), -- Apple Watch Series 9 45mm Black
(1026, 71, 'AWS9-41-SLV', 399.99, 0.032, NULL), -- Apple Watch Series 9 41mm Silver
(1027, 72, 'SSGW6-40-BLK', 299.99, 0.028, NULL), -- Samsung Galaxy Watch6 40mm
(1028, 72, 'SSGW6-44-BLK', 329.99, 0.033, NULL), -- Samsung Galaxy Watch6 44mm
(1029, 73, 'GF965-BLK', 599.99, 0.047, NULL), -- Garmin Forerunner 965
(1030, 74, 'FBV4-BLK', 229.99, 0.025, NULL), -- Fitbit Versa 4
(1031, 75, 'AMZGTR4-BLK', 199.99, 0.034, NULL), -- Amazfit GTR 4
(1032, 81, 'SNY1000XM5-BLK', 399.99, 0.250, NULL), -- Sony WH-1000XM5 Black
(1033, 81, 'SNY1000XM5-SLV', 399.99, 0.250, NULL), -- Sony WH-1000XM5 Silver
(1034, 82, 'APDMAX-SG-BLK', 549.99, 0.384, NULL), -- AirPods Max Space Gray
(1035, 82, 'APDMAX-SLV', 549.99, 0.384, NULL), -- AirPods Max Silver
(1036, 83, 'BSQC45-BLK', 329.99, 0.240, NULL), -- Bose QC45 Black
(1037, 83, 'BSQC45-WHT', 329.99, 0.240, NULL), -- Bose QC45 White
(1038, 84, 'SH560S-BLK', 199.99, 0.255, NULL), -- Sennheiser HD 560S
(1039, 85, 'JE85T-BLK', 229.99, 0.007, NULL), -- Jabra Elite 85t
(1040, 86, 'BTSB-BLK', 149.99, 0.005, NULL), -- Beats Studio Buds
(1041, 91, 'PS5-DISC', 499.99, 4.5, NULL), -- PS5 Disc Edition
(1042, 91, 'PS5-DE', 399.99, 3.9, NULL), -- PS5 Digital Edition
(1043, 92, 'XBXS-X', 499.99, 4.45, NULL), -- Xbox Series X
(1044, 93, 'NSOLED-WHT', 349.99, 0.420, NULL), -- Nintendo Switch OLED White
(1045, 93, 'NSOLED-NEO', 349.99, 0.420, NULL), -- Nintendo Switch OLED Neon
(1046, 94, 'STMDK-512', 649.99, 0.669, NULL), -- Steam Deck 512GB
(1047, 94, 'STMDK-256', 529.99, 0.669, NULL), -- Steam Deck 256GB
(1048, 95, 'XBXS-S', 299.99, 2.7, NULL), -- Xbox Series S
(1049, 96, 'NSWL-GRY', 199.99, 0.275, NULL), -- Nintendo Switch Lite Gray
(1050, 97, 'PSVR2', 549.99, 0.560, NULL)  -- PlayStation VR2
;

-- Now update products with their default variants
UPDATE product
SET default_variant_id = CASE product_id
    -- Mobile Phones
    WHEN 4 THEN 1001  -- iPhone 15 Pro Max
    WHEN 5 THEN 1004  -- Samsung S24 Ultra
    WHEN 6 THEN 1007  -- Nothing Phone 2
    WHEN 7 THEN 1009  -- Sony Xperia 1 V
    WHEN 8 THEN 1011  -- ASUS ROG Phone 8
    WHEN 9 THEN 1012  -- Motorola Edge 40 Pro
    WHEN 10 THEN 1013 -- Vivo X100 Pro

    -- Laptops
    WHEN 11 THEN 1014 -- MacBook Pro 16"
    WHEN 12 THEN 1017 -- Dell XPS 15
    WHEN 13 THEN 1019 -- ThinkPad X1 Carbon
    WHEN 14 THEN 1021 -- ROG Zephyrus G14
    WHEN 15 THEN 1022 -- HP Spectre x360
    WHEN 16 THEN 1023 -- Razer Blade 18

    -- Smart Watches
    WHEN 71 THEN 1024 -- Apple Watch Series 9
    WHEN 72 THEN 1027 -- Samsung Galaxy Watch6
    WHEN 73 THEN 1029 -- Garmin Forerunner 965
    WHEN 74 THEN 1030 -- Fitbit Versa 4
    WHEN 75 THEN 1031 -- Amazfit GTR 4

    -- Headphones
    WHEN 81 THEN 1032 -- Sony WH-1000XM5
    WHEN 82 THEN 1034 -- AirPods Max
    WHEN 83 THEN 1036 -- Bose QC45
    WHEN 84 THEN 1038 -- Sennheiser HD 560S
    WHEN 85 THEN 1039 -- Jabra Elite 85t
    WHEN 86 THEN 1040 -- Beats Studio Buds

    -- Gaming Consoles
    WHEN 91 THEN 1041 -- PS5
    WHEN 92 THEN 1043 -- Xbox Series X
    WHEN 93 THEN 1044 -- Nintendo Switch OLED
    WHEN 94 THEN 1046 -- Steam Deck
    WHEN 95 THEN 1048 -- Xbox Series S
    WHEN 96 THEN 1049 -- Nintendo Switch Lite
    WHEN 97 THEN 1050 -- PlayStation VR2
END
WHERE product_id IN (4,5,6,7,8,9,10, -- Mobile Phones
                    11,12,13,14,15,16, -- Laptops
                    71,72,73,74,75, -- Smart Watches
                    81,82,83,84,85,86, -- Headphones
                    91,92,93,94,95,96,97); -- Gaming Consoles
-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
