-- Create address for restaurant
INSERT INTO address_detail (sub_district, district, province, postal_code)
VALUES ("Wang Mai", "Pathum Wan", "Bangkok", "10330");
INSERT INTO address (house_number, street, sub_district, district, province) VALUES ("254", "Phaya Thai Rd", "Wang Mai", "Pathum Wan", "Bangkok");
-- Create user account
INSERT INTO user_account (email, hashed_password, salt) VALUES ("restaurant@test.com", "$2b$12$wm2ODX7KXvZebjBgV.aSIOEPcW1qE66VErZkLKV7uuVthuN5QweMy", "$2b$12$wm2ODX7KXvZebjBgV.aSIO");
INSERT INTO user (type, email, name, phone_number) VALUES ("Restaurant", "restaurant@test.com", "Chula Restaurant", "0899999999");
INSERT INTO restaurant (uid, address_id) VALUES (1,1);
-- Insert sample menu for restaurant
INSERT INTO menu (menu_id, restaurant_id, title, description, price, status) VALUES (1, 1, "Soup", "best soup ever", 100, 1);
INSERT INTO menu (menu_id, restaurant_id, title, description, price, status) VALUES (2, 1, "Rice", "best rice ever", 20, 1);
INSERT INTO menu (menu_id, restaurant_id, title, description, price, status) VALUES (3, 1, "Coffee", "wakes u up", 70, 1);
INSERT INTO menu (menu_id, restaurant_id, title, description, price, status) VALUES (4, 1, "Water", "best water ever (not really)", 65, 1);
-- Search for menu price range
SELECT * FROM menu WHERE restaurant_id=1;
SELECT * FROM menu WHERE restaurant_id=1 AND price BETWEEN 50 AND 70;