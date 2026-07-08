-- ======================== ADDITIONAL INSERT QUERIES ================================

-- Including data from the original request
-- Inserting data into pincode_location
INSERT INTO pincode_location (pin, city, state) VALUES
(400001, 'Mumbai',    'Maharashtra'),
(110001, 'Delhi',     'Delhi'),
(380001, 'Ahmedabad', 'Gujarat'),
(395001, 'Surat',     'Gujarat'),
(560001, 'Bangalore', 'Karnataka'),
(411001, 'Pune',      'Maharashtra'),
(302001, 'Jaipur',    'Rajasthan'),
(600001, 'Chennai',   'Tamil Nadu')
ON CONFLICT DO NOTHING;

-- Inserting longitude & latitude coordinates mapped to pincodes (location mapping for addresses)
INSERT INTO coordinate_pincode (longitude, latitude, pin) VALUES
(72.8777, 19.0760, 400001),
(72.8800, 19.0800, 400001),
(72.8750, 19.0720, 400001),
(72.8900, 19.0900, 400001),
(72.8830, 19.0830, 400001),
(72.8770, 19.0750, 400001),
(72.8810, 19.0780, 400001),
(77.1025, 28.7041, 110001),
(77.1060, 28.7080, 110001),
(77.1000, 28.7000, 110001),
(77.1040, 28.7060, 110001),
(72.5714, 23.0225, 380001),
(72.5750, 23.0260, 380001),
(72.5780, 23.0200, 380001),
(72.5700, 23.0250, 380001),
(73.8567, 18.5204, 411001),
(73.8600, 18.5240, 411001),
(72.8311, 21.1702, 395001),
(75.7873, 26.9124, 302001),
(80.2707, 13.0827, 600001),
(80.2740, 13.0860, 600001),
(77.5946, 12.9716, 560001),
(77.5980, 12.9750, 560001),
(77.6000, 12.9700, 560001),
(77.5920, 12.9680, 560001),
(77.5940, 12.9710, 560001)
ON CONFLICT DO NOTHING;

-- Inserting data into "user"
INSERT INTO "user" (user_id, name, email, reg_date, user_type) VALUES
(1,  'Amit Sharma',      'amit@email.com',       '2025-01-15', 'Individual'),
(2,  'Priya Patel',      'priya@email.com',      '2025-02-20', 'Individual'),
(3,  'Rahul Kariya',     'rahul@email.com',      '2025-03-10', 'Individual'),
(4,  'Neha Gupta',       'neha@email.com',       '2025-04-05', 'Corporate'),
(5,  'Kartik Vasavada',  'kartik@email.com',     '2025-05-01', 'Individual'),
(6,  'Ravi Kumar',       'ravi@email.com',       '2025-06-15', 'Individual'),
(7,  'Anjali Singh',     'anjali@email.com',     '2025-07-20', 'Corporate'),
(8,  'Vikram Mehta',     'vikram@email.com',     '2025-08-10', 'Individual'),
(9,  'Sonal Desai',      'sonal@email.com',      '2025-09-05', 'Individual'),
(10, 'Manish Joshi',     'manish@email.com',     '2025-10-15', 'Corporate'),
(11, 'Deepa Reddy',      'deepa@email.com',      '2025-11-20', 'Individual'),
(12, 'Arjun Nair',       'arjun@email.com',      '2025-12-01', 'Individual'),
(13, 'Pooja Verma',      'pooja@email.com',      '2026-01-10', 'Individual'),
(14, 'Suresh Yadav',     'suresh@email.com',     '2026-02-05', 'Corporate'),
(15, 'Kavita Iyer',      'kavita@email.com',     '2026-03-01', 'Individual'),
(16, 'Rajesh Khanna',    'rajesh@email.com',     '2026-03-15', 'Individual'),
(17, 'Sneha Pillai',     'sneha@email.com',      '2026-03-20', 'Individual'),
(18, 'Aakash Mishra',    'aakash@email.com',     '2026-04-10', 'Individual'),
(19, 'Divya Chauhan',    'divya@email.com',      '2026-04-11', 'Individual'),
(20, 'Rohit Saxena',     'rohit@email.com',      '2026-04-12', 'Corporate'),
(21, 'Meera Jain',       'meera@email.com',      '2025-05-15', 'Individual'),
(22, 'Kunal Thakur',     'kunal@email.com',      '2025-06-20', 'Individual'),
(23, 'Tanya Bose',       'tanya@email.com',      '2025-07-01', 'Individual'),
(24, 'Harsh Agarwal',    'harsh@email.com',      '2025-08-15', 'Individual'),
(25, 'Arun Hegde',       'arun@email.com',       '2025-09-01', 'Individual'),
(202401083, 'Kartik OLX','kartik.olx@email.com', '2025-01-01', 'Individual')
ON CONFLICT DO NOTHING;

