-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Product_Category table
INSERT INTO product_category (product_id, category_id) VALUES
(1, 3),
(2, 4),
(3, 6);

INSERT INTO product_category (product_id, category_id) VALUES
-- Mobile Phones (category_id: 3)

(4, 3),  -- OnePlus 12
(5, 3),  -- Xiaomi 14 Pro
(6, 3),  -- Nothing Phone 2
(7, 3),  -- Sony Xperia 1 V
(8, 3),  -- ASUS ROG Phone 8
(9, 3),  -- Motorola Edge 40 Pro
(10, 3), -- Vivo X100 Pro

-- Laptops (category_id: 7)
(11, 7),  -- MacBook Pro 16
(12, 7),  -- Dell XPS 15
(13, 7),  -- Lenovo ThinkPad X1 Carbon
(14, 7),  -- ASUS ROG Zephyrus G14
(15, 7),  -- HP Spectre x360
(16, 7),  -- Razer Blade 18
(17, 7),  -- Acer Swift Edge
(18, 7),  -- Microsoft Surface Laptop 6
(19, 7),  -- MSI Creator Z17
(20, 7),  -- Framework Laptop

-- Speakers (category_id: 4)
(51, 4),  -- Bose SoundLink Revolve+
(52, 4),  -- JBL PartyBox 310
(53, 4),  -- Sony SRS-XB43
(54, 4),  -- Sonos Move
(55, 4),  -- Marshall Stanmore II
(56, 4),  -- Ultimate Ears Boom 3
(57, 4),  -- Anker Soundcore Flare 2
(58, 4),  -- Klipsch The One II
(59, 4),  -- Harman Kardon Onyx Studio 6
(60, 4),  -- Bang & Olufsen Beolit 20

-- Tablets (category_id: 8)
(61, 8),  -- iPad Pro 12.9
(62, 8),  -- Samsung Galaxy Tab S9
(63, 8),  -- Microsoft Surface Pro 9
(64, 8),  -- Amazon Fire HD 10
(65, 8),  -- Lenovo Tab P12 Pro
(66, 8),  -- Xiaomi Pad 6
(67, 8),  -- ASUS ROG Flow Z13
(68, 8),  -- Huawei MatePad Pro
(69, 8),  -- Realme Pad X
(70, 8),  -- Nokia T20

-- Smart Watches (category_id: 9)
(71, 9),  -- Apple Watch Series 9
(72, 9),  -- Samsung Galaxy Watch6
(73, 9),  -- Garmin Forerunner 965
(74, 9),  -- Fitbit Versa 4
(75, 9),  -- Amazfit GTR 4
(76, 9),  -- Huawei Watch GT 3 Pro
(77, 9),  -- Withings ScanWatch
(78, 9),  -- TicWatch Pro 3
(79, 9),  -- Fossil Gen 6
(80, 9),  -- Polar Grit X Pro

-- Headphones (category_id: 10)
(81, 10),  -- Sony WH-1000XM5
(82, 10),  -- Apple AirPods Max
(83, 10),  -- Bose QuietComfort 45
(84, 10),  -- Sennheiser HD 560S
(85, 10),  -- Jabra Elite 85t
(86, 10),  -- Beats Studio Buds
(87, 10),  -- AKG N700NC M2
(88, 10),  -- Anker Soundcore Liberty 3 Pro
(89, 10),  -- Shure AONIC 50
(90, 10),  -- Bowers & Wilkins PX7

-- Gaming Consoles (category_id: 11)
(91, 11),  -- PlayStation 5
(92, 11),  -- Xbox Series X
(93, 11),  -- Nintendo Switch OLED
(94, 11),  -- Steam Deck
(95, 11),  -- Xbox Series S
(96, 11),  -- Nintendo Switch Lite
(97, 11),  -- Sony PlayStation VR2
(98, 11),  -- Logitech G Cloud Gaming Handheld
(99, 11),  -- Analogue Pocket
(100, 11), -- Atari VCS

-- Digital Cameras (category_id: 12)
(101, 12),  -- Canon EOS R5
(102, 12),  -- Nikon Z7 II
(103, 12),  -- Sony Alpha 7 IV
(104, 12),  -- Fujifilm X-T5
(105, 12),  -- Panasonic Lumix GH6
(106, 12),  -- Leica Q2
(107, 12),  -- Olympus OM-D E-M1 Mark III
(108, 12),  -- GoPro Hero 12
(109, 12),  -- DJI Pocket 2
(110, 12),  -- Ricoh GR IIIx

