
-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Product_Attribute table
INSERT INTO product_attribute (product_id, attribute_id, attribute_value) VALUES
(1, 3, 'Apple'),             -- Brand
(1, 4, 'iOS'),               -- Operating System
(1, 5, 'Up to 14 hours');    -- Battery Life

-- Bose SoundLink Speaker (Product ID: 2)
INSERT INTO product_attribute (product_id, attribute_id, attribute_value) VALUES
(2, 3, 'Bose'),              -- Brand
(2, 5, '8 hours'),           -- Battery Life
(2, 6, '5 x 5 x 5 inches');  -- Dimensions

-- LEGO Star Wars Set (Product ID: 3)
INSERT INTO product_attribute (product_id, attribute_id, attribute_value) VALUES
(3, 3, 'LEGO'),              -- Brand
(3, 7, '8+'),                -- Age Group
(3, 8, 'Plastic'),           -- Material
(3, 6, '15 x 10 x 5 inches');-- Dimensions

--mobile phones
INSERT INTO product_attribute (product_id, attribute_id, attribute_value) VALUES
    -- iPhone 15 Pro Max (Product ID: 4)
    (4, 3, 'Apple'),              -- Brand
    (4, 4, 'iOS'),                -- Operating System
    (4, 5, 'Up to 29 hours'),     -- Battery Life
    (4, 9, '6.7 inches'),         -- Screen Size

    -- Samsung Galaxy S24 Ultra (Product ID: 5)
    (5, 3, 'Samsung'),            -- Brand
    (5, 4, 'Android'),            -- Operating System
    (5, 5, 'Up to 36 hours'),     -- Battery Life
    (5, 9, '6.8 inches'),         -- Screen Size

    -- Google Pixel 8 Pro (Product ID: 3)
    -- (3, 3, 'Google'),             -- Brand
--     (3, 4, 'Android'),            -- Operating System
--     (3, 5, 'Up to 24 hours'),     -- Battery Life
--     (3, 9, '6.7 inches'),         -- Screen Size

--     -- OnePlus 12 (Product ID: 6)
--     (6, 3, 'OnePlus'),            -- Brand
--     (6, 4, 'Android'),            -- Operating System
--     (6, 5, 'Up to 28 hours'),     -- Battery Life
--     (6, 9, '6.74 inches'),        -- Screen Size

    -- Xiaomi 14 Pro (Product ID: 7)
--     (7, 3, 'Xiaomi'),             -- Brand
--     (7, 4, 'Android'),            -- Operating System
--     (7, 5, 'Up to 32 hours'),     -- Battery Life
--     (7, 9, '6.73 inches'),        -- Screen Size

    -- Nothing Phone 2 (Product ID: 8)
    (6, 3, 'Nothing'),            -- Brand
    (6, 4, 'Android'),            -- Operating System
    (6, 5, 'Up to 33 hours'),     -- Battery Life
    (6, 9, '6.55 inches'),        -- Screen Size

    -- Sony Xperia 1 V (Product ID: 9)
    (7, 3, 'Sony'),               -- Brand
    (7, 4, 'Android'),            -- Operating System
    (7, 5, 'Up to 27 hours'),     -- Battery Life
    (7, 9, '6.5 inches'),         -- Screen Size

    -- ASUS ROG Phone 8 (Product ID: 10)
    (8, 3, 'ASUS'),              -- Brand
    (8, 4, 'Android'),           -- Operating System
    (8, 5, 'Up to 30 hours'),    -- Battery Life
    (8, 9, '6.78 inches'),       -- Screen Size

    -- Motorola Edge 40 Pro (Product ID: 11)
    (9, 3, 'Motorola'),          -- Brand
    (9, 4, 'Android'),           -- Operating System
    (9, 5, 'Up to 28 hours'),    -- Battery Life
    (9, 9, '6.67 inches'),       -- Screen Size

    -- Vivo X100 Pro (Product ID: 12)
    (10, 3, 'Vivo'),              -- Brand
    (10, 4, 'Android'),           -- Operating System
    (10, 5, 'Up to 34 hours'),    -- Battery Life
    (10, 9, '6.8 inches');

    --laptops
    INSERT INTO product_attribute (product_id, attribute_id, attribute_value) VALUES
    -- MacBook Pro 16 (Product ID: 11)
    (11, 3, 'Apple'),                  -- Brand
    (11, 4, 'macOS'),                  -- Operating System
    (11, 11, 'M3 Max'),                 -- Processor
    (11, 9, '16 inches'),              -- Screen Size
    (11, 5, 'Up to 22 hours'),         -- Battery Life

    -- Dell XPS 15 (Product ID: 12)
    (12, 3, 'Dell'),                   -- Brand
    (12, 4, 'Windows'),                -- Operating System
    (12, 11, 'Intel Core i9'),          -- Processor
    (12, 9, '15.6 inches (OLED)'),     -- Screen Size
    (12, 5, 'Up to 13 hours'),         -- Battery Life

    -- Lenovo ThinkPad X1 Carbon (Product ID: 13)
    (13, 3, 'Lenovo'),                 -- Brand
    (13, 4, 'Windows'),                -- Operating System
    (13, 11, 'Intel Core i7'),          -- Processor
    (13, 9, '14 inches'),              -- Screen Size
    (13, 5, 'Up to 15 hours'),         -- Battery Life

    -- ASUS ROG Zephyrus G14 (Product ID: 14)
    (14, 3, 'ASUS'),                   -- Brand
    (14, 4, 'Windows'),                -- Operating System
    (14, 11, 'AMD Ryzen 9'),            -- Processor
    (14, 9, '14 inches'),              -- Screen Size
    (14, 5, 'Up to 10 hours'),         -- Battery Life

    -- HP Spectre x360 (Product ID: 15)
    (15, 3, 'HP'),                     -- Brand
    (15, 4, 'Windows'),                -- Operating System
    (15, 11, 'Intel Core i7'),          -- Processor
    (15, 9, '13.5 inches'),            -- Screen Size
    (15, 5, 'Up to 14 hours'),         -- Battery Life

    -- Razer Blade 18 (Product ID: 16)
    (16, 3, 'Razer'),                  -- Brand
    (16, 4, 'Windows'),                -- Operating System
    (16, 11, 'Intel Core i9 + RTX 4090'), -- Processor and GPU
    (16, 9, '18 inches'),              -- Screen Size
    (16, 5, 'Up to 6 hours'),          -- Battery Life

    -- Acer Swift Edge (Product ID: 17)
    (17, 3, 'Acer'),                   -- Brand
    (17, 4, 'Windows'),                -- Operating System
    (17, 11, 'AMD Ryzen 7'),            -- Processor
    (17, 9, '14 inches (OLED)'),       -- Screen Size
    (17, 5, 'Up to 11 hours'),         -- Battery Life

    -- Microsoft Surface Laptop 6 (Product ID: 18)
    (18, 3, 'Microsoft'),              -- Brand
    (18, 4, 'Windows'),                -- Operating System
    (18, 11, 'Intel Core i7'),          -- Processor
    (18, 9, '15 inches'),              -- Screen Size
    (18, 5, 'Up to 15 hours'),         -- Battery Life

    -- MSI Creator Z17 (Product ID: 19)
    (19, 3, 'MSI'),                    -- Brand
    (19, 4, 'Windows'),                -- Operating System
    (19, 11, 'Intel Core i9'),          -- Processor
    (19, 9, '17 inches'),              -- Screen Size
    (19, 5, 'Up to 8 hours'),          -- Battery Life

    -- Framework Laptop (Product ID: 20)
    (20, 3, 'Framework'),              -- Brand
    (20, 4, 'Windows'),                -- Operating System
    (20, 11, 'Intel Core i7'),          -- Processor
    (20, 9, '13.5 inches'),            -- Screen Size
    (20, 5, 'Modular battery');        -- Battery Life (Modular)

--speakers
INSERT INTO product_attribute (product_id, attribute_id, attribute_value) VALUES
(51, 3, 'Bose'),                       -- Brand
(51, 10, 'Yes'),                       -- Waterproof
(51, 5, 'Up to 17 hours'),             -- Battery Life
(51, 1, 'Black'),                      -- Color
(52, 3, 'JBL'),                        -- Brand
(52, 10, 'No'),                        -- Waterproof
(52, 5, 'Up to 18 hours'),             -- Battery Life
(52, 1, 'Black'),                      -- Color
(53, 3, 'Sony'),                       -- Brand
(53, 10, 'Yes'),                       -- Waterproof
(53, 5, 'Up to 24 hours'),             -- Battery Life
(53, 1, 'Blue'),                       -- Color
(54, 3, 'Sonos'),                      -- Brand
(54, 10, 'No'),                        -- Waterproof
(54, 5, 'Up to 10 hours'),             -- Battery Life
(54, 1, 'Black'),                      -- Color
(55, 3, 'Marshall'),                   -- Brand
(55, 10, 'No'),                        -- Waterproof
(55, 5, 'Up to 30 hours'),             -- Battery Life
(55, 1, 'Cream'),                      -- Color
(56, 3, 'Ultimate Ears'),             -- Brand
(56, 10, 'Yes'),                       -- Waterproof
(56, 5, 'Up to 15 hours'),             -- Battery Life
(56, 1, 'Black'),                      -- Color
(57, 3, 'Anker'),                      -- Brand
(57, 10, 'No'),                        -- Waterproof
(57, 5, 'Up to 12 hours'),             -- Battery Life
(57, 1, 'Black'),                      -- Color
(58, 3, 'Klipsch'),                    -- Brand
(58, 10, 'No'),                        -- Waterproof
(58, 5, 'Up to 15 hours'),             -- Battery Life
(58, 1, 'Walnut'),                     -- Color
(59, 3, 'Harman Kardon'),              -- Brand
(59, 10, 'No'),                        -- Waterproof
(59, 5, 'Up to 8 hours'),              -- Battery Life
(59, 1, 'Black'),                      -- Color
(60, 3, 'Bang & Olufsen'),             -- Brand
(60, 10, 'Yes'),                       -- Waterproof
(60, 5, 'Up to 12 hours'),             -- Battery Life
(60, 1, 'Grey');                       -- Color

--tablets
INSERT INTO product_attribute (product_id, attribute_id, attribute_value) VALUES
(61, 3, 'Apple'),                       -- Brand
(61, 4, 'iPadOS'),                     -- Operating System
(61, 11, 'M2'),                        -- Processor
(61, 9, '12.9 inches'),                -- Screen Size
(61, 2, '128 GB'),                     -- Storage Capacity
(62, 3, 'Samsung'),                     -- Brand
(62, 4, 'Android'),                    -- Operating System
(62, 11, 'Snapdragon 8 Gen 2'),       -- Processor
(62, 9, '11 inches'),                  -- Screen Size
(62, 2, '256 GB'),                     -- Storage Capacity
(63, 3, 'Microsoft'),                  -- Brand
(63, 4, 'Windows 11'),                 -- Operating System
(63, 11, 'Intel Core i7'),            -- Processor
(63, 9, '13 inches'),                  -- Screen Size
(63, 2, '512 GB'),                     -- Storage Capacity
(64, 3, 'Amazon'),                     -- Brand
(64, 4, 'Fire OS'),                    -- Operating System
(64, 11, 'Quad-core'),                 -- Processor
(64, 9, '10.1 inches'),                -- Screen Size
(64, 2, '64 GB'),                      -- Storage Capacity
(65, 3, 'Lenovo'),                     -- Brand
(65, 4, 'Android'),                    -- Operating System
(65, 11, 'Snapdragon 870'),            -- Processor
(65, 9, '12.6 inches'),                -- Screen Size
(65, 2, '256 GB'),                     -- Storage Capacity
(66, 3, 'Xiaomi'),                     -- Brand
(66, 4, 'MIUI'),                       -- Operating System
(66, 11, 'MediaTek Dimensity 1200'),  -- Processor
(66, 9, '11 inches'),                  -- Screen Size
(66, 2, '128 GB'),                     -- Storage Capacity
(67, 3, 'ASUS'),                       -- Brand
(67, 4, 'Windows 11'),                 -- Operating System
(67, 11, 'Intel Core i9'),            -- Processor
(67, 9, '13 inches'),                  -- Screen Size
(67, 2, '512 GB'),                     -- Storage Capacity
(68, 3, 'Huawei'),                     -- Brand
(68, 4, 'HarmonyOS'),                  -- Operating System
(68, 11, 'Kirin 9000'),                -- Processor
(68, 9, '12.6 inches'),                -- Screen Size
(68, 2, '256 GB'),                     -- Storage Capacity
(69, 3, 'Realme'),                     -- Brand
(69, 4, 'Android'),                    -- Operating System
(69, 11, 'MediaTek Helio G90T'),      -- Processor
(69, 9, '10.4 inches'),                -- Screen Size
(69, 2, '64 GB'),                      -- Storage Capacity
(70, 3, 'Nokia'),                      -- Brand
(70, 4, 'Android'),                    -- Operating System
(70, 11, 'Unisoc T606'),               -- Processor
(70, 9, '10.4 inches'),                -- Screen Size
(70, 2, '32 GB');                      -- Storage Capacity