-- Inserting data into seller
INSERT INTO seller (seller_id, user_id, seller_rating) VALUES
(1,  1,  4.5),
(2,  4,  3.8),
(3,  6,  4.2),
(4,  7,  4.7),
(5,  8,  3.5),
(6,  10, 4.0),
(7,  12, 4.8),
(8,  14, 3.2),
(9,  18, 2.0),
(10, 16, 4.3),
(11, 20, 1.5),
(12, 22, 4.1)
ON CONFLICT DO NOTHING;

-- Inserting data into buyer
INSERT INTO buyer (buyer_id, user_id) VALUES
(1,  2), (2,  3), (3,  5), (4,  9), (5,  11), (6,  13), (7,  15), (8,  17),
(9,  21), (10, 23), (11, 7), (12, 19), (13, 24), (14, 25), (15, 27), (16, 29), (17, 30),
(18, 1), (19, 4), (20, 6), (21, 8), (22, 10), (23, 12), (24, 14), (25, 16),
(26, 18), (27, 20), (28, 22), (29, 26), (30, 28), (31, 202401083)
ON CONFLICT DO NOTHING;

-- Inserting data into admin
INSERT INTO admin (admin_id, user_id, role) VALUES
(1, 16, 'Super Admin'),
(2, 15, 'Content Moderator')
ON CONFLICT DO NOTHING;

-- Inserting data into address
INSERT INTO address (address_id, address_line, longitude, latitude) VALUES
(1,  '123 Main St', 72.8777, 19.0760),
(2,  '456 Tech Park', 77.1025, 28.7041),
(3,  '789 Heritage', 72.5714, 23.0225),
(4,  '111 Plaza', 72.5750, 23.0260),
(5,  '222 Society', 72.8800, 19.0800),
(6,  '333 Building', 72.8750, 19.0720),
(7,  '444 Area', 77.1060, 28.7080),
(8,  '555 Tech', 72.8900, 19.0900),
(9,  '666 City', 73.8567, 18.5204),
(10, '777 Tower', 72.5780, 23.0200),
(11, '888 Park', 77.5946, 12.9716),
(12, '999 Avenue', 77.5980, 12.9750),
(13, '101 Street', 77.1000, 28.7000),
(14, '102 Main', 72.5700, 23.0250),
(15, '103 Cross', 80.2707, 13.0827),
(16, '104 Way', 73.8600, 18.5240),
(17, '105 Path', 72.8311, 21.1702),
(18, '106 Trail', 77.1040, 28.7060),
(19, '107 Block', 72.8830, 19.0830),
(20, '108 Grid', 75.7873, 26.9124),
(21, '109 Hub', 72.8770, 19.0750),
(22, '110 Zone', 80.2740, 13.0860),
(23, '111 Core', 77.6000, 12.9700),
(24, '112 Base', 72.8810, 19.0780),
(25, '113 Link', 77.5920, 12.9680),
(26, '114 Site', 77.5940, 12.9710),
(27, '115 Spot', 72.8777, 19.0760),
(28, '116 Point', 72.8800, 19.0800),
(29, '117 Node', 77.1025, 28.7041),
(30, '118 Center', 72.5714, 23.0225),
(31, '119 Base', 73.8567, 18.5204)
ON CONFLICT DO NOTHING;

