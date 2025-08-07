create database Sales_per_db;
use sales_per_db;
create Table customers(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(30),
city VARCHAR(20)
)

CREATE TABLE order_items(
item_id INT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT,
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES products(product_id));

CREATE TABLE `orders` (
  `order_id` INT NOT NULL,
  `order_date` DATE DEFAULT NULL,
  `customer_id` INT DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  FOREIGN KEY (`customer_id`) REFERENCES customers(`customer_id`)
);

INSERT INTO customers (customer_id, customer_name, city) VALUES
(4, 'Sneha', 'Trichy'),
(6, 'Meena', 'Chennai'),
(7, 'Vikram', 'Erode'),
(8, 'Priya', 'Madurai'),
(9, 'Surya', 'Tirunelveli'),
(10, 'Anjali', 'Coimbatore');


INSERT INTO products (product_id, product_name, category, price) VALUES
(101, 'Pen', 'Stationery', 10),
(102, 'Pencil', 'Stationery', 5),
(104, 'Bag', 'Accessories', 800),
(105, 'Mouse', 'Electronics', 700),
(106, 'Tablet', 'Electronics', 18000),
(107, 'Notebook', 'Stationery', 120),
(108, 'Monitor', 'Electronics', 10000),
(109, 'Charger', 'Electronics', 1500),
(110, 'Marker', 'Stationery', 50);


INSERT INTO orders (order_id, order_date, customer_id) VALUES
(1006, '2025-08-04', 4),  
(1007, '2025-08-04', 6),  
(1008, '2025-08-05', 7),  
(1009, '2025-08-05', 8),  
(1010, '2025-08-06', 9);  

INSERT INTO order_items (item_id, order_id, product_id, quantity) VALUES
(8, 1006, 106, 1),    
(9, 1006, 107, 4),    
(10, 1007, 108, 2),   
(11, 1008, 109, 3),   
(12, 1008, 105, 10),  
(13, 1009, 110, 5),   
(14, 1010, 101, 1),   
(15, 1010, 102, 1),   
(16, 1010, 104, 1);   

