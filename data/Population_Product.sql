-- Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Populate Product table
INSERT INTO product (product_id, product_name, description) VALUES
(1, 'iPhone X', 'Apple smartphone with advanced features'),
(2, 'Bose SoundLink Speaker', 'Portable Bluetooth speaker with high-quality sound'),
(3, 'LEGO Star Wars Set', 'Building set for Star Wars enthusiasts');

-- Mobile Phones (category_id: 3)
INSERT INTO product (product_id, product_name, description) VALUES 
(4, 'iPhone 15 Pro Max', 'Latest Apple flagship smartphone with A17 chip'),
(5, 'Samsung Galaxy S24 Ultra', 'Premium Android smartphone with advanced AI features'),
-- (3, 'Google Pixel 8 Pro', 'Google flagship with advanced camera capabilities'),
-- (4, 'OnePlus 12', 'High-performance smartphone with fast charging'),
-- (5, 'Xiaomi 14 Pro', 'Feature-rich smartphone with excellent value'),
(6, 'Nothing Phone 2', 'Unique design with transparent back panel'),
(7, 'Sony Xperia 1 V', 'Professional-grade camera smartphone'),
(8, 'ASUS ROG Phone 8', 'Gaming-focused smartphone with cooling system'),
(9, 'Motorola Edge 40 Pro', 'Premium smartphone with clean Android experience'),
(10, 'Vivo X100 Pro', 'Camera-focused flagship with Zeiss optics');

-- Laptops (category_id: 7)
INSERT INTO product (product_id, product_name, description) VALUES 
(11, 'MacBook Pro 16', 'Professional laptop with M3 Max chip'),
(12, 'Dell XPS 15', 'Premium Windows laptop with OLED display'),
(13, 'Lenovo ThinkPad X1 Carbon', 'Business laptop with excellent keyboard'),
(14, 'ASUS ROG Zephyrus G14', 'Compact gaming laptop with high performance'),
(15, 'HP Spectre x360', 'Convertible laptop with premium design'),
(16, 'Razer Blade 18', 'High-end gaming laptop with RTX 4090'),
(17, 'Acer Swift Edge', 'Ultra-lightweight laptop with OLED screen'),
(18, 'Microsoft Surface Laptop 6', 'Premium Windows laptop with great build'),
(19, 'MSI Creator Z17', 'Content creation focused laptop'),
(20, 'Framework Laptop', 'Modular and repairable laptop design');

-- Speakers (category_id: 4)
INSERT INTO product (product_id, product_name, description) VALUES 
(51, 'Bose SoundLink Revolve+', 'Portable Bluetooth speaker with 360-degree sound'),
(52, 'JBL PartyBox 310', 'Powerful speaker with light effects and deep bass'),
(53, 'Sony SRS-XB43', 'Extra Bass wireless speaker with water resistance'),
(54, 'Sonos Move', 'Smart speaker with Wi-Fi and Bluetooth'),
(55, 'Marshall Stanmore II', 'Vintage design with rich sound quality'),
(56, 'Ultimate Ears Boom 3', 'Waterproof speaker with 15-hour battery life'),
(57, 'Anker Soundcore Flare 2', 'Affordable speaker with RGB lighting'),
(58, 'Klipsch The One II', 'Classic design with modern sound'),
(59, 'Harman Kardon Onyx Studio 6', 'Elegant design with superior sound'),
(60, 'Bang & Olufsen Beolit 20', 'Premium portable speaker with long battery life');