-- Inserting data into user_address
INSERT INTO user_address (user_id, address_id, label, is_primary) VALUES
(1, 1, 'Home', TRUE),
(2, 2, 'Work', TRUE),
(3, 3, 'Home', TRUE),
(4, 4, 'Work', TRUE),
(5, 5, 'Home', TRUE),
(6, 6, 'Work', TRUE),
(7, 7, 'Home', TRUE),
(8, 8, 'Work', TRUE),
(9, 9, 'Home', TRUE),
(10, 10, 'Work', TRUE),
(11, 11, 'Home', TRUE),
(12, 12, 'Work', TRUE),
(13, 13, 'Home', TRUE),
(14, 14, 'Work', TRUE),
(15, 15, 'Home', TRUE),
(16, 16, 'Work', TRUE),
(17, 17, 'Home', TRUE),
(18, 18, 'Work', TRUE),
(19, 19, 'Home', TRUE),
(20, 20, 'Work', TRUE),
(21, 21, 'Home', TRUE),
(22, 22, 'Work', TRUE),
(23, 23, 'Home', TRUE),
(202401083, 24, 'Work', TRUE),
(24, 25, 'Home', TRUE),
(25, 26, 'Work', TRUE),
(26, 27, 'Home', TRUE),
(27, 28, 'Work', TRUE),
(28, 29, 'Home', TRUE),
(29, 30, 'Work', TRUE),
(30, 31, 'Home', TRUE)
ON CONFLICT DO NOTHING;

-- Inserting data into categories
INSERT INTO categories (category_id, category_name, parent_id) VALUES
(1, 'Electronics',      NULL),
(2, 'Mobiles',           1),
(3, 'Furniture',         NULL),
(4, 'Vehicles',          NULL),
(5, 'Fashion',           NULL),
(6, 'Books',             NULL),
(7, 'Home Appliances',   NULL)
ON CONFLICT DO NOTHING;

