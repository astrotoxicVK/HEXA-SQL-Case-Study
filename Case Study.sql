-- Customers Table

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255)
);

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(255),
    price DECIMAL(10, 2),
    description TEXT,
    stockQuantity INT
);

-- Cart Table
CREATE TABLE cart (
    cart_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
ALTER TABLE order_items DROP FOREIGN KEY order_items_ibfk_1;
DROP TABLE IF EXISTS orders;

-- Orders Table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_price DECIMAL(10, 2),
    shipping_address TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
ALTER TABLE order_items DROP FOREIGN KEY order_items_ibfk_1;
DROP TABLE IF EXISTS order_items;
-- Order Items Table
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
----------------------------- -----------------------------

INSERT INTO customers (customer_id, name, email, password) VALUES
(1, 'Alice', 'alice2@gmail.com', 'alice123'),
(2, 'Mark', 'mark3@gmail.com', 'mark44'),
(3, 'Rock', 'rock6@gmail.com', 'rock44'),
(4, 'Allen', 'allen3@gmail.com', 'allen44'),
(5, 'Julie', 'julie3@gmail.com', 'julie44');
SELECT * FROM ecomm.customers;

INSERT INTO products ( product_id, name, price, description, stockquantity) VALUES
(11, 'Toothpaste', '100', 'New and improved','40'),
(22, 'Oil', '50','Refined and tested', '34'),
(33, 'Brush', '10','Refined and tested', '45'),
(44, 'Cream', '530','Refined and tested', '65'),
(55, 'Soap', '80','Refined and tested', '90');
SELECT * FROM ecomm.products;


INSERT INTO cart (cart_ID, customer_id, product_id, quantity) VALUES
(101, '1', '11', '10'),
(201, '2', '22', '34'),
(301, '3', '33', '44'),
(401, '4', '44', '54'),
(501, '5', '55', '64');
SELECT * FROM ecomm.cart;


INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES
(41, '10', '11', '10'),
(42, '20', '22', '34'),
(43, '30', '33', '12'),
(44, '40', '44', '16'),
(45, '50', '55', '19');
SELECT * FROM ecommerce.order_items;

INSERT INTO orders (order_ID, customer_id, order_date, total_price, shipping_address) VALUES
(10, '1', '2024-1-19', '4000', '51avenue, Las Vegas'),
(20, '2', '2024-2-22','3400', '10th Streer, London'),
(30, '3', '2024-2-19', '3240', 'Lal Chowk, Srinagar'),
(40, '4', '2024-1-09', '5990', 'DC ground, Pune'),
(50, '5', '2024-2-14', '6000', 'Byculla, Mumbai');
SELECT * FROM ecomm.orders;