-- Tablets (category_id: 8)
INSERT INTO product (product_id, product_name, description) VALUES 
(61, 'iPad Pro 12.9', 'High-performance tablet with M2 chip'),
(62, 'Samsung Galaxy Tab S9', 'Android tablet with AMOLED display'),
(63, 'Microsoft Surface Pro 9', 'Versatile 2-in-1 tablet for work and play'),
(64, 'Amazon Fire HD 10', 'Affordable tablet with Alexa integration'),
(65, 'Lenovo Tab P12 Pro', 'Android tablet with stylus support'),
(66, 'Xiaomi Pad 6', 'Affordable and powerful tablet'),
(67, 'ASUS ROG Flow Z13', 'Gaming tablet with detachable keyboard'),
(68, 'Huawei MatePad Pro', 'Premium tablet with multi-screen collaboration'),
(69, 'Realme Pad X', 'Budget-friendly tablet with large display'),
(70, 'Nokia T20', 'Simple tablet with long-lasting battery');

-- Smart Watches (category_id: 9)
INSERT INTO product (product_id, product_name, description) VALUES 
(71, 'Apple Watch Series 9', 'Smartwatch with fitness and health tracking'),
(72, 'Samsung Galaxy Watch6', 'Android smartwatch with customizable features'),
(73, 'Garmin Forerunner 965', 'GPS running watch with advanced metrics'),
(74, 'Fitbit Versa 4', 'Health and fitness tracker with sleep monitoring'),
(75, 'Amazfit GTR 4', 'Affordable smartwatch with AMOLED display'),
(76, 'Huawei Watch GT 3 Pro', 'Premium smartwatch with long battery life'),
(77, 'Withings ScanWatch', 'Hybrid smartwatch with ECG and health tracking'),
(78, 'TicWatch Pro 3', 'Dual display smartwatch with Wear OS'),
(79, 'Fossil Gen 6', 'Stylish smartwatch with customizable watch faces'),
(80, 'Polar Grit X Pro', 'Rugged outdoor watch with GPS tracking');

-- Headphones (category_id: 10)
INSERT INTO product (product_id, product_name, description) VALUES 
(81, 'Sony WH-1000XM5', 'Noise-canceling over-ear headphones'),
(82, 'Apple AirPods Max', 'Premium over-ear headphones with spatial audio'),
(83, 'Bose QuietComfort 45', 'Renowned noise-canceling headphones'),
(84, 'Sennheiser HD 560S', 'Open-back headphones for audiophiles'),
(85, 'Jabra Elite 85t', 'True wireless earbuds with ANC'),
(86, 'Beats Studio Buds', 'Compact wireless earbuds with good sound'),
(87, 'AKG N700NC M2', 'Comfortable noise-canceling headphones'),
(88, 'Anker Soundcore Liberty 3 Pro', 'Affordable earbuds with impressive sound'),
(89, 'Shure AONIC 50', 'Studio-quality sound in a wireless design'),
(90, 'Bowers & Wilkins PX7', 'Luxury headphones with high-fidelity sound');

-- Gaming Consoles (category_id: 11)
INSERT INTO product (product_id, product_name, description) VALUES 
(91, 'PlayStation 5', 'Next-gen console with exclusive games'),
(92, 'Xbox Series X', 'Powerful console with Game Pass integration'),
(93, 'Nintendo Switch OLED', 'Portable console with vibrant display'),
(94, 'Steam Deck', 'Portable gaming PC with Steam integration'),
(95, 'Xbox Series S', 'Affordable digital-only gaming console'),
(96, 'Nintendo Switch Lite', 'Compact and lightweight gaming console'),
(97, 'Sony PlayStation VR2', 'VR headset for immersive gaming'),
(98, 'Logitech G Cloud Gaming Handheld', 'Portable cloud gaming console'),
(99, 'Analogue Pocket', 'Handheld console for retro games'),
(100, 'Atari VCS', 'Retro-inspired console with modern features');

