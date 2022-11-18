CREATE TABLE user_account(
    email VARCHAR(100) NOT NULL,
    hashed_password VARCHAR(60) NOT NULL,
    salt VARCHAR(29) NOT NULL,
    PRIMARY KEY (email)
);
CREATE TABLE user(
    uid BIGINT NOT NULL AUTO_INCREMENT,
    type ENUM("Delivery Person", "Restaurant", "Customer") NOT NULL,
    email VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(10) NOT NULL,
    PRIMARY KEY (uid, email),
    FOREIGN KEY (email) REFERENCES user_account(email) ON DELETE CASCADE ON UPDATE CASCADE
);
ALTER TABLE user
ADD CONSTRAINT user_email_unique UNIQUE (email);
CREATE TABLE address_detail(
    sub_district VARCHAR(100) NOT NULL,
    district VARCHAR(100) NOT NULL,
    province VARCHAR(100) NOT NULL,
    postal_code VARCHAR(5) NOT NULL,
    PRIMARY KEY (sub_district, district, province)
);
CREATE TABLE `address`(
    address_id BIGINT NOT NULL AUTO_INCREMENT,
    house_number VARCHAR(16) NOT NULL,
    building_name VARCHAR(100),
    street VARCHAR(100) NOT NULL,
    sub_district VARCHAR(100) NOT NULL,
    district VARCHAR(100) NOT NULL,
    province VARCHAR(100) NOT NULL,
    PRIMARY KEY (address_id),
    FOREIGN KEY (sub_district,district,province) REFERENCES address_detail(sub_district,district, province)
);
CREATE TABLE area(
    area_id BIGINT NOT NULL,
    sub_district VARCHAR(100) NOT NULL,
    district VARCHAR(100) NOT NULL,
    province VARCHAR(100) NOT NULL,
    PRIMARY KEY (sub_district, district, province),
    FOREIGN KEY (sub_district,district,province) REFERENCES address_detail(sub_district,district, province)
);
CREATE INDEX area_id_index ON area(area_id);
CREATE TABLE restaurant(
    uid BIGINT NOT NULL,
    address_id BIGINT NOT NULL,
    PRIMARY KEY (uid),
    FOREIGN KEY (uid) REFERENCES user(uid),
    FOREIGN KEY (address_id) REFERENCES address(address_id)
);
CREATE TABLE delivery_person(
    uid BIGINT NOT NULL,
    driver_license VARCHAR(5) NOT NULL,
    status ENUM(
        "not accepting",
        "waiting for restaurant",
        "delivery"
    ) NOT NULL,
    area_id BIGINT NOT NULL,
    PRIMARY KEY (uid),
    FOREIGN KEY (uid) REFERENCES user(uid),
    FOREIGN KEY (area_id) REFERENCES area(area_id)
);
CREATE TABLE customer(
    uid BIGINT NOT NULL,
    address_id BIGINT NOT NULL,
    PRIMARY KEY (uid),
    FOREIGN KEY (uid) REFERENCES user(uid),
    FOREIGN KEY (address_id) REFERENCES `address`(address_id)
);
CREATE TABLE `order`(
    order_id BIGINT NOT NULL,
    status ENUM(
        'pending',
        'accepted',
        'rejected',
        'preparing',
        'completed'
    ) NOT NULL,
    grand_total DECIMAL NOT NULL,
    PRIMARY KEY (order_id)
);
CREATE TABLE place_order(
    order_id BIGINT NOT NULL,
    customer_id BIGINT NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    PRIMARY KEY (order_id),
    FOREIGN KEY (order_id) REFERENCES `order`(order_id)
);
CREATE TABLE menu(
    menu_id BIGINT NOT NULL,
    restaurant_id BIGINT NOT NULL,
    title VARCHAR(100) NOT NULL,
    description VARCHAR(1000) NOT NULL,
    price DECIMAL NOT NULL,
    status BOOLEAN NOT NULL,
    PRIMARY KEY (menu_id, restaurant_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurant(uid)
);
CREATE TABLE restaurant_order(
    rest_order_id BIGINT NOT NULL,
    order_id BIGINT NOT NULL,
    menu_id BIGINT NOT NULL,
    total_price DECIMAL NOT NULL,
    PRIMARY KEY (rest_order_id),
    FOREIGN KEY (order_id) REFERENCES `order`(order_id),
    FOREIGN KEY (menu_id) REFERENCES menu(menu_id)
);
CREATE TABLE restaurant_order_menu(
    rest_order_id BIGINT NOT NULL,
    menu_id BIGINT NOT NULL,
    quantity BIGINT NOT NULL,
    PRIMARY KEY (rest_order_id),
    FOREIGN KEY (rest_order_id) REFERENCES restaurant_order(rest_order_id),
    FOREIGN KEY (menu_id) REFERENCES menu(menu_id)
);
CREATE TABLE delivery_order(
    delivery_person_id BIGINT NOT NULL,
    order_id BIGINT NOT NULL,
    PRIMARY KEY (delivery_person_id, order_id),
    FOREIGN KEY (delivery_person_id) REFERENCES delivery_person(uid),
    FOREIGN KEY (order_id) REFERENCES `order`(order_id)
);
CREATE TABLE `transaction`(
    transaction_id BIGINT NOT NULL,
    order_id BIGINT NOT NULL,
    price DECIMAL NOT NULL,
    status BOOLEAN NOT NULL,
    profit DECIMAL NOT NULL,
    PRIMARY KEY (transaction_id),
    FOREIGN KEY (order_id) REFERENCES `order`(order_id)
);
CREATE TABLE payment_card(
    card_number VARCHAR(16) NOT NULL,
    expiry_month TINYINT NOT NULL,
    expiry_year INT NOT NULL,
    cvv INT NOT NULL,
    customer_id BIGINT NOT NULL,
    PRIMARY KEY (card_number),
    FOREIGN KEY (customer_id) REFERENCES customer(uid)
);
CREATE TABLE payment_record(
    transaction_id BIGINT NOT NULL,
    card_number VARCHAR(16) NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    PRIMARY KEY (transaction_id),
    FOREIGN KEY (transaction_id) REFERENCES `transaction`(transaction_id),
    FOREIGN KEY (card_number) REFERENCES payment_card(card_number)
);
CREATE TABLE chat(
    chat_id BIGINT NOT NULL,
    order_id BIGINT NOT NULL,
    PRIMARY KEY (chat_id),
    FOREIGN KEY (order_id) REFERENCES `order`(order_id)
);
CREATE TABLE chat_messages(
    chat_id BIGINT NOT NULL,
    message_id BIGINT NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    message VARCHAR(10000) NOT NULL,
    PRIMARY KEY (chat_id, message_id),
    FOREIGN KEY (chat_id) REFERENCES chat(chat_id)
);