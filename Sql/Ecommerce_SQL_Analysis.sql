/* RENAME TALBES
RENAME TABLE
customers_clean TO customers,
orders_clean TO orders,
order_items_clean TO order_items,
products_clean TO products,
reviews_clean TO reviews; */

-- SHOW TABLES
SHOW TABLES;

-- Dataset Verification
SELECT * FROM customers LIMIT 5;
SELECT * FROM products LIMIT 5;
SELECT * FROM orders LIMIT 5;
SELECT * FROM order_items LIMIT 5;
SELECT * FROM reviews LIMIT 5;

-- Check row counts:
SELECT COUNT(*) AS customers_rows FROM customers;
SELECT COUNT(*) AS orders_rows FROM orders;
SELECT COUNT(*) AS order_items_rows FROM order_items;
SELECT COUNT(*) AS products_rows FROM products;
SELECT COUNT(*) AS reviews_rows FROM reviews;


-- KPI Analysis
-- Registered Customers
SELECT COUNT(DISTINCT customer_id) AS registered_customers
FROM customers;

-- Ordering Customers
SELECT COUNT(DISTINCT customer_id) AS ordering_customers
FROM orders;

-- Total Orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM orders;

-- Delivered Orders
SELECT COUNT(DISTINCT order_id) AS delivered_orders
FROM orders
WHERE order_status = 'delivered';

-- Delivered Revenue
SELECT SUM(total_amount_idr) AS delivered_revenue
FROM orders
WHERE order_status = 'delivered';

-- Average Order Value
SELECT ROUND(AVG(total_amount_idr), 2) AS average_order_value
FROM orders
WHERE order_status = 'delivered';

-- Total Units Sold
SELECT SUM(oi.quantity) AS total_units_sold
FROM order_items oi
JOIN orders o
ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered';

-- Average Items Per Order
SELECT
ROUND(
    SUM(oi.quantity) / COUNT(DISTINCT o.order_id),
    2
) AS avg_items_per_order
FROM order_items oi
JOIN orders o
ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered';

-- Total Discount
SELECT SUM(discount_amount_idr) AS total_discount
FROM orders;

-- Cancellation Rate
SELECT
ROUND(
    SUM(CASE WHEN order_status = 'cancelled' THEN 1 ELSE 0 END)
    / COUNT(*) * 100,
    2
) AS cancellation_rate
FROM orders;

-- Return Rate
SELECT
ROUND(
    SUM(CASE WHEN order_status = 'returned' THEN 1 ELSE 0 END)
    / COUNT(*) * 100,
    2
) AS return_rate
FROM orders;

-- Average Rating
SELECT ROUND(AVG(rating), 2) AS average_rating
FROM reviews;


-- Customer analysis
-- Orders Per Customer
SELECT
customer_id,
COUNT(DISTINCT order_id) AS order_count
FROM orders
WHERE order_status = 'delivered'
GROUP BY customer_id
ORDER BY order_count DESC;

-- Top 10 Customers by Spending
SELECT
c.customer_id,
c.name,
COUNT(DISTINCT o.order_id) AS total_orders,
SUM(o.total_amount_idr) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC
LIMIT 10;

-- Revenue by Age Group
SELECT
c.age_group,
SUM(o.total_amount_idr) AS revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_status = 'delivered'
GROUP BY c.age_group
ORDER BY revenue DESC;

-- Revenue by Gender
SELECT
c.gender,
SUM(o.total_amount_idr) AS revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_status = 'delivered'
GROUP BY c.gender
ORDER BY revenue DESC;


-- Product + Category Analysis
-- Revenue by category:
SELECT
    p.category,
    SUM(oi.subtotal_idr) AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY p.category
ORDER BY revenue DESC;

-- top 10 products
SELECT
    p.name,
    SUM(oi.subtotal_idr) AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY p.product_id, p.name
ORDER BY revenue DESC
LIMIT 10;

-- total units sold
SELECT SUM(oi.quantity) AS total_units_sold
FROM order_items oi
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered';


-- monthly trend sales
-- 5. Monthly Trend Analysis
SELECT
    LEFT(order_date, 7) AS month_period,
    SUM(total_amount_idr) AS revenue
FROM orders
WHERE order_status = 'delivered'
GROUP BY LEFT(order_date, 7)
ORDER BY month_period;

-- Monthly orders:
SELECT
    LEFT(order_date, 7) AS month_period,
    COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY LEFT(order_date, 7)
ORDER BY month_period;


-- Geographic Analysis
-- revenue by province
SELECT
    shipping_province,
    SUM(total_amount_idr) AS revenue
FROM orders
WHERE order_status = 'delivered'
GROUP BY shipping_province
ORDER BY revenue DESC;

-- top cities by order
SELECT
    shipping_city,
    COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY shipping_city
ORDER BY total_orders DESC
LIMIT 10;


-- payment analysis
SELECT
    payment_method,
    COUNT(*) AS total_orders
FROM orders
GROUP BY payment_method
ORDER BY total_orders DESC;


-- Courier + Operations Analysis
-- orders by courier
SELECT
    courier,
    COUNT(*) AS total_orders
FROM orders
GROUP BY courier
ORDER BY total_orders DESC;


-- Cancellation rate by courier:
SELECT
    courier,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN order_status = 'cancelled' THEN 1 ELSE 0 END)
        AS cancelled_orders,
    ROUND(
        100.0 *
        SUM(CASE WHEN order_status = 'cancelled' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS cancellation_rate
FROM orders
GROUP BY courier
ORDER BY cancellation_rate DESC;


-- Average shipping cost by courier:
SELECT
    courier,
    ROUND(AVG(shipping_cost_idr), 2) AS avg_shipping_cost
FROM orders
GROUP BY courier
ORDER BY avg_shipping_cost DESC;


-- Rating Analysis
SELECT
    p.category,
    ROUND(AVG(r.rating), 2) AS avg_rating
FROM reviews r
JOIN products p
    ON r.product_id = p.product_id
GROUP BY p.category
ORDER BY avg_rating DESC;


-- CASE WHEN Analysis
SELECT
    order_id,
    total_amount_idr,
    CASE
        WHEN total_amount_idr >= 1000000 THEN 'High Value'
        WHEN total_amount_idr >= 500000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS order_value_category
FROM orders;