-- Digital Cameras (category_id: 12)
INSERT INTO product (product_id, product_name, description) VALUES 
(101, 'Canon EOS R5', 'Professional mirrorless camera with 8K video'),
(102, 'Nikon Z7 II', 'High-resolution mirrorless camera'),
(103, 'Sony Alpha 7 IV', 'Versatile camera with high image quality'),
(104, 'Fujifilm X-T5', 'Stylish camera with film simulation modes'),
(105, 'Panasonic Lumix GH6', 'Hybrid camera for photo and video'),
(106, 'Leica Q2', 'Luxury compact camera with full-frame sensor'),
(107, 'Olympus OM-D E-M1 Mark III', 'Micro Four Thirds camera for fast shooting'),
(108, 'GoPro Hero 12', 'Action camera for outdoor adventures'),
(109, 'DJI Pocket 2', 'Portable camera with built-in stabilizer'),
(110, 'Ricoh GR IIIx', 'Compact camera with fixed lens and large sensor');

-- Men's Clothing (category_id: 13)
INSERT INTO product (product_id, product_name, description) VALUES 
(111, 'Classic White Shirt', 'Formal white cotton shirt'),
(112, 'Slim Fit Jeans', 'Denim jeans with a modern slim fit'),
(113, 'Bomber Jacket', 'Trendy jacket for casual wear'),
(114, 'Cargo Shorts', 'Comfortable cargo shorts with multiple pockets'),
(115, 'V-Neck Sweater', 'Classic sweater for layering');

-- Women's Clothing (category_id: 14)
INSERT INTO product (product_id, product_name, description) VALUES 
(116, 'Floral Summer Dress', 'Lightweight dress with floral print'),
(117, 'High-Waist Jeans', 'Stylish high-waisted jeans'),
(118, 'Blazer Coat', 'Elegant coat for formal occasions'),
(119, 'Crop Top', 'Trendy crop top for casual outings'),
(120, 'Midi Skirt', 'Flared skirt with comfortable fit');

-- Kids' Clothing (category_id: 15)
INSERT INTO product (product_id, product_name, description) VALUES 
(121, 'Graphic T-Shirt', 'Cotton T-shirt with fun print'),
(122, 'Kids Denim Shorts', 'Comfortable shorts for playtime'),
(123, 'Winter Jacket', 'Warm jacket for winter season'),
(124, 'School Uniform Set', 'Standard school uniform set'),
(125, 'Pajama Set', 'Soft pajamas with cartoon characters');

-- Footwear (category_id: 16)
INSERT INTO product (product_id, product_name, description) VALUES 
(126, 'Running Shoes', 'Lightweight shoes for daily exercise'),
(127, 'Leather Boots', 'Classic boots for casual outings'),
(128, 'Formal Shoes', 'Elegant shoes for formal occasions'),
(129, 'Flip-Flops', 'Comfortable casual flip-flops'),
(130, 'Sandals', 'Open-toe sandals for summer wear');

-- Accessories (category_id: 17)
INSERT INTO product (product_id, product_name, description) VALUES 
(131, 'Leather Belt', 'Classic leather belt with metal buckle'),
(132, 'Sunglasses', 'Stylish sunglasses with UV protection'),
(133, 'Baseball Cap', 'Casual cap with adjustable strap'),
(134, 'Scarf', 'Warm scarf for winter days'),
(135, 'Watch', 'Stylish analog wristwatch');

-- Jewelry (category_id: 18)
INSERT INTO product (product_id, product_name, description) VALUES 
(136, 'Gold Necklace', 'Elegant 18k gold necklace'),
(137, 'Silver Bracelet', 'Sterling silver bracelet with charm'),
(138, 'Diamond Ring', 'Beautiful diamond ring for engagements'),
(139, 'Pearl Earrings', 'Classic pearl earrings for formal events'),
(140, 'Anklet', 'Fashionable anklet with beads');

-- Bags & Wallets (category_id: 19)
INSERT INTO product (product_id, product_name, description) VALUES 
(141, 'Leather Wallet', 'Premium leather wallet with multiple compartments'),
(142, 'Backpack', 'Durable backpack with large capacity'),
(143, 'Crossbody Bag', 'Trendy crossbody bag for essentials'),
(144, 'Tote Bag', 'Spacious tote bag for everyday use'),
(145, 'Clutch', 'Stylish clutch for evening occasions');

