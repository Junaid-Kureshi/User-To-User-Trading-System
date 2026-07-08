-- ================================================================
-- OLX-STYLE USER-TO-USER MARKETPLACE — GUJARAT, INDIA
-- FILE: 04_queries.sql
-- PURPOSE: Detailed query scenarios (Basic, Intermediate, Advanced, Complex, Admin, Edge)
-- ================================================================


-- ==========================================
-- 1. BASIC QUERIES
-- ==========================================

-- List all active products
SELECT product_id, pname, price, condition, date_of_listing 
FROM products 
WHERE status = 'Available';

-- Find products by category
SELECT p.pname, p.price, c.category_name 
FROM products p
JOIN categories c ON p.category_id = c.category_id
WHERE c.category_name = 'Mobiles' AND p.status = 'Available';

-- Find products under price X
SELECT pname, brand, price, condition 
FROM products 
WHERE price < 20000 AND status = 'Available'
ORDER BY price ASC;

-- Get seller details via seller_id
SELECT u.name, u.email, s.seller_rating, c.phone
FROM sellers s
JOIN users u ON s.user_id = u.user_id
LEFT JOIN contacts c ON u.user_id = c.user_id
WHERE s.seller_id = 1;


-- ==========================================
-- 2. INTERMEDIATE QUERIES
-- ==========================================

-- Products in a specific city
SELECT p.pname, p.price, loc.city, loc.state, u.name AS seller_name
FROM products p
JOIN addresses a ON p.address_id = a.address_id
JOIN pincode_locations loc ON a.pin = loc.pin
JOIN sellers s ON p.seller_id = s.seller_id
JOIN users u ON s.user_id = u.user_id
WHERE loc.city = 'Ahmedabad' AND p.status = 'Available';

-- Products with highest rating sellers
SELECT p.pname, p.price, s.seller_rating, p.condition
FROM products p
JOIN sellers s ON p.seller_id = s.seller_id
WHERE s.seller_rating >= 4.0 AND p.status = 'Available'
ORDER BY s.seller_rating DESC;

-- Products added in last 7 days
SELECT pname, price, date_of_listing, status
FROM products
WHERE date_of_listing >= CURRENT_DATE - INTERVAL '7 days'
ORDER BY date_of_listing DESC;

-- Wishlist items of a user
SELECT u.name AS buyer_name, w.wishlist_name, p.pname, p.price, p.status
FROM users u
JOIN wishlists w ON u.user_id = w.user_id
JOIN wishlist_items wi ON w.wishlist_id = wi.wishlist_id
JOIN products p ON wi.product_id = p.product_id
WHERE u.user_id = 5;

-- Seller average rating from actual reviews table
SELECT s.seller_id, u.name AS seller_name, ROUND(AVG(r.rating), 2) AS average_rating, COUNT(r.review_id) AS total_reviews
FROM sellers s
JOIN users u ON s.user_id = u.user_id
LEFT JOIN reviews r ON s.seller_id = r.seller_id
GROUP BY s.seller_id, u.name;


-- ==========================================
-- 3. ADVANCED QUERIES
-- ==========================================

-- Top 5 most active sellers (by number of products)
SELECT s.seller_id, u.name, COUNT(p.product_id) AS active_listings
FROM sellers s
JOIN users u ON s.user_id = u.user_id
JOIN products p ON s.seller_id = p.seller_id
WHERE p.status = 'Available'
GROUP BY s.seller_id, u.name
ORDER BY active_listings DESC
LIMIT 5;

-- Most popular products (based on wishlist aditions)
SELECT p.product_id, p.pname, p.price, COUNT(wi.wishlist_id) AS total_wishlist_adds
FROM products p
JOIN wishlist_items wi ON p.product_id = wi.product_id
GROUP BY p.product_id, p.pname, p.price
ORDER BY total_wishlist_adds DESC
LIMIT 10;

