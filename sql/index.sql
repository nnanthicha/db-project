SELECT * FROM menu WHERE restaurant_id = 3 AND price BETWEEN 50 and 70;
CREATE INDEX menu_price_idx ON menu (price) USING BTREE;