-- Sportswear (category_id: 20)
INSERT INTO product (product_id, product_name, description) VALUES 
(146, 'Track Pants', 'Comfortable track pants for workouts'),
(147, 'Sports Bra', 'Supportive sports bra for active wear'),
(148, 'Running Shorts', 'Lightweight shorts for runners'),
(149, 'Gym T-Shirt', 'Breathable T-shirt for gym use'),
(150, 'Yoga Pants', 'Stretchable pants ideal for yoga');

-- Ethnic Wear (category_id: 21)
INSERT INTO product (product_id, product_name, description) VALUES 
(151, 'Saree', 'Traditional Indian saree with intricate design'),
(152, 'Kurta Pajama', 'Comfortable kurta pajama set for men'),
(153, 'Salwar Kameez', 'Stylish salwar kameez for women'),
(154, 'Sherwani', 'Embroidered sherwani for weddings'),
(155, 'Dupatta', 'Beautiful dupatta to pair with ethnic wear');

-- Lingerie & Sleepwear (category_id: 22)
INSERT INTO product (product_id, product_name, description) VALUES 
(156, 'Silk Nightgown', 'Comfortable nightgown in silk fabric'),
(157, 'Lace Bra', 'Stylish lace bra with comfort fit'),
(158, 'Pajama Set', 'Soft cotton pajama set'),
(159, 'Sleep Mask', 'Comfortable sleep mask for better sleep'),
(160, 'Boxers', 'Breathable cotton boxers for men');

-- Winter Wear (category_id: 23)
INSERT INTO product (product_id, product_name, description) VALUES 
(161, 'Puffer Jacket', 'Warm jacket with insulated filling'),
(162, 'Woolen Sweater', 'Classic wool sweater for winter'),
(163, 'Thermal Leggings', 'Comfortable thermal leggings'),
(164, 'Winter Scarf', 'Soft scarf for extra warmth'),
(165, 'Beanie', 'Stylish beanie for cold weather');

-- Designer Brands (category_id: 24)
INSERT INTO product (product_id, product_name, description) VALUES 
(166, 'Gucci Handbag', 'Luxury handbag with signature design'),
(167, 'Prada Sunglasses', 'High-end sunglasses with iconic style'),
(168, 'Armani Suit', 'Elegant suit by Armani'),
(169, 'Louis Vuitton Belt', 'Premium belt with LV branding'),
(170, 'Burberry Trench Coat', 'Classic trench coat by Burberry');

-- Refrigerators (category_id: 25)
INSERT INTO product (product_id, product_name, description) VALUES 
(171, 'LG Smart Refrigerator', 'Energy-efficient fridge with smart features'),
(172, 'Whirlpool Double Door', 'Spacious double door refrigerator'),
(173, 'Samsung Side-by-Side', 'Premium side-by-side fridge with inverter technology'),
(174, 'Haier Mini Fridge', 'Compact fridge ideal for small spaces'),
(175, 'Bosch French Door', 'Luxurious French door refrigerator');

-- Washing Machines (category_id: 26)
INSERT INTO product (product_id, product_name, description) VALUES 
(176, 'Samsung Front Load', 'High-efficiency front load washing machine'),
(177, 'LG Top Load', 'Top load washing machine with inverter motor'),
(178, 'Bosch Fully Automatic', 'Reliable automatic washing machine'),
(179, 'Whirlpool Semi Automatic', 'Affordable semi-automatic washing machine'),
(180, 'IFB Front Load', 'Premium front load with multiple wash programs');

-- Air Conditioners (category_id: 27)
INSERT INTO product (product_id, product_name, description) VALUES 
(181, 'Daikin Split AC', 'Energy-efficient split AC with inverter'),
(182, 'LG Dual Inverter AC', 'Inverter AC with low power consumption'),
(183, 'Voltas Window AC', 'Window AC with fast cooling'),
(184, 'Blue Star Portable AC', 'Portable AC for quick setup'),
(185, 'Carrier Tower AC', 'Tower AC with sleek design');