-- smart watch
INSERT INTO product_attribute (product_id, attribute_id, attribute_value) VALUES
(71, 3, 'Apple'),                       -- Brand
(71, 4, 'watchOS'),                    -- Operating System
(71, 11, 'S8'),                        -- Processor
(71, 9, '1.9 inches'),                 -- Screen Size
(71, 2, '32 GB'),                      -- Storage Capacity
(72, 3, 'Samsung'),                    -- Brand
(72, 4, 'Wear OS'),                   -- Operating System
(72, 11, 'Exynos W920'),               -- Processor
(72, 9, '1.5 inches'),                 -- Screen Size
(72, 2, '64 GB'),                      -- Storage Capacity
(73, 3, 'Garmin'),                     -- Brand
(73, 4, 'Garmin OS'),                  -- Operating System
(73, 11, 'Dual Frequency GPS'),        -- Processor
(73, 9, '1.4 inches'),                 -- Screen Size
(73, 2, '32 GB'),                      -- Storage Capacity
(74, 3, 'Fitbit'),                     -- Brand
(74, 4, 'Fitbit OS'),                  -- Operating System
(74, 11, 'N/A'),                       -- Processor
(74, 9, '1.58 inches'),                -- Screen Size
(74, 2, '32 GB'),                      -- Storage Capacity
(75, 3, 'Amazfit'),                    -- Brand
(75, 4, 'Zepp OS'),                    -- Operating System
(75, 11, 'N/A'),                       -- Processor
(75, 9, '1.43 inches'),                -- Screen Size
(75, 2, '128 GB'),                     -- Storage Capacity
(76, 3, 'Huawei'),                     -- Brand
(76, 4, 'HarmonyOS'),                  -- Operating System
(76, 11, 'Kirin A1'),                  -- Processor
(76, 9, '1.43 inches'),                -- Screen Size
(76, 2, '32 GB'),                      -- Storage Capacity
(77, 3, 'Withings'),                   -- Brand
(77, 4, 'N/A'),                        -- Operating System
(77, 11, 'N/A'),                       -- Processor
(77, 9, '1.8 inches'),                 -- Screen Size
(77, 2, '32 GB'),                      -- Storage Capacity
(78, 3, 'TicWatch'),                   -- Brand
(78, 4, 'Wear OS'),                    -- Operating System
(78, 11, 'Snapdragon Wear 4100'),      -- Processor
(78, 9, '1.4 inches'),                 -- Screen Size
(78, 2, '32 GB'),                      -- Storage Capacity
(79, 3, 'Fossil'),                     -- Brand
(79, 4, 'Wear OS'),                    -- Operating System
(79, 11, 'Snapdragon Wear 3100'),      -- Processor
(79, 9, '1.28 inches'),                -- Screen Size
(79, 2, '32 GB'),                      -- Storage Capacity
(80, 3, 'Polar'),                      -- Brand
(80, 4, 'N/A'),                        -- Operating System
(80, 11, 'N/A'),                       -- Processor
(80, 9, '1.2 inches'),                 -- Screen Size
(80, 2, '32 GB');                      -- Storage Capacity

