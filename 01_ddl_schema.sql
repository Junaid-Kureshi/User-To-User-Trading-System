-- DDL Script based on provided schema

-- User Table (Quoted as "User" to prevent reserved keyword conflicts)
CREATE TABLE "User" (
    user_id BIGINT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    user_type VARCHAR(50),
    reg_date DATE DEFAULT CURRENT_DATE,
    img_url TEXT,
    role VARCHAR(50),
    password VARCHAR(255) NOT NULL
);

-- Buyer Table
CREATE TABLE Buyer (
    buyer_id BIGINT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES "User"(user_id) ON DELETE CASCADE
);

-- Seller Table
CREATE TABLE Seller (
    seller_id BIGINT PRIMARY KEY,
    seller_rating DECIMAL(3, 2),
    user_id BIGINT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES "User"(user_id) ON DELETE CASCADE
);

-- Admin Table
CREATE TABLE Admin (
    admin_id BIGINT PRIMARY KEY,
    role VARCHAR(50) NOT NULL,
    user_id BIGINT UNIQUE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES "User"(user_id) ON DELETE CASCADE
);

-- Contact Table
CREATE TABLE Contact (
    user_id BIGINT,
    phone VARCHAR(20),
    PRIMARY KEY (user_id, phone),
    FOREIGN KEY (user_id) REFERENCES "User"(user_id) ON DELETE CASCADE
);

-- Pincode_Locations Table
CREATE TABLE pincode_location (
    pin INT PRIMARY KEY,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL
);

-- Coordinate_Pincode Table
CREATE TABLE coordinate_pincode (
    longitude DECIMAL(10, 7),
    latitude DECIMAL(10, 7),
    pin INT NOT NULL,
    PRIMARY KEY (longitude, latitude),
    FOREIGN KEY (pin) REFERENCES pincode_location(pin) ON DELETE CASCADE
);

-- Address Table
CREATE TABLE address (
    address_id BIGINT PRIMARY KEY,
    label VARCHAR(50),
    address_line TEXT NOT NULL,
    longitude DECIMAL(10, 7) NOT NULL,
    latitude DECIMAL(10, 7) NOT NULL,
    is_primary BOOLEAN DEFAULT FALSE,
    user_id BIGINT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES "User"(user_id) ON DELETE CASCADE,
    FOREIGN KEY (longitude, latitude) REFERENCES coordinate_pincode(longitude, latitude) ON DELETE CASCADE
);

-- Categories Table (Fixed categorie_id to category_id for consistency)
CREATE TABLE Categories (
    category_id BIGINT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    parent_id BIGINT,
    FOREIGN KEY (parent_id) REFERENCES Categories(category_id)
);

-- Products Table
CREATE TABLE Products (
    product_id BIGINT PRIMARY KEY,
    pname VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    brand VARCHAR(100),
    model VARCHAR(100),
    condition VARCHAR(50) NOT NULL,
    status VARCHAR(50) NOT NULL,
    date_of_listing DATE DEFAULT CURRENT_DATE,
    address_id BIGINT NOT NULL,
    seller_id BIGINT NOT NULL,
    category_id BIGINT NOT NULL,
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (seller_id) REFERENCES Seller(seller_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Wishlist Table
CREATE TABLE Wishlist (
    wishlist_id BIGINT PRIMARY KEY,
    wishlist_name VARCHAR(100) NOT NULL,
    created_date DATE DEFAULT CURRENT_DATE,
    user_id BIGINT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES "User"(user_id) ON DELETE CASCADE
);

-- Contains Table (Wishlist Items)
CREATE TABLE Contains (
    product_id BIGINT,
    wishlist_id BIGINT,
    PRIMARY KEY (product_id, wishlist_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE CASCADE,
    FOREIGN KEY (wishlist_id) REFERENCES Wishlist(wishlist_id) ON DELETE CASCADE
);

-- Product Image Table
CREATE TABLE Product_Image (
    image_url TEXT,
    product_id BIGINT,
    is_primary BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (image_url, product_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE CASCADE
);

-- Review Table
CREATE TABLE Review (
    review_id BIGINT PRIMARY KEY,
    buyer_id BIGINT NOT NULL,
    seller_id BIGINT NOT NULL,
    review_comment TEXT,
    review_type VARCHAR(50) NOT NULL,
    review_date DATE DEFAULT CURRENT_DATE,
    rating DECIMAL(2, 1) CHECK (rating >= 1.0 AND rating <= 5.0),
    FOREIGN KEY (buyer_id) REFERENCES Buyer(buyer_id) ON DELETE CASCADE,
    FOREIGN KEY (seller_id) REFERENCES Seller(seller_id) ON DELETE CASCADE
);

-- Notifications Table
CREATE TABLE Notifications (
    notification_id BIGINT PRIMARY KEY,
    type VARCHAR(50),
    message TEXT NOT NULL,
    notification_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL,
    user_id BIGINT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES "User"(user_id) ON DELETE CASCADE
);

-- Conversations Table
CREATE TABLE Conversations (
    conversation_id BIGINT PRIMARY KEY,
    start_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status BOOL,
    seller_id BIGINT NOT NULL,
    buyer_id BIGINT NOT NULL,
    FOREIGN KEY (seller_id) REFERENCES Seller(seller_id) ON DELETE CASCADE,
    FOREIGN KEY (buyer_id) REFERENCES Buyer(buyer_id) ON DELETE CASCADE
);

-- Messages Table
CREATE TABLE Message (
    message_id BIGINT PRIMARY KEY,
    message_content TEXT NOT NULL,
    sent_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    conversation_id BIGINT NOT NULL,
    FOREIGN KEY (conversation_id) REFERENCES Conversations(conversation_id) ON DELETE CASCADE
);