-- Men's Clothing (category_id: 13)
(111, 13),  -- Classic White Shirt
(112, 13),  -- Slim Fit Jeans
(113, 13),  -- Bomber Jacket
(114, 13),  -- Cargo Shorts
(115, 13),  -- V-Neck Sweater

-- Women's Clothing (category_id: 14)
(116, 14),  -- Floral Summer Dress
(117, 14),  -- High-Waist Jeans
(118, 14),  -- Blazer Coat
(119, 14),  -- Crop Top
(120, 14),  -- Midi Skirt

-- Kids' Clothing (category_id: 15)
(121, 15),  -- Graphic T-Shirt
(122, 15),  -- Kids Denim Shorts
(123, 15),  -- Winter Jacket
(124, 15),  -- School Uniform Set
(125, 15);  -- Pajama Set

INSERT INTO product_category (product_id, category_id) VALUES
-- Footwear (category_id: 17)
(126, 16),  -- Running Shoes
(127, 16),  -- Leather Boots
(128, 16),  -- Formal Shoes
(129, 16),  -- Flip-Flops
(130, 16),  -- Sandals

-- Accessories (category_id: 17)
(131, 17),  -- Leather Belt
(132, 17),  -- Sunglasses
(133, 17),  -- Baseball Cap
(134, 17),  -- Scarf
(135, 17),  -- Watch

-- Jewelry (category_id: 18)
(136, 18),  -- Gold Necklace
(137, 18),  -- Silver Bracelet
(138, 18),  -- Diamond Ring
(139, 18),  -- Pearl Earrings
(140, 18),  -- Anklet

-- Bags & Wallets (category_id: 19)
(141, 19),  -- Leather Wallet
(142, 19),  -- Backpack
(143, 19),  -- Crossbody Bag
(144, 19),  -- Tote Bag
(145, 19),  -- Clutch

-- Sportswear (category_id: 20)
(146, 20),  -- Track Pants
(147, 20),  -- Sports Bra
(148, 20),  -- Running Shorts
(149, 20),  -- Gym T-Shirt
(150, 20),  -- Yoga Pants

-- Ethnic Wear (category_id: 21)
(151, 21),  -- Saree
(152, 21),  -- Kurta Pajama
(153, 21),  -- Salwar Kameez
(154, 21),  -- Sherwani
(155, 21),  -- Dupatta

-- Lingerie & Sleepwear (category_id: 22)
(156, 22),  -- Silk Nightgown
(157, 22),  -- Lace Bra
(158, 22),  -- Pajama Set
(159, 22),  -- Sleep Mask
(160, 22),  -- Boxers

-- Winter Wear (category_id: 23)
(161, 23),  -- Puffer Jacket
(162, 23),  -- Woolen Sweater
(163, 23),  -- Thermal Leggings
(164, 23),  -- Winter Scarf
(165, 23),  -- Beanie

-- Designer Brands (category_id: 24)
(166, 24),  -- Gucci Handbag
(167, 24),  -- Prada Sunglasses
(168, 24),  -- Armani Suit
(169, 24),  -- Louis Vuitton Belt
(170, 24),  -- Burberry Trench Coat

-- Refrigerators (category_id: 25)
(171, 25),  -- LG Smart Refrigerator
(172, 25),  -- Whirlpool Double Door
(173, 25),  -- Samsung Side-by-Side
(174, 25),  -- Haier Mini Fridge
(175, 25),  -- Bosch French Door

-- Washing Machines (category_id: 26)
(176, 26),  -- Samsung Front Load
(177, 26),  -- LG Top Load
(178, 26),  -- Bosch Fully Automatic
(179, 26),  -- Whirlpool Semi Automatic
(180, 26),  -- IFB Front Load

-- Air Conditioners (category_id: 27)
(181, 27),  -- Daikin Split AC
(182, 27),  -- LG Dual Inverter AC
(183, 27),  -- Voltas Window AC
(184, 27),  -- Blue Star Portable AC
(185, 27),  -- Carrier Tower AC

-- Microwave Ovens (category_id: 28)
(186, 28),  -- Samsung Convection Microwave
(187, 28),  -- LG Solo Microwave
(188, 28),  -- Panasonic Inverter Microwave
(189, 28),  -- IFB Grill Microwave
(190, 28),  -- Bajaj OTG Oven