-- Inserting product listings
INSERT INTO products (product_id, pname, brand, price, condition, status, date_of_listing, categorie_id, seller_id, address_id) VALUES
(1,  'iPhone 14',               'Apple',          45000,  'Used', 'Available', '2025-06-01', 2, 1,  1),
(2,  'iPhone 13',               'Apple',          35000,  'Good', 'Available', '2025-07-15', 2, 2,  4),
(3,  'Samsung Galaxy S23',      'Samsung',        55000,  'New',  'Available', '2025-05-01', 2, 4,  7),
(4,  'OnePlus 12',              'OnePlus',        42000,  'New',  'Sold',      '2025-09-01', 2, 1,  1),
(5,  'Xiaomi 14',               'Xiaomi',         28000,  'Used', 'Available', '2025-10-01', 2, 6,  10),
(6,  'iPhone 15',               'Apple',          65000,  'New',  'Available', '2025-11-01', 2, 3,  6),
(7,  'Samsung Galaxy A54',      'Samsung',        22000,  'Good', 'Available', '2025-12-01', 2, 2,  4),
(8,  'Pixel 8',                 'Google',         45000,  'New',  'Sold',      '2026-01-01', 2, 7,  12),
(9,  'Samsung Galaxy S24',      'Samsung',        72000,  'New',  'Sold',      '2025-08-01', 2, 10, 16),
(10, 'Motorola Edge',           'Motorola',       18000,  'Used', 'Sold',      '2025-07-01', 2, 8,  14),
(42, 'iPhone 14 Pro',           'Apple',          15000,  'Used', 'Available', '2026-04-10', 2, 9,  18),
(43, 'iPhone 13 Mini',          'Apple',          12000,  'Used', 'Available', '2026-04-10', 2, 9,  18),
(45, 'Samsung Galaxy S22',      'Samsung',        18000,  'Used', 'Available', '2026-04-10', 2, 9,  18),
(46, 'OnePlus Nord',            'OnePlus',         8000,  'Used', 'Available', '2026-04-10', 2, 9,  18),
(47, 'Xiaomi Mi 11',            'Xiaomi',          7000,  'Used', 'Available', '2026-04-10', 2, 9,  18),
(52, 'Samsung Galaxy Z Fold',  'Samsung',       150000,  'New',  'Available', '2025-11-01', 2, 7,  12),
(11, 'Sony LED TV 55 inch',    'Sony',            75000,  'New',  'Available', '2025-06-01', 1, 1,  1),
(12, 'Dell Laptop Inspiron',   'Dell',            52000,  'Used', 'Available', '2025-08-15', 1, 4,  7),
(13, 'Bose Headphones',        'Bose',            25000,  'New',  'Sold',      '2025-09-01', 1, 3,  6),
(14, 'Canon DSLR Camera',      'Canon',          85000,  'New',  'Available', '2025-10-01', 1, 7,  12),
(15, 'HP Laptop',              'HP',             48000,  'Good', 'Available', '2025-11-01', 1, 6,  10),
(16, 'Apple MacBook Air',      'Apple',          95000,  'New',  'Sold',      '2025-12-01', 1, 10, 16),
(17, 'Samsung Tablet',         'Samsung',        30000,  'Used', 'Sold',      '2026-01-15', 1, 1,  1),
(18, 'JBL Speaker',            'JBL',             8000,  'Used', 'Available', '2026-02-01', 1, 8,  14),
(19, 'Sony LED TV 42 inch',    'Sony',          195000,  'New',  'Available', '2025-07-01', 1, 1,  1),
(44, 'Apple Watch SE',          'Apple',           8000,  'Used', 'Available', '2026-04-10', 1, 9,  18),
(20, 'Wooden Dining Table',    'IKEA',            25000,  'New',  'Available', '2025-06-01', 3, 1,  1),
(21, 'Office Chair',           'Godrej',          12000,  'Used', 'Available', '2025-08-01', 3, 4,  7),
(22, 'Sofa Set',               'Nilkamal',        35000,  'New',  'Sold',      '2025-09-01', 3, 3,  6),
(23, 'Bookshelf',              'IKEA',             8000,  'Used', 'Available', '2025-10-01', 3, 6,  10),
(24, 'King Size Bed',          'Durian',          45000,  'New',  'Sold',      '2025-11-01', 3, 10, 16),
(54, 'Nilkamal Wardrobe',      'Nilkamal',        18000,  'Used', 'Sold',      '2025-10-01', 3, 10, 16),
(25, 'Honda Activa',           'Honda',          65000,  'Used', 'Available', '2025-06-01', 4, 5,  8),
(26, 'Royal Enfield Classic',  'Royal Enfield', 150000,  'Used', 'Sold',      '2025-07-01', 4, 4,  7),
(27, 'Maruti Swift',           'Maruti',        450000,  'Used', 'Available', '2025-08-01', 4, 1,  1),
(28, 'TVS Jupiter',            'TVS',            55000,  'New',  'Available', '2025-09-01', 4, 7,  12),
(29, 'Hyundai i20',            'Hyundai',       550000,  'Used', 'Sold',      '2025-10-01', 4, 3,  6),
(48, 'Royal Enfield Bullet',   'Royal Enfield',  40000,  'Used', 'Available', '2026-04-12', 4, 11, 20),
(49, 'Hero Splendor',          'Hero',            25000,  'Used', 'Available', '2026-04-12', 4, 11, 20),
(30, 'Nike Shoes',             'Nike',             8500,  'New',  'Available', '2025-06-01', 5, 3,  6),
(31, 'Levis Jeans',            'Levis',            3500,  'New',  'Available', '2025-07-01', 5, 4,  7),
(32, 'Zara Jacket',            'Zara',             5000,  'Used', 'Sold',      '2025-08-01', 5, 6,  10),
(33, 'Adidas Sneakers',        'Adidas',           7000,  'New',  'Available', '2025-09-01', 5, 1,  1),
(34, 'Gucci Bag',              'Gucci',           45000,  'Used', 'Available', '2025-10-01', 5, 7,  12),
(53, 'Vintage Leather Belt',   'Vintage',          2000,  'Used', 'Available', '2025-10-01', 5, 5,  8),
(55, 'Nike Running Shoes',     'Nike',             6500,  'Used', 'Sold',      '2025-11-01', 5, 10, 16),
(56, 'Tommy Hilfiger Shirt',   'Tommy',            4000,  'Used', 'Available', '2025-11-01', 5, 10, 16),
(35, 'The Alchemist',          'Penguin',           350,  'Used', 'Sold',      '2025-06-01', 6, 1,  1),
(36, 'Atomic Habits',          'Penguin',           500,  'New',  'Sold',      '2025-07-01', 6, 4,  7),
(37, 'Sapiens',                'Harper',            600,  'Used', 'Sold',      '2025-08-01', 6, 3,  6),
(38, 'Samsung Washing Machine', 'Samsung',        32000,  'New',  'Available', '2025-06-01', 7, 1,  1),
(39, 'LG Refrigerator',         'LG',             28000,  'Used', 'Available', '2025-08-01', 7, 4,  7),
(40, 'Dyson Vacuum',            'Dyson',          35000,  'New',  'Sold',      '2025-09-01', 7, 7,  12),
(41, 'Philips Iron',            'Philips',         2500,  'Used', 'Available', '2025-10-01', 7, 6,  10),
(50, 'LG OLED TV',              'LG',            120000,  'New',  'Available', '2026-01-01', 7, 10, 16),
(51, 'Bosch Washing Machine',   'Bosch',          40000,  'New',  'Sold',      '2025-12-01', 7, 10, 16)
ON CONFLICT DO NOTHING;

