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
--Total Quantity per Customer
SELECT c.customer_name,
       SUM(oi.quantity) AS total_quantity
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_name;
--- Most Expensive Product Ordered
SELECT p.product_name,
       p.price
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
ORDER BY p.price DESC
LIMIT 1;
----Orders with Total Order Value
SELECT o.order_id,
       c.customer_name,
       SUM(oi.quantity * p.price) AS total_order_value
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY o.order_id, c.customer_name;
----Top 3 Customers by Order Value
SELECT c.customer_name,
       SUM(oi.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 3;
-----Products Never Ordered
SELECT p.product_name
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;
---city wise order count
SELECT c.city,count(*) as order_
from customers c join orders o
on o.customer_id=c.customer_id
group by c.city
order by order_ Desc;
---Average Order Value per Customer
SELECT c.customer_name,round(sum(oi.quantity*price)/count(distinct o.order_id) ,2) as avg_order_value from 
customers c join orders o
on c.customer_id = o.customer_id
join order_items oi
on o.order_id =oi.order_id
join products p
on p.product_id = oi.product_id
group by c.customer_id;
----Best-selling Product
SELECT p.product_name ,sum(oi.quantity) as total_quantity from 
order_items oi join products p  
on p.product_id = oi.product_id
group by p.product_name
order by total_quantity Desc
limit 1;