-- Microwave Ovens (category_id: 28)
INSERT INTO product (product_id, product_name, description) VALUES 
(186, 'Samsung Convection Microwave', 'Convection microwave with grill function'),
(187, 'LG Solo Microwave', 'Simple and efficient solo microwave'),
(188, 'Panasonic Inverter Microwave', 'Inverter microwave with quick heating'),
(189, 'IFB Grill Microwave', 'Versatile microwave with grill feature'),
(190, 'Bajaj OTG Oven', 'Oven toaster griller for baking');

-- Dishwashers (category_id: 29)
INSERT INTO product (product_id, product_name, description) VALUES 
(256, 'Bosch Serie 2', 'Reliable dishwasher with eco mode'),
(257, 'Siemens IQ300', 'Energy-efficient with multiple washing programs'),
(258, 'Voltas Beko DF15A', 'Compact dishwasher for small kitchens'),
(259, 'Kaff DW VETRA 60', 'Stylish dishwasher with quick wash feature'),
(260, 'Elica WQP12-7605V', 'Affordable dishwasher with multiple cycles');

-- Water Heaters (category_id: 30)
INSERT INTO product (product_id, product_name, description) VALUES 
(261, 'Crompton Arno Neo', 'Water heater with powerful heating element'),
(262, 'Venus Magma Plus', 'Durable design with corrosion-resistant tank'),
(263, 'Bajaj New Shakti', 'Compact and safe water heater'),
(264, 'Racold Eterno Pro', 'Energy-efficient with smart bath logic technology'),
(265, 'Usha Misty Digital', 'Water heater with digital temperature display');

-- Vacuum Cleaners (category_id: 31)
INSERT INTO product (product_id, product_name, description) VALUES 
(266, 'Philips PowerPro FC9352/01', 'Bagless vacuum with powerful suction'),
(267, 'Dyson V8 Absolute', 'Cordless stick vacuum with HEPA filter'),
(268, 'Karcher WD 3', 'Multi-purpose vacuum with robust design'),
(269, 'Eureka Forbes Trendy Zip', 'Compact vacuum with advanced filtration'),
(270, 'Inalsa Spruce', 'Affordable vacuum with high efficiency');

-- Kitchen Appliances (category_id: 32)
INSERT INTO product (product_id, product_name, description) VALUES 
(271, 'Preethi Zodiac Mixer Grinder', 'Multifunctional mixer with multiple jars'),
(272, 'Morphy Richards Icon DLX', 'Mixer grinder with powerful motor'),
(273, 'Philips Viva Collection Juicer', 'Juicer with quick-clean technology'),
(274, 'Bajaj Majesty Rice Cooker', 'Electric cooker for easy rice preparation'),
(275, 'Usha FP 3811 Food Processor', 'High-capacity food processor for various tasks');

-- Air Purifiers (category_id: 33)
INSERT INTO product (product_id, product_name, description) VALUES 
(276, 'Mi Air Purifier 3C', 'HEPA filter with high clean air delivery rate'),
(277, 'Sharp FP-J30M', 'Compact air purifier with plasmacluster technology'),
(278, 'Blueair Blue Pure 211+', 'Powerful air purifier with carbon filter'),
(279, 'Philips AC1215/20', 'Compact air purifier for small rooms'),
(280, 'Coway Sleek Pro AP-1009', 'Powerful air purifier with high efficiency');

-- Food Processors (category_id: 34)
INSERT INTO product (product_id, product_name, description) VALUES 
(281, 'Kenwood Multipro Compact', 'Compact food processor with multiple tools'),
(282, 'Bajaj FX1000', 'Food processor with 3-speed control'),
(283, 'Inalsa Inox 1000', 'Multipurpose processor with various attachments'),
(284, 'Prestige PAF 3.0', 'Compact food processor with chopper'),
(285, 'Wonderchef Nutri-Blend', 'Blender-grinder combo for quick blending');