-- Inserting data into product_image
INSERT INTO product_image (image_id, product_id, image_url, is_primary) VALUES
(1,  1,  '/images/iphone14.jpg',             TRUE),
(2,  2,  '/images/iphone13.jpg',             TRUE),
(3,  3,  '/images/galaxy_s23.jpg',           TRUE),
(4,  4,  '/images/oneplus12.jpg',            TRUE),
(5,  5,  '/images/xiaomi14.jpg',             TRUE),
(6,  6,  '/images/iphone15.jpg',             TRUE),
(7,  7,  '/images/galaxy_a54.jpg',           TRUE),
(8,  8,  '/images/pixel8.jpg',               TRUE),
(9,  9,  '/images/galaxy_s24.jpg',           TRUE),
(10, 10, '/images/moto_edge.jpg',            TRUE),
(11, 11, '/images/sony_tv55.jpg',            TRUE),
(12, 12, '/images/dell_inspiron.jpg',        TRUE),
(13, 13, '/images/bose_headphones.jpg',      TRUE),
(14, 14, '/images/canon_dslr.jpg',           TRUE),
(15, 15, '/images/hp_laptop.jpg',            TRUE),
(16, 16, '/images/macbook_air.jpg',          TRUE),
(17, 17, '/images/samsung_tablet.jpg',       TRUE),
(18, 18, '/images/jbl_speaker.jpg',          TRUE),
(19, 19, '/images/sony_tv42.jpg',            TRUE),
(20, 20, '/images/dining_table.jpg',         TRUE),
(21, 21, '/images/office_chair.jpg',         TRUE),
(22, 22, '/images/sofa_set.jpg',             TRUE),
(23, 23, '/images/bookshelf.jpg',            TRUE),
(24, 24, '/images/king_bed.jpg',             TRUE),
(25, 25, '/images/honda_activa.jpg',         TRUE),
(26, 26, '/images/royal_enfield.jpg',        TRUE),
(27, 27, '/images/maruti_swift.jpg',         TRUE),
(28, 28, '/images/tvs_jupiter.jpg',          TRUE),
(29, 29, '/images/hyundai_i20.jpg',          TRUE),
(30, 30, '/images/nike_shoes.jpg',           TRUE),
(31, 31, '/images/levis_jeans.jpg',          TRUE),
(32, 32, '/images/zara_jacket.jpg',          TRUE),
(33, 33, '/images/adidas_sneakers.jpg',      TRUE),
(34, 34, '/images/gucci_bag.jpg',            TRUE),
(35, 35, '/images/alchemist.jpg',            TRUE),
(36, 36, '/images/atomic_habits.jpg',        TRUE),
(37, 37, '/images/sapiens.jpg',              TRUE),
(38, 38, '/images/samsung_washer.jpg',       TRUE),
(39, 39, '/images/lg_fridge.jpg',            TRUE),
(40, 40, '/images/dyson_vacuum.jpg',         TRUE),
(41, 41, '/images/philips_iron.jpg',         TRUE),
(42, 42, '/images/iphone14pro.jpg',          TRUE),
(43, 43, '/images/iphone13mini.jpg',         TRUE),
(44, 44, '/images/apple_watch.jpg',          TRUE),
(45, 45, '/images/galaxy_s22.jpg',           TRUE),
(46, 46, '/images/oneplus_nord.jpg',         TRUE),
(47, 47, '/images/xiaomi_mi11.jpg',          TRUE),
(48, 48, '/images/re_bullet.jpg',            TRUE),
(49, 49, '/images/hero_splendor.jpg',        TRUE),
(50, 50, '/images/lg_oled.jpg',              TRUE),
(51, 51, '/images/bosch_washer.jpg',         TRUE),
(52, 52, '/images/galaxy_zfold.jpg',         TRUE),
(53, 53, '/images/vintage_belt.jpg',         TRUE),
(54, 54, '/images/nilkamal_wardrobe.jpg',    TRUE),
(55, 55, '/images/nike_running.jpg',         TRUE),
(56, 56, '/images/tommy_shirt.jpg',          TRUE)
ON CONFLICT DO NOTHING;