-- Dishwashers (category_id: 29)
(256, 29),  -- Bosch Serie 2
(257, 29),  -- Siemens IQ300
(258, 29),  -- Voltas Beko DF15A
(259, 29),  -- Kaff DW VETRA 60
(260, 29),  -- Elica WQP12-7605V

-- Water Heaters (category_id: 30)
(261, 30),  -- Crompton Arno Neo
(262, 30),  -- Venus Magma Plus
(263, 30),  -- Bajaj New Shakti
(264, 30),  -- Racold Eterno Pro
(265, 30),  -- Usha Misty Digital

-- Vacuum Cleaners (category_id: 31)
(266, 31),  -- Philips PowerPro FC9352/01
(267, 31),  -- Dyson V8 Absolute
(268, 31),  -- Karcher WD 3
(269, 31),  -- Eureka Forbes Trendy Zip
(270, 31),  -- Inalsa Spruce

-- Kitchen Appliances (category_id: 32)
(271, 32),  -- Preethi Zodiac Mixer Grinder
(272, 32),  -- Morphy Richards Icon DLX
(273, 32),  -- Philips Viva Collection Juicer
(274, 32),  -- Bajaj Majesty Rice Cooker
(275, 32);  -- Usha FP 3811 Food Processor


-- Air Purifiers (category_id: 33)
INSERT INTO product_category (product_id, category_id) VALUES 
(276, 33),  -- Mi Air Purifier 3C
(277, 33),  -- Sharp FP-J30M
(278, 33),  -- Blueair Blue Pure 211+
(279, 33),  -- Philips AC1215/20
(280, 33);  -- Coway Sleek Pro AP-1009

-- Food Processors (category_id: 34)
INSERT INTO product_category (product_id, category_id) VALUES 
(281, 34),  -- Kenwood Multipro Compact
(282, 34),  -- Bajaj FX1000
(283, 34),  -- Inalsa Inox 1000
(284, 34),  -- Prestige PAF 3.0
(285, 34);  -- Wonderchef Nutri-Blend

-- Electric Fans (category_id: 35)
INSERT INTO product_category (product_id, category_id) VALUES 
(286, 35),  -- Orient Electric Tornado
(287, 35),  -- Usha Maxx Air
(288, 35),  -- Bajaj Esteem Table Fan
(289, 35),  -- Havells V3 Turbo
(290, 35);  -- Crompton High Flo Wave Plus

-- Chimneys & Cooktops (category_id: 36)
INSERT INTO product_category (product_id, category_id) VALUES 
(291, 36),  -- Sunflame 60cm Chimney
(292, 36),  -- Glen 6062 Auto Clean
(293, 36),  -- Kutchina Xpedio
(294, 36),  -- Faber Glass Top Cooktop
(295, 36);  -- Prestige Magic Glass Top

-- Fiction Books (category_id: 37)
INSERT INTO product_category (product_id, category_id) VALUES 
(296, 37),  -- The Great Gatsby
(297, 37),  -- To Kill a Mockingbird
(298, 37),  -- The Catcher in the Rye
(299, 37),  -- Brave New World
(300, 37);  -- The Hobbit

-- Non-Fiction Books (category_id: 38)
INSERT INTO product_category (product_id, category_id) VALUES 
(301, 38),  -- The Immortal Life of Henrietta Lacks
(302, 38),  -- The Wright Brothers
(303, 38),  -- Thinking, Fast and Slow
(304, 38),  -- The Man Who Knew Infinity
(305, 38);  -- Unbroken

-- Academic & Educational Books (category_id: 39)
INSERT INTO product_category (product_id, category_id) VALUES 
(201, 39),  -- Calculus Made Easy
(202, 39),  -- Physics Fundamentals
(203, 39),  -- Introduction to Psychology
(204, 39),  -- Organic Chemistry Basics
(205, 39);  -- Advanced Algebra

-- Children's Books (category_id: 40)
INSERT INTO product_category (product_id, category_id) VALUES 
(206, 40),  -- The Adventures of Timmy
(207, 40),  -- Fairy Tales of the World
(208, 40),  -- Learning ABCs
(209, 40),  -- The Magic Castle
(210, 40);  -- Dinosaur Facts

