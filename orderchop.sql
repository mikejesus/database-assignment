CREATE DATABASE orderchop_db;
USE orderchop_db;

-- Products Table
CREATE TABLE IF NOT EXISTS product(
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(45),
product_description VARCHAR(45), 
product_image VARCHAR(45),
product_price VARCHAR(45), 
product_quantity VARCHAR(45), 
category_id INT,
FOREIGN KEY (category_id) REFERENCES categories(category_id));

CREATE TABLE IF NOT EXISTS categories(
category_id INT PRIMARY KEY AUTO_INCREMENT,
category_name VARCHAR(45), 
category_description VARCHAR(45)
);


CREATE TABLE IF NOT EXISTS users(
users_id INT PRIMARY KEY AUTO_INCREMENT, 
first_name VARCHAR(45),
middle_name VARCHAR(45), 
last_name VARCHAR(45),
email_address VARCHAR(45),
phone_number VARCHAR(45),
address VARCHAR(255),
order_id INT,
FOREIGN KEY (order_id) REFERENCES orders(order_id));

CREATE TABLE IF NOT EXISTS orders(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    shipping_id INT, 
    payment_id INT, 
    total_quantity INT, 
    total_amount FLOAT, 
    order_date DATETIME,
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (shipping_id) REFERENCES shipping(shipping_id),
FOREIGN KEY (payment_id) REFERENCES payments(shipping_id)
);

CREATE TABLE IF NOT EXISTS order_details(
order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
order_id INT, 
product_id INT,
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE IF NOT EXISTS payments(
payment_id INT PRIMARY KEY AUTO_INCREMENT,
card_holder_name VARCHAR(45),
card_type VARCHAR(45),
payment_date DATETIME);

CREATE TABLE IF NOT EXISTS shipping(
shipping_id INT PRIMARY KEY AUTO_INCREMENT, 
order_id INT,
payment_id INT, 
user_id INT,
shipper_name VARCHAR(45), 
shipper_phone VARCHAR(45),
shipping_address VARCHAR(255),
shipping_city VARCHAR(45), 
shipping_state VARCHAR(45),
shipping_country VARCHAR(45),
shipping_status VARCHAR(45),
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY(payment_id) REFERENCES payments(payment_id),
FOREIGN KEY (user_id) REFERENCES users(user_id)
);