-- Inserting data into wishlist
INSERT INTO wishlist (wishlist_id, user_id, wishlist_name) VALUES
(1,  5,  'My Favorites'),
(2,  5,  'Electronics Wish'),
(3,  2,  'Priya Picks'),
(4,  9,  'Sonal List'),
(5,  11, 'Deepa Favorites'),
(6,  13, 'Pooja Wishlist'),
(7,  15, 'Kavita Items'),
(8,  21, 'Meera Picks'),
(9,  17, 'Sneha Watch'),
(10, 3,  'Rahul List')
ON CONFLICT DO NOTHING;

-- Inserting data into contains
INSERT INTO contains (wishlist_id, product_id) VALUES
(1, 1),  (1, 3),  (1, 11), (1, 30),
(2, 12), (2, 14),
(3, 1),  (3, 4),  (3, 13), (3, 22), (3, 26),
(4, 1),  (4, 3),  (4, 11), (4, 25),
(5, 1),  (5, 3),  (5, 11), (5, 25), (5, 34),
(6, 1),  (6, 3),  (6, 11), (6, 6),  (6, 14),
(7, 14), (7, 28), (7, 50),
(8, 1),  (8, 6),  (8, 11), (8, 20),
(9, 5),  (9, 7),  (9, 38),
(10, 15), (10, 23)
ON CONFLICT DO NOTHING;

-- Inserting data into conversations
INSERT INTO conversations (conversation_id, buyer_id, seller_id) VALUES
(1,  2,  1),
(2,  3,  1),
(3,  1,  4),
(4,  5,  7),
(5,  6,  4),
(6,  7,  1),
(7,  8,  2),
(8,  2,  6),
(9,  9,  3),
(10, 10, 7),
(11, 3,  4),
(12, 11, 1),
(13, 1,  9),
(14, 12, 5)
ON CONFLICT DO NOTHING;

-- Inserting data into message
INSERT INTO message (message_id, conversation_id, message_content, sent_at) VALUES
(1,  1,  'Hi, is the iPhone 14 still available?',        '2025-12-01 10:00:00'),
(2,  1,  'Yes, it is! Are you interested?',              '2025-12-01 10:05:00'),
(3,  1,  'Can you reduce the price a bit?',              '2025-12-01 10:15:00'),
(4,  1,  'I can do 42000, final price.',                 '2025-12-01 10:20:00'),
(5,  1,  'Deal! When can we meet?',                      '2025-12-01 10:30:00'),
(6,  2,  'Hello, interested in your iPhone 14.',         '2025-12-05 11:00:00'),
(7,  2,  'Sure, when can you come see it?',              '2025-12-05 11:10:00'),
(8,  3,  'Is the Royal Enfield in good condition?',      '2025-12-10 09:00:00'),
(9,  3,  'Yes, recently serviced.',                      '2025-12-10 09:15:00'),
(10, 4,  'Interested in Canon DSLR.',                    '2025-12-15 14:00:00'),
(11, 4,  'Sure, check the photos I uploaded.',           '2025-12-15 14:10:00'),
(12, 5,  'Hi, is the laptop available?',                 '2026-01-05 16:00:00'),
(13, 6,  'Can I see the Sony TV in person?',             '2026-01-10 10:00:00'),
(14, 7,  'Hi, Galaxy A54 price negotiable?',             '2026-01-15 12:00:00'),
(15, 8,  'Is the Xiaomi 14 still available?',            '2026-01-20 11:00:00'),
(16, 8,  'Yes, come take a look!',                       '2026-01-20 11:20:00'),
(17, 9,  'Interested in Nike shoes.',                    '2026-02-01 13:00:00'),
(18, 10, 'Canon DSLR still available?',                  '2026-02-10 15:00:00'),
(19, 11, 'Looking at the Dell Laptop.',                  '2026-02-15 10:00:00'),
(20, 11, 'Yes, its in great condition.',                 '2026-02-15 10:15:00'),
(21, 12, 'Sony TV price?',                               '2026-02-20 09:00:00'),
(22, 12, 'Its 75000, firm price.',                       '2026-02-20 09:10:00'),
(23, 12, 'Can you do 70000?',                            '2026-02-20 09:20:00'),
(24, 13, 'Hi, iPhone 14 Pro is real?',                   '2026-04-10 10:00:00'),
(25, 13, 'Yes, 100% genuine.',                           '2026-04-10 10:05:00'),
(26, 14, 'Honda Activa available?',                      '2026-03-01 11:00:00'),
(27, 14, 'Yes!',                                         '2026-03-01 11:05:00')
ON CONFLICT DO NOTHING;

