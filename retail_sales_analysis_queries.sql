create database sql_customer_orders;
USE sql_customer_orders;
SELECT * FROM orders LIMIT 5;  

-- Query 1: Total number of orders
SELECT COUNT(*) AS total_orders FROM orders; 

-- Total sales
SELECT ROUND(SUM(Sales), 2) AS total_sales FROM orders;


-- Sales by region
SELECT Region, ROUND(SUM(Sales), 2) AS total_sales
FROM orders
GROUP BY Region
ORDER BY total_sales DESC;  


-- Top 5 products
SELECT 
    `Product Name`,
    ROUND(SUM(Sales), 2) AS total_sales
FROM orders
GROUP BY `Product Name`
ORDER BY total_sales DESC
LIMIT 5;


SELECT
    YEAR(`Order Date`) AS sales_year,
    MONTH(`Order Date`) AS sales_month,
    ROUND(SUM(Sales), 2) AS total_sales
FROM orders
GROUP BY
    YEAR(`Order Date`),
    MONTH(`Order Date`)
ORDER BY
    sales_year,
    sales_month;


SELECT
    YEAR(`Order Date`) AS sales_year,
    MONTHNAME(`Order Date`) AS sales_month,
    ROUND(SUM(Sales), 2) AS total_sales
FROM orders
GROUP BY
    YEAR(`Order Date`),
    MONTHNAME(`Order Date`),
    MONTH(`Order Date`)
ORDER BY
    sales_year,
    MONTH(`Order Date`);

DESCRIBE orders;

ALTER TABLE orders
ADD COLUMN order_date_clean DATE;

SET SQL_SAFE_UPDATES = 0;

UPDATE orders
SET order_date_clean = NULL;

UPDATE orders
SET order_date_clean = STR_TO_DATE(`Order Date`, '%d/%m/%Y')
WHERE `Order Date` LIKE '%/%/%';

SELECT `Order Date`, order_date_clean
FROM orders
WHERE order_date_clean IS NULL
LIMIT 10;

SELECT
    YEAR(order_date_clean) AS sales_year,
    MONTH(order_date_clean) AS sales_month,
    ROUND(SUM(Sales), 2) AS total_sales
FROM orders
GROUP BY
    YEAR(order_date_clean),
    MONTH(order_date_clean)
ORDER BY
    sales_year,
    sales_month; 
    
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales
FROM orders
GROUP BY Category
ORDER BY total_sales DESC;  

SELECT
    ROUND(SUM(Sales) / COUNT(DISTINCT `Order ID`), 2) AS avg_order_value
FROM orders;