-- Electric Fans (category_id: 35)
INSERT INTO product (product_id, product_name, description) VALUES 
(286, 'Orient Electric Tornado', 'High speed fan with strong air delivery'),
(287, 'Usha Maxx Air', 'Pedestal fan with adjustable height'),
(288, 'Bajaj Esteem Table Fan', 'Compact table fan with oscillation feature'),
(289, 'Havells V3 Turbo', 'Wall fan with powerful motor'),
(290, 'Crompton High Flo Wave Plus', 'Ceiling fan with aerodynamic design');

-- Chimneys & Cooktops (category_id: 36)
INSERT INTO product (product_id, product_name, description) VALUES 
(291, 'Sunflame 60cm Chimney', 'Powerful chimney with high suction capacity'),
(292, 'Glen 6062 Auto Clean', 'Auto clean chimney with touch control'),
(293, 'Kutchina Xpedio', 'Chimney with filterless technology'),
(294, 'Faber Glass Top Cooktop', 'Four-burner glass cooktop with safety features'),
(295, 'Prestige Magic Glass Top', 'Two-burner gas stove with toughened glass');

-- Fiction Books (category_id: 37)
INSERT INTO product (product_id, product_name, description) VALUES 
(296, 'The Great Gatsby', 'Classic novel by F. Scott Fitzgerald'),
(297, 'To Kill a Mockingbird', 'Pulitzer Prize-winning novel by Harper Lee'),
(298, 'The Catcher in the Rye', 'Novel about teenage rebellion by J.D. Salinger'),
(299, 'Brave New World', 'Dystopian science fiction by Aldous Huxley'),
(300, 'The Hobbit', 'Fantasy adventure by J.R.R. Tolkien');

-- Non-Fiction Books (category_id: 38)
INSERT INTO product (product_id, product_name, description) VALUES 
(301, 'The Immortal Life of Henrietta Lacks', 'Story of a woman’s immortal cells'),
(302, 'The Wright Brothers', 'Biography of the Wright brothers by David McCullough'),
(303, 'Thinking, Fast and Slow', 'Psychology book on decision making'),
(304, 'The Man Who Knew Infinity', 'Biography of mathematician Srinivasa Ramanujan'),
(305, 'Unbroken', 'WWII survival story by Laura Hillenbrand');

-- Academic & Educational Books (category_id: 39)
INSERT INTO product (product_id, product_name, description) VALUES 
(201, 'Calculus Made Easy', 'An introductory guide to calculus concepts'),
(202, 'Physics Fundamentals', 'Comprehensive textbook on physics principles'),
(203, 'Introduction to Psychology', 'Textbook covering basic psychology topics'),
(204, 'Organic Chemistry Basics', 'Detailed book on organic chemistry fundamentals'),
(205, 'Advanced Algebra', 'A guide to complex algebraic concepts and techniques');

-- Children's Books (category_id: 40)
INSERT INTO product (product_id, product_name, description) VALUES 
(206, 'The Adventures of Timmy', 'Storybook for young readers'),
(207, 'Fairy Tales of the World', 'A collection of fairy tales from different cultures'),
(208, 'Learning ABCs', 'Educational book for early literacy'),
(209, 'The Magic Castle', 'Fantasy story for children'),
(210, 'Dinosaur Facts', 'Illustrated book with fun dinosaur facts');

-- Comics & Manga (category_id: 41)
INSERT INTO product (product_id, product_name, description) VALUES 
(211, 'Superhero Chronicles', 'Comic series about a team of superheroes'),
(212, 'Samurai Legends', 'Historical manga with samurai adventures'),
(213, 'Alien Invasion', 'Sci-fi comic about an alien invasion'),
(214, 'The Ninja Clan', 'Manga about the journey of a young ninja'),
(215, 'The Masked Vigilante', 'A thrilling comic book about a mysterious hero');