-- Inserting data into review
INSERT INTO review (review_id, buyer_id, seller_id, rating, review_comment, review_date) VALUES
(1,  1,  1,  3, 'Okay product, expected better.',        '2025-07-01'),
(2,  2,  1,  2, 'Not great quality.',                    '2025-08-01'),
(3,  3,  1,  3, 'Average experience.',                   '2025-09-01'),
(4,  5,  1,  4, 'Good seller, fast delivery.',           '2025-12-01'),
(5,  6,  1,  5, 'Excellent product, highly recommend!',  '2026-01-01'),
(6,  7,  1,  4, 'Very good, well packed.',               '2026-02-01'),
(7,  9,  1,  5, 'Amazing seller, will buy again!',       '2026-03-01'),
(8,  11, 4,  5, 'Best seller ever! Highly recommended!', '2026-01-15'),
(9,  8,  2,  5, 'Great product, fast response!',         '2026-02-01'),
(10, 8,  2,  4, 'Good deal, satisfied.',                 '2026-03-01'),
(11, 1,  4,  4, 'Smooth transaction with Anjali.',       '2025-10-01'),
(12, 5,  7,  5, 'Superb Canon camera quality!',          '2025-11-01'),
(13, 6,  3,  3, 'Average, product was okay.',            '2025-12-01'),
(14, 3,  4,  4, 'Nice seller, good communication.',      '2026-01-01')
ON CONFLICT DO NOTHING;

-- Inserting data into notifications
INSERT INTO notifications (notification_id, user_id, type, timestamp) VALUES
(1,  1,  'listing',    '2025-06-15 10:00:00'),
(2,  2,  'message',    '2025-07-01 11:00:00'),
(3,  3,  'price_drop', '2025-08-01 12:00:00'),
(4,  5,  'listing',    '2025-09-01 13:00:00'),
(5,  6,  'message',    '2025-10-01 14:00:00'),
(6,  7,  'promotion',  '2025-11-01 15:00:00'),
(7,  9,  'listing',    '2025-12-01 16:00:00'),
(8,  11, 'message',    '2026-01-01 17:00:00'),
(9,  13, 'price_drop', '2026-02-01 18:00:00'),
(10, 15, 'listing',    '2026-03-01 19:00:00'),
(11, 1,  'promotion',  '2026-03-15 10:00:00'),
(12, 5,  'message',    '2026-03-20 11:00:00')
ON CONFLICT DO NOTHING;

-- Inserting data into contact
INSERT INTO contact (contact_id, user_id, phone_number) VALUES
(1,  1,  '9876543210'),
(2,  3,  '9876543211'),
(3,  5,  '9876543212'),
(4,  7,  '9876543213'),
(5,  9,  '9876543214'),
(6,  2,  '9876543215'),
(7,  4,  '9876543216'),
(8,  6,  '9876543217'),
(9,  8,  '9876543218'),
(10, 10, '9876543219')
ON CONFLICT DO NOTHING;

-- =======================================================================
-- ADDING NEW GENERATED QUERIES BELOW
-- =======================================================================

-- Inserting data into "user"
INSERT INTO "user" (user_id, name, email, reg_date, user_type) VALUES
(26, 'Anita Desai', 'anita@email.com', '2026-05-01', 'Individual'),
(27, 'Brijesh Patel', 'brijesh@email.com', '2026-05-05', 'Individual'),
(28, 'Chetan Shah', 'chetan@email.com', '2026-05-10', 'Corporate'),
(29, 'Drishti Mehta', 'drishti@email.com', '2026-05-12', 'Individual'),
(30, 'Eshan Varma', 'eshan@email.com', '2026-05-15', 'Individual')
ON CONFLICT DO NOTHING;

-- Inserting data into seller
INSERT INTO seller (seller_id, user_id, seller_rating) VALUES
(13, 26, 4.4),
(14, 28, 4.9)
ON CONFLICT DO NOTHING;