-- Comics & Manga (category_id: 41)
INSERT INTO product_category (product_id, category_id) VALUES 
(211, 41),  -- Superhero Chronicles
(212, 41),  -- Samurai Legends
(213, 41),  -- Alien Invasion
(214, 41),  -- The Ninja Clan
(215, 41);  -- The Masked Vigilante

-- Self-Help Books (category_id: 42)
INSERT INTO product_category (product_id, category_id) VALUES 
(216, 42),  -- The Power of Positive Thinking
(217, 42),  -- Time Management Mastery
(218, 42),  -- Overcoming Anxiety
(219, 42),  -- Goal Setting for Success
(220, 42);  -- Financial Freedom

-- Business & Economics Books (category_id: 43)
INSERT INTO product_category (product_id, category_id) VALUES 
(221, 43),  -- Principles of Economics
(222, 43),  -- Marketing Essentials
(223, 43),  -- Investment Basics
(224, 43),  -- Corporate Finance
(225, 43);  -- Startup Success

-- Technology & Science Books (category_id: 44)
INSERT INTO product_category (product_id, category_id) VALUES 
(226, 44),  -- Artificial Intelligence 101
(227, 44),  -- The Quantum World
(228, 44),  -- Data Science for Beginners
(229, 44),  -- The Solar System
(230, 44);  -- Blockchain Revolution

-- Biography & Memoirs (category_id: 45)
INSERT INTO product_category (product_id, category_id) VALUES 
(231, 45),  -- Memoirs of a Scientist
(232, 45),  -- A Leader's Path
(233, 45),  -- Entrepreneurial Dreams
(234, 45),  -- The Musician's Journey
(235, 45);  -- My Life in the Wild

-- History Books (category_id: 46)
INSERT INTO product_category (product_id, category_id) VALUES 
(236, 46),  -- World War II Chronicles
(237, 46),  -- Ancient Civilizations
(238, 46),  -- The Roman Empire
(239, 46),  -- The History of Medicine
(240, 46);  -- The American Revolution

-- Travel Books (category_id: 47)
INSERT INTO product_category (product_id, category_id) VALUES 
(241, 47),  -- The Art of Travel
(242, 47),  -- Lonely Planet: Europe
(243, 47),  -- National Geographic: World Destinations
(244, 47),  -- Travel Smart: Tips and Tricks
(245, 47);  -- Backpacking Around the World

-- Cookbooks (category_id: 48)
INSERT INTO product_category (product_id, category_id) VALUES 
(246, 48),  -- Mastering the Art of French Cooking
(247, 48),  -- The Joy of Cooking
(248, 48),  -- Vegan Cooking for Everyone
(249, 48),  -- Quick and Easy Recipes
(250, 48);  -- Baking Basics for Beginners

INSERT INTO product_category (product_id, category_id) 
VALUES
    -- Educational Toys (Category ID: 51)
    (351, 51),
    (352, 51),
    (353, 51),
    (354, 51),
    (355, 51),

    -- Action Figures & Collectibles (Category ID: 52)
    (306, 52),
    (307, 52),
    (308, 52),
    (309, 52),
    (310, 52),

    -- Dolls & Accessories (Category ID: 53)
    (311, 53),
    (312, 53),
    (313, 53),
    (314, 53),
    (315, 53),

    -- Building & Construction Toys (Category ID: 54)
    (316, 54),
    (317, 54),
    (318, 54),
    (319, 54),
    (320, 54),

    -- Electronic & Robotic Toys (Category ID: 55)
    (321, 55),
    (322, 55),
    (323, 55),
    (324, 55),
    (325, 55),

    -- Vehicles & Playsets (Category ID: 56)
    (326, 56),
    (327, 56),
    (328, 56),
    (329, 56),
    (330, 56),

    -- Role-Playing Toys (Category ID: 57)
    (331, 57),
    (332, 57),
    (333, 57),
    (334, 57),
    (335, 57),

    -- Outdoor & Sports Toys (Category ID: 58)
    (336, 58),
    (337, 58),
    (338, 58),
    (339, 58),
    (340, 58),

    -- Musical & Sensory Toys (Category ID: 59)
    (341, 59),
    (342, 59),
    (343, 59),
    (344, 59),
    (345, 59),

    -- Board Games & Puzzles (Category ID: 60)
    (346, 60),
    (347, 60),
    (348, 60),
    (349, 60),
    (350, 60);

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