-- Buyers who contacted multiple sellers
SELECT b.buyer_id, u.name, COUNT(DISTINCT c.seller_id) AS unique_sellers_contacted
FROM buyers b
JOIN users u ON b.user_id = u.user_id
JOIN conversations c ON b.buyer_id = c.buyer_id
GROUP BY b.buyer_id, u.name
HAVING COUNT(DISTINCT c.seller_id) >= 2;

-- Sellers with low ratings (< 2.5)
SELECT s.seller_id, u.name AS seller_name, s.seller_rating, COUNT(p.product_id) AS num_active_products
FROM sellers s
JOIN users u ON s.user_id = u.user_id
LEFT JOIN products p ON s.seller_id = p.seller_id AND p.status = 'Available'
WHERE s.seller_rating < 2.5
GROUP BY s.seller_id, u.name, s.seller_rating;

-- Products with no messages (Unsold and likely ignored)
SELECT p.product_id, p.pname, p.price, u.name AS seller_name
FROM products p
JOIN sellers s ON p.seller_id = s.seller_id
JOIN users u ON s.user_id = u.user_id
LEFT JOIN wishlist_items wi ON p.product_id = wi.product_id
WHERE wi.wishlist_id IS NULL AND p.status = 'Available';


-- ==========================================
-- 4. COMPLEX JOINS & ANALYTICS
-- ==========================================

-- Rank sellers using window functions (by estimated revenue if all 'Sold' items were sold at listed price)
WITH SellerRevenue AS (
    SELECT s.seller_id, u.name, SUM(p.price) AS total_sold_value
    FROM sellers s
    JOIN users u ON s.user_id = u.user_id
    JOIN products p ON s.seller_id = p.seller_id
    WHERE p.status = 'Sold'
    GROUP BY s.seller_id, u.name
)
SELECT seller_id, name, coalesce(total_sold_value, 0) AS revenue,
       RANK() OVER (ORDER BY coalesCE(total_sold_value,0) DESC) AS revenue_rank,
       DENSE_RANK() OVER (ORDER BY coalesCE(total_sold_value,0) DESC) AS dense_revenue_rank
FROM SellerRevenue;

-- Compare prices of same category products across sellers
SELECT p.pname, p.price, c.category_name, u.name AS seller_name,
       ROUND(AVG(p.price) OVER (PARTITION BY c.category_id), 2) AS category_avg_price,
       p.price - ROUND(AVG(p.price) OVER (PARTITION BY c.category_id), 2) AS price_diff_from_avg
FROM products p
JOIN categories c ON p.category_id = c.category_id
JOIN sellers s ON p.seller_id = s.seller_id
JOIN users u ON s.user_id = u.user_id
WHERE p.status = 'Available';

-- Detect fake sellers (High activity but extremely low credibility)
SELECT s.seller_id, u.name, s.seller_rating, COUNT(p.product_id) AS total_listed
FROM sellers s
JOIN users u ON s.user_id = u.user_id
JOIN products p ON s.seller_id = p.seller_id
GROUP BY s.seller_id, u.name, s.seller_rating
HAVING COUNT(p.product_id) > 5 AND s.seller_rating < 2.0;

-- Conversation analytics (Avg messages per conversation)
SELECT c.conversation_id, u_buyer.name AS buyer, u_seller.name AS seller, COUNT(m.message_id) AS message_count
FROM conversations c
JOIN buyers b ON c.buyer_id = b.buyer_id
JOIN users u_buyer ON b.user_id = u_buyer.user_id
JOIN sellers s ON c.seller_id = s.seller_id
JOIN users u_seller ON s.user_id = u_seller.user_id
LEFT JOIN messages m ON c.conversation_id = m.conversation_id
GROUP BY c.conversation_id, u_buyer.name, u_seller.name
ORDER BY message_count DESC;

-- City-wise product distribution (Count and total value)
SELECT loc.city, count(p.product_id) AS total_products, COALESCE(SUM(p.price), 0) AS total_value
FROM pincode_locations loc
LEFT JOIN addresses a ON loc.pin = a.pin
LEFT JOIN products p ON a.address_id = p.address_id AND p.status = 'Available'
GROUP BY loc.city
ORDER BY total_products DESC;