-- Self-Help Books (category_id: 42)
INSERT INTO product (product_id, product_name, description) VALUES 
(216, 'The Power of Positive Thinking', 'Guide to achieving a positive mindset'),
(217, 'Time Management Mastery', 'Tips on managing time efficiently'),
(218, 'Overcoming Anxiety', 'Strategies for managing anxiety effectively'),
(219, 'Goal Setting for Success', 'Steps to setting and achieving goals'),
(220, 'Financial Freedom', 'Advice on achieving financial independence');

-- Business & Economics Books (category_id: 43)
INSERT INTO product (product_id, product_name, description) VALUES 
(221, 'Principles of Economics', 'Basic guide to economics concepts'),
(222, 'Marketing Essentials', 'Introduction to marketing strategies'),
(223, 'Investment Basics', 'Guide to starting in the investment world'),
(224, 'Corporate Finance', 'Exploring the fundamentals of corporate finance'),
(225, 'Startup Success', 'Advice for launching and growing a startup');

-- Technology & Science Books (category_id: 44)
INSERT INTO product (product_id, product_name, description) VALUES 
(226, 'Artificial Intelligence 101', 'Introduction to AI and its applications'),
(227, 'The Quantum World', 'Understanding the basics of quantum mechanics'),
(228, 'Data Science for Beginners', 'Guide to getting started in data science'),
(229, 'The Solar System', 'Comprehensive guide to our solar system'),
(230, 'Blockchain Revolution', 'Exploring the potential of blockchain technology');

-- Biography & Memoirs (category_id: 45)
INSERT INTO product (product_id, product_name, description) VALUES 
(231, 'Memoirs of a Scientist', 'Life journey of a renowned scientist'),
(232, 'A Leader''s Path', 'The story of an influential political leader'),
(233, 'Entrepreneurial Dreams', 'The life of a successful entrepreneur'),
(234, 'The Musician''s Journey', 'Memoir of a world-famous musician'),
(235, 'My Life in the Wild', 'The life story of a conservationist');

-- History Books (category_id: 46)
INSERT INTO product (product_id, product_name, description) VALUES 
(236, 'World War II Chronicles', 'Detailed account of WWII events'),
(237, 'Ancient Civilizations', 'Exploring the history of ancient civilizations'),
(238, 'The Roman Empire', 'The rise and fall of the Roman Empire'),
(239, 'The History of Medicine', 'Development of medical science through ages'),
(240, 'The American Revolution', 'Insight into the American Revolutionary War');

-- Literature & Poetry (category_id: 47)
INSERT INTO product (product_id, product_name, description) VALUES 
(241, 'Collected Works of Shakespeare', 'Complete collection of Shakespeare''s works'),
(242, 'Romantic Poems', 'Anthology of romantic poetry from various authors'),
(243, 'Modern Short Stories', 'Collection of contemporary short stories'),
(244, 'Classic English Novels', 'Compilation of classic English literature'),
(245, 'Epic Poems of Ancient Times', 'Collection of famous epic poems');

-- Religious & Spiritual Books (category_id: 48)
INSERT INTO product (product_id, product_name, description) VALUES 
(246, 'The Bhagavad Gita', 'Sacred Hindu scripture with philosophical insights'),
(247, 'The Holy Bible', 'The Christian Bible with Old and New Testaments'),
(248, 'Teachings of the Buddha', 'Overview of Buddhist principles and teachings'),
(249, 'The Quran', 'The holy book of Islam'),
(250, 'Mindfulness and Spirituality', 'Guide to mindfulness and inner peace');