-- Inserting additional products
INSERT INTO products (product_id, pname, brand, price, condition, status, date_of_listing, categorie_id, seller_id, address_id) VALUES
(57, 'MacBook Pro M2', 'Apple', 125000, 'Used', 'Available', '2026-05-02', 1, 13, 27),
(58, 'Sony PlayStation 5', 'Sony', 45000, 'New', 'Available', '2026-05-03', 1, 14, 29),
(59, 'Fossil Gen 6 Smartwatch', 'Fossil', 14000, 'New', 'Available', '2026-05-05', 1, 13, 27),
(60, 'KTM Duke 390', 'KTM', 210000, 'Used', 'Available', '2026-05-06', 4, 14, 29),
(61, 'Rolex Submariner Replica', 'Rolex Replica', 5000, 'Used', 'Available', '2026-05-10', 5, 13, 27),
(62, 'Realme GT 2 Pro', 'Realme', 35000, 'Used', 'Available', '2026-05-11', 2, 2, 4),
(63, 'Lenovo Legion 5', 'Lenovo', 85000, 'Used', 'Available', '2026-05-12', 1, 3, 6),
(64, 'Poco X4 Pro', 'Poco', 15000, 'Used', 'Available', '2026-05-13', 2, 4, 7),
(65, 'Asus ROG Phone 6', 'Asus', 60000, 'New', 'Available', '2026-05-14', 2, 5, 8),
(66, 'Tata Nexon EV', 'Tata', 1400000, 'Used', 'Available', '2026-05-15', 4, 6, 10)
ON CONFLICT DO NOTHING;

-- Inserting data into product_image
INSERT INTO product_image (image_id, product_id, image_url, is_primary) VALUES
(57, 57, '/images/macbook_pro_m2.jpg', TRUE),
(58, 58, '/images/ps5.jpg', TRUE),
(59, 59, '/images/fossil_gen6.jpg', TRUE),
(60, 60, '/images/ktm_duke.jpg', TRUE),
(61, 61, '/images/rolex_replica.jpg', TRUE),
(62, 62, '/images/realme_gt_2.jpg', TRUE),
(63, 63, '/images/lenovo_legion_5.jpg', TRUE),
(64, 64, '/images/poco_x4_pro.jpg', TRUE),
(65, 65, '/images/asus_rog_phone_6.jpg', TRUE),
(66, 66, '/images/tata_nexon_ev.jpg', TRUE)
ON CONFLICT DO NOTHING;

-- Inserting data into wishlist
INSERT INTO wishlist (wishlist_id, user_id, wishlist_name) VALUES
(11, 27, 'Tech Gadgets'),
(12, 29, 'Bikes I Like')
ON CONFLICT DO NOTHING;

-- Inserting data into contains
INSERT INTO contains (wishlist_id, product_id) VALUES
(11, 57),
(11, 58),
(12, 60)
ON CONFLICT DO NOTHING;

-- Inserting data into conversations
INSERT INTO conversations (conversation_id, buyer_id, seller_id) VALUES
(15, 15, 13),
(16, 16, 14)
ON CONFLICT DO NOTHING;

-- Inserting data into message
INSERT INTO message (message_id, conversation_id, message_content, sent_at) VALUES
(28, 15, 'Is the MacBook Pro still under warranty?', '2026-05-04 10:00:00'),
(29, 15, 'Yes, it has 6 months warranty left.', '2026-05-04 10:15:00'),
(30, 16, 'What is the final price for Duke 390?', '2026-05-07 14:00:00'),
(31, 16, 'The price is slightly negotiable. Are you in Delhi?', '2026-05-07 14:20:00')
ON CONFLICT DO NOTHING;

-- Inserting data into review
INSERT INTO review (review_id, buyer_id, seller_id, rating, review_comment, review_date) VALUES
(15, 15, 13, 5, 'Great seller, provided all details clearly.', '2026-05-05')
ON CONFLICT DO NOTHING;

-- Inserting data into notifications
INSERT INTO notifications (notification_id, user_id, type, timestamp) VALUES
(13, 26, 'message', '2026-05-04 10:00:00'),
(14, 28, 'message', '2026-05-07 14:00:00')
ON CONFLICT DO NOTHING;

-- Inserting data into contact
INSERT INTO contact (contact_id, user_id, phone_number) VALUES
(11, 26, '9876543220'),
(12, 27, '9876543221'),
(13, 28, '9876543222'),
(14, 29, '9876543223'),
(15, 30, '9876543224')
ON CONFLICT DO NOTHING;
