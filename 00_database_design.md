# OLX-Style User-to-User Marketplace - Database Design (Gujarat, India)

## 1. Scenario
**Context:** An online User-to-User trading platform (like OLX) localized for the active second-hand markets of Gujarat, India (focusing on cities like Ahmedabad, Surat, Vadodara, and Rajkot).
**System Behavior:** The application acts as an intermediary where guests can surf available products. Registered users can become buyers and sellers. Sellers list products (e.g., Mobiles, Bikes, Furniture) setting their condition, price, and category. Buyers can search via robust filters (price, location via PIN codes, category), add favorites to their Wishlist, and open direct Chat Conversations with sellers to negotiate. Finally, buyers leave Reviews impacting the sellers' reliability rating. Admins monitor platform safety, reviews, and transaction disputes.

---

## 2. Identify Application Users
1. **Guest / Surfer:** Unregistered users who can browse listings, view product details, and perform basic searches. They cannot chat, buy, or list products until they register.
2. **Buyer:** A registered user looking to purchase items. They maintain a wishlist, send messages to sellers, and write reviews post-transaction.
3. **Seller:** A registered user who lists products for sale. They manage their active listings, communicate with interested buyers, and accumulate a public rating based on their reliability.
4. **Admin:** Platform moderators who can view all user activities, trace product listings, ban fraudulent sellers, and pull analytical reports to ensure platform integrity.

---

## 3. Use Cases (CRUD & Tables)
### For Buyer
* **Search / Filter Product:** `READ` operation on `products`, `categories`, `addresses`, `pincode_locations` (to filter by Gujarat cities).
* **Add to Wishlist:** `WRITE` operation on `wishlists`, `wishlist_items`.
* **Start Conversation (Contact Seller):** `WRITE` operation on `conversations` (starts thread) and `messages` (first message).
* **Rate Seller:** `WRITE` operation on `reviews` and subsequently triggers a rating calculation to update the `sellers` table.

### For Seller
* **Add Product Listing:** `WRITE` operation on `products`, `product_images`, explicitly linking to an `addresses` record for location accuracy.
* **Reply to Buyer:** `WRITE` operation on `messages` table associated with an existing `conversations` ID.
* **Update Product Status (Sold/Available):** `WRITE/UPDATE` operation on `products`.

### For Admin
* **Monitor Chat Analytics:** `READ` operation on `conversations` and `messages` (to detect scam patterns).
* **Generate Top Seller Reports:** `READ` operation joining `sellers`, `products`, `users`, and `reviews`.
* **Ban User:** `UPDATE` operation setting `status` on `users` table or issuing `notifications`.

---

## 4. Entity Extraction & Relationships
**Users:**
* **Attributes:** `user_id` (PK), `name`, `email`, `role`, `password`, `reg_date`, `img_url`.
* **Relationships:** 1:1 with `buyers`, `sellers`, `admins` (ISA representation), 1:N with `contacts`, `addresses`, `notifications`.

**Buyers & Sellers:**
* **Attributes:** `buyer_id` / `seller_id` (PK), `user_id` (FK, Unique). `sellers` has `seller_rating`.
* **Relationships:** 1:N with `conversations`, `reviews`, `products` (Sellers only).

**Products:**
* **Attributes:** `product_id` (PK), `pname`, `description`, `price`, `brand`, `model`, `condition`, `status`, `seller_id` (FK), `category_id` (FK), `address_id` (FK).
* **Relationships:** 1:N with `product_images`, M:N with `wishlists` (via `wishlist_items`).

**Categories:**
* **Attributes:** `category_id` (PK), `category_name`, `parent_id` (FK - self-referencing).
* **Relationships:** 1:N with `products`, 1:N with itself (hierarchical tree).

**Locations (Address & Pincode):**
* **Attributes (Address):** `address_id` (PK), `address_line`, `longitude`, `latitude`, `user_id`, `pin` (FK). 
* **Attributes (Pincode):** `pin` (PK), `city`, `state`.
* **Relationships:** M:1 from `addresses` to `pincode_locations`.

**Conversations & Messages:**
* **Attributes (Conversations):** `conversation_id` (PK), `buyer_id` (FK), `seller_id` (FK), `start_date`.
* **Attributes (Messages):** `message_id` (PK), `conversation_id` (FK), `message_content`, `sent_timestamp`.
* **Relationships:** 1:N between `conversations` and `messages`.

**Reviews:**
* **Attributes:** `review_id` (PK), `buyer_id` (FK), `seller_id` (FK), `rating`, `review_comment`.
* **Relationships:** M:1 to `buyers`, M:1 to `sellers`.

---

## 5. Reports & Decision Data
* **Seller Performance Ranking:** Identifies the most reliable sellers using Window functions over sales counts and average ratings. Useful to award "Verified" badges to trustworthy sellers.
* **Product Popularity (Wishlist density):** Analyzes which items/categories carry the highest demand but remain unsold (pricing mismatch). Useful for targeted notifications.
* **City-Wise Analytics (Gujarat Focus):** Aggregates listings and sale volume per PIN/City (e.g., Surat vs. Ahmedabad). Useful for directing regional marketing campaigns.
* **Customer Feedback Trends:** Summarizes rating distributions (Excellent vs. Poor). Identifies if overall platform satisfaction is trending upward or downward.
* **Fraud / Fake Seller Detection:** Targets sellers with a high volume of active listings but ratings under 2.0. Crucial for admin intervention and maintaining trust.