-- ==========================================
-- 5. ADMIN REPORTS
-- ==========================================

-- Seller ranking report (combined view of sold vs active)
SELECT s.seller_id, u.name AS seller_name, s.seller_rating, 
       SUM(CASE WHEN p.status = 'Sold' THEN 1 ELSE 0 END) AS items_sold,
       SUM(CASE WHEN p.status = 'Available' THEN 1 ELSE 0 END) AS active_listings
FROM sellers s
JOIN users u ON s.user_id = u.user_id
LEFT JOIN products p ON s.seller_id = p.seller_id
GROUP BY s.seller_id, u.name, s.seller_rating
ORDER BY items_sold DESC, s.seller_rating DESC;

-- Customer feedback summary (reviews grouped by rating bracket)
SELECT 
    CASE 
        WHEN rating >= 4.5 THEN 'Excellent (4.5 - 5.0)'
        WHEN rating >= 3.5 THEN 'Good (3.5 - 4.4)'
        WHEN rating >= 2.5 THEN 'Average (2.5 - 3.4)'
        ELSE 'Poor (below 2.5)'
    END AS rating_bracket,
    COUNT(review_id) AS total_reviews
FROM reviews
GROUP BY 
    CASE 
        WHEN rating >= 4.5 THEN 'Excellent (4.5 - 5.0)'
        WHEN rating >= 3.5 THEN 'Good (3.5 - 4.4)'
        WHEN rating >= 2.5 THEN 'Average (2.5 - 3.4)'
        ELSE 'Poor (below 2.5)'
    END
ORDER BY total_reviews DESC;

-- Total listings per category 
SELECT c.category_name, COUNT(p.product_id) AS total_listed
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id
WHERE c.parent_id IS NOT NULL -- ignoring broad parents for granular counting
GROUP BY c.category_name
ORDER BY total_listed DESC;


-- ==========================================
-- 6. EDGE / INTERVIEW QUERIES
-- ==========================================

-- Find second highest priced product per category
WITH RankedProducts AS (
    SELECT p.product_id, p.pname, p.price, c.category_name,
           DENSE_RANK() OVER (PARTITION BY p.category_id ORDER BY p.price DESC) AS price_rank
    FROM products p
    JOIN categories c ON p.category_id = c.category_id
    WHERE p.status = 'Available'
)
SELECT category_name, pname, price 
FROM RankedProducts 
WHERE price_rank = 2;

-- Find users with absolutely no activity (Ghost users)
SELECT u.user_id, u.name, u.email
FROM users u
LEFT JOIN wishlists w ON u.user_id = w.user_id
LEFT JOIN buyers b ON u.user_id = b.user_id
LEFT JOIN conversations c ON b.buyer_id = c.buyer_id OR u.user_id = c.seller_id
LEFT JOIN sellers s ON u.user_id = s.user_id
LEFT JOIN products p ON s.seller_id = p.seller_id
WHERE w.wishlist_id IS NULL 
  AND c.conversation_id IS NULL 
  AND p.product_id IS NULL
  AND u.role = 'User';

-- Find products never wishlisted
SELECT p.product_id, p.pname, p.price
FROM products p
LEFT JOIN wishlist_items wi ON p.product_id = wi.product_id
WHERE wi.wishlist_id IS NULL;

-- Find buyers who have completed a conversation but never left a review
SELECT DISTINCT b.buyer_id, u.name
FROM buyers b
JOIN users u ON b.user_id = u.user_id
JOIN conversations c ON b.buyer_id = c.buyer_id
LEFT JOIN reviews r ON b.buyer_id = r.buyer_id
WHERE r.review_id IS NULL;

-- Detect completely inactive sellers
SELECT s.seller_id, u.name
FROM sellers s
JOIN users u ON s.user_id = u.user_id
LEFT JOIN products p ON s.seller_id = p.seller_id
WHERE p.product_id IS NULL;