-- headphones
INSERT INTO product_attribute (product_id, attribute_id, attribute_value) VALUES
(81, 3, 'Sony'),                       -- Brand
(81, 10, 'Yes'),                       -- Waterproof
(81, 5, '30 hours'),                   -- Battery Life
(81, 1, 'Black'),                      -- Color
(82, 3, 'Apple'),                      -- Brand
(82, 10, 'No'),                        -- Waterproof
(82, 5, '20 hours'),                   -- Battery Life
(82, 1, 'Silver'),                     -- Color
(83, 3, 'Bose'),                       -- Brand
(83, 10, 'No'),                        -- Waterproof
(83, 5, '24 hours'),                   -- Battery Life
(83, 1, 'Black'),                      -- Color
(84, 3, 'Sennheiser'),                 -- Brand
(84, 10, 'No'),                        -- Waterproof
(84, 5, '30 hours'),                   -- Battery Life
(84, 1, 'Black'),                      -- Color
(85, 3, 'Jabra'),                      -- Brand
(85, 10, 'No'),                        -- Waterproof
(85, 5, '25 hours'),                   -- Battery Life
(85, 1, 'Titanium'),                   -- Color
(86, 3, 'Beats'),                      -- Brand
(86, 10, 'No'),                        -- Waterproof
(86, 5, '8 hours'),                    -- Battery Life
(86, 1, 'Black'),                      -- Color
(87, 3, 'AKG'),                        -- Brand
(87, 10, 'No'),                        -- Waterproof
(87, 5, '20 hours'),                   -- Battery Life
(87, 1, 'Black'),                      -- Color
(88, 3, 'Anker'),                      -- Brand
(88, 10, 'No'),                        -- Waterproof
(88, 5, '8 hours'),                    -- Battery Life
(88, 1, 'Black'),                      -- Color
(89, 3, 'Shure'),                      -- Brand
(89, 10, 'No'),                        -- Waterproof
(89, 5, '20 hours'),                   -- Battery Life
(89, 1, 'Black'),                      -- Color
(90, 3, 'Bowers & Wilkins'),           -- Brand
(90, 10, 'No'),                        -- Waterproof
(90, 5, '30 hours'),                   -- Battery Life
(90, 1, 'Carbon');                     -- Color

-- gaming consoles
INSERT INTO product_attribute (product_id, attribute_id, attribute_value) VALUES
(91, 3, 'Sony'),                       -- Brand
(91, 4, 'PlayStation OS'),             -- Operating System
(91, 9, '4K'),                         -- Screen Size
(91, 2, '825 GB'),                     -- Storage Capacity
(92, 3, 'Microsoft'),                  -- Brand
(92, 4, 'Xbox OS'),                    -- Operating System
(92, 9, '4K'),                         -- Screen Size
(92, 2, '1 TB'),                       -- Storage Capacity
(93, 3, 'Nintendo'),                   -- Brand
(93, 4, 'Custom OS'),                  -- Operating System
(93, 9, '7 inches'),                   -- Screen Size
(93, 2, '64 GB'),                      -- Storage Capacity
(94, 3, 'Valve'),                      -- Brand
(94, 4, 'SteamOS'),                    -- Operating System
(94, 9, '7 inches'),                   -- Screen Size
(94, 2, '64 GB'),                      -- Storage Capacity
(95, 3, 'Microsoft'),                  -- Brand
(95, 4, 'Xbox OS'),                    -- Operating System
(95, 9, '1080p'),                      -- Screen Size
(95, 2, '512 GB'),                     -- Storage Capacity
(96, 3, 'Nintendo'),                   -- Brand
(96, 4, 'Custom OS'),                  -- Operating System
(96, 9, '5.5 inches'),                 -- Screen Size
(96, 2, '32 GB'),                      -- Storage Capacity
(97, 3, 'Sony'),                       -- Brand
(97, 4, 'Custom OS'),                  -- Operating System
(97, 9, 'N/A'),                        -- Screen Size
(97, 2, 'N/A'),                        -- Storage Capacity
(98, 3, 'Logitech'),                   -- Brand
(98, 4, 'N/A'),                        -- Operating System
(98, 9, 'N/A'),                        -- Screen Size
(98, 2, 'N/A'),                        -- Storage Capacity
(99, 3, 'Analogue'),                   -- Brand
(99, 4, 'N/A'),                        -- Operating System
(99, 9, '3.5 inches'),                 -- Screen Size
(99, 2, 'N/A'),                        -- Storage Capacity
(100, 3, 'Atari'),                     -- Brand
(100, 4, 'N/A'),                       -- Operating System
(100, 9, 'N/A'),                       -- Screen Size
(100, 2, 'N/A');                       -- Storage Capacity

