CREATE DATABASE SalesDB;
USE SalesDB;
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL
);
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);
CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    sale_date DATE NOT NULL,
    customer_id INT,
    product_id INT,
    quantity INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO customers (customer_name) VALUES
('Alice'),
('Bob'),
('Charlie'),
('David'),
('Emma');
INSERT INTO products (product_name, price) VALUES
('Laptop', 60000),
('Mobile', 20000),
('Headphones', 3000),
('Keyboard', 1500),
('Mouse', 800);
INSERT INTO sales (sale_date, customer_id, product_id, quantity, total_amount) VALUES
('2025-09-01', 1, 1, 1, 60000),
('2025-09-01', 2, 2, 2, 40000),
('2025-09-02', 3, 3, 3, 9000),
('2025-09-02', 4, 4, 2, 3000),
('2025-09-03', 5, 5, 5, 4000),
('2025-09-03', 1, 2, 1, 20000),
('2025-09-04', 2, 1, 1, 60000),
('2025-09-04', 3, 5, 2, 1600);
SELECT 
    sale_date,
    SUM(total_amount) AS daily_total
FROM sales
GROUP BY sale_date
ORDER BY sale_date;
SELECT 
    sale_date,
    ROUND(AVG(total_amount),2) AS avg_transaction
FROM sales
GROUP BY sale_date
ORDER BY sale_date;
SELECT 
    p.product_name,
    SUM(s.quantity) AS total_quantity_sold,
    SUM(s.total_amount) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 5;