INSERT INTO product (product_id, product_name, description) 
VALUES
    -- Educational Toys
    (351, 'Math Puzzle Set', 'A set of puzzles to improve math skills.'),
    (352, 'Science Experiment Kit', 'Kit for basic science experiments.'),
    (353, 'Alphabet Blocks', 'Blocks to learn letters and numbers.'),
    (354, 'Coding Robot', 'Interactive robot that teaches coding.'),
    (355, 'Solar System Model', 'A model of the solar system for kids.'),

    -- Action Figures & Collectibles
    (306, 'Superhero Figure', 'An action figure of a popular superhero.'),
    (307, 'Robot Warrior', 'A collectible robot figure.'),
    (308, 'Fantasy Character Set', 'Figures from a popular fantasy series.'),
    (309, 'Movie Icon Figure', 'Collectible movie character figure.'),
    (310, 'Animal Kingdom Set', 'Set of collectible animal figures.'),

    -- Dolls & Accessories
    (311, 'Baby Doll', 'Soft and cuddly baby doll.'),
    (312, 'Fashion Doll', 'Doll with changeable fashion outfits.'),
    (313, 'Dollhouse', 'Fully furnished dollhouse.'),
    (314, 'Doll Carriage', 'A carriage for dolls to ride in style.'),
    (315, 'Doll Clothing Set', 'Set of clothing for various dolls.'),

    -- Building & Construction Toys
    (316, 'Building Blocks', 'Classic set of colorful blocks.'),
    (317, 'Magnetic Tiles', 'Tiles that stick together to build shapes.'),
    (318, 'Engineering Kit', 'Kit to build simple machines.'),
    (319, 'Wooden Construction Set', 'Wooden set for creative building.'),
    (320, 'Bridge Builder Kit', 'Kit to build bridge models.'),

    -- Electronic & Robotic Toys
    (321, 'Remote Control Car', 'High-speed RC car.'),
    (322, 'Dancing Robot', 'Robot that can dance and sing.'),
    (323, 'Virtual Pet', 'Interactive pet that responds to touch.'),
    (324, 'Drone with Camera', 'Small drone with a camera for kids.'),
    (325, 'Interactive Tablet', 'Tablet for learning games and activities.'),

    -- Vehicles & Playsets
    (326, 'Toy Race Car', 'Race car with pull-back action.'),
    (327, 'Construction Truck', 'Truck with movable parts.'),
    (328, 'Police Station Playset', 'Playset with police station theme.'),
    (329, 'Fire Engine', 'Toy fire engine with lights and sounds.'),
    (330, 'Train Set', 'Toy train with tracks.'),

    -- Role-Playing Toys
    (331, 'Doctor Kit', 'Doctor kit with stethoscope and tools.'),
    (332, 'Kitchen Set', 'Mini kitchen set for pretend play.'),
    (333, 'Tool Set', 'Kid-friendly tool set for builders.'),
    (334, 'Cash Register', 'Toy cash register with pretend money.'),
    (335, 'Firefighter Costume', 'Costume for role-playing firefighter.'),

    -- Outdoor & Sports Toys
    (336, 'Soccer Ball', 'Kid-sized soccer ball for outdoor play.'),
    (337, 'Basketball Hoop', 'Portable hoop for basketball.'),
    (338, 'Water Gun', 'High-pressure water gun.'),
    (339, 'Kick Scooter', 'Two-wheel scooter for kids.'),
    (340, 'Bicycle Helmet', 'Helmet for cycling safety.'),

    -- Musical & Sensory Toys
    (341, 'Toy Guitar', 'Guitar with sound effects.'),
    (342, 'Drum Set', 'Small drum set for kids.'),
    (343, 'Xylophone', 'Colorful xylophone with mallets.'),
    (344, 'Sensory Ball', 'Textured ball for sensory play.'),
    (345, 'Fidget Cube', 'Cube with fidget-friendly sides.'),

    -- Board Games & Puzzles
    (346, 'Puzzle Set', 'Set of small jigsaw puzzles.'),
    (347, 'Board Game', 'Classic family board game.'),
    (348, 'Memory Game', 'Card game to improve memory.'),
    (349, 'Checkers Set', 'Checkers board game.'),
    (350, 'Maze Puzzle', 'Handheld maze puzzle.');
-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