-- digital cameras
INSERT INTO product_attribute (product_id, attribute_id, attribute_value) VALUES
(101, 3, 'Canon'),                        -- Brand
(101, 4, 'Canon EOS R5 Firmware'),       -- Operating System
(101, 11, 'Dual Pixel CMOS AF II'),      -- Processor
(101, 9, '3.2 inches'),                  -- Screen Size
(101, 2, '512 GB'),                      -- Storage Capacity
(102, 3, 'Nikon'),                       -- Brand
(102, 4, 'Nikon Z Firmware'),            -- Operating System
(102, 11, 'Expeed 6'),                   -- Processor
(102, 9, '3.2 inches'),                  -- Screen Size
(102, 2, '256 GB'),                      -- Storage Capacity
(103, 3, 'Sony'),                        -- Brand
(103, 4, 'Sony Alpha Firmware'),         -- Operating System
(103, 11, 'BIONZ XR'),                   -- Processor
(103, 9, '3 inches'),                    -- Screen Size
(103, 2, '256 GB'),                      -- Storage Capacity
(104, 3, 'Fujifilm'),                    -- Brand
(104, 4, 'Fujifilm X Firmware'),         -- Operating System
(104, 11, 'X-Processor 4'),              -- Processor
(104, 9, '3 inches'),                    -- Screen Size
(104, 2, '128 GB'),                      -- Storage Capacity
(105, 3, 'Panasonic'),                   -- Brand
(105, 4, 'Panasonic Lumix Firmware'),    -- Operating System
(105, 11, 'Venus Engine'),               -- Processor
(105, 9, '3 inches'),                    -- Screen Size
(105, 2, '128 GB'),                      -- Storage Capacity
(106, 3, 'Leica'),                       -- Brand
(106, 4, 'Leica Q Firmware'),            -- Operating System
(106, 11, 'Maestro II'),                 -- Processor
(106, 9, '3 inches'),                    -- Screen Size
(106, 2, '128 GB'),                      -- Storage Capacity
(107, 3, 'Olympus'),                     -- Brand
(107, 4, 'Olympus Firmware'),            -- Operating System
(107, 11, 'TruePic VIII'),               -- Processor
(107, 9, '3 inches'),                    -- Screen Size
(107, 2, '64 GB'),                       -- Storage Capacity
(108, 3, 'GoPro'),                       -- Brand
(108, 4, 'GoPro Firmware'),              -- Operating System
(108, 11, 'GP2'),                        -- Processor
(108, 9, '2.27 inches'),                 -- Screen Size
(108, 2, '32 GB'),                       -- Storage Capacity
(109, 3, 'DJI'),                        -- Brand
(109, 4, 'DJI Firmware'),                -- Operating System
(109, 11, 'DJI Image Processor'),        -- Processor
(109, 9, '1 inch'),                      -- Screen Size
(109, 2, '64 GB'),                       -- Storage Capacity
(110, 3, 'Ricoh'),                       -- Brand
(110, 4, 'Ricoh Firmware'),              -- Operating System
(110, 11, 'GR Engine 6'),                -- Processor
(110, 9, '3 inches'),                    -- Screen Size
(110, 2, '32 GB');                       -- Storage Capacity




-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
