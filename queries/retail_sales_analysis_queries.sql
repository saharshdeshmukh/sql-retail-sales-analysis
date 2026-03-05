CREATE DATABASE sales_analysis;
USE sales_analysis;
SELECT*FROM stores_sales_forecasting;

-- Total Revenue
SELECT SUM(Sales) AS total_revenue
FROM stores_sales_forecasting;

-- Revenue by Category
SELECT Category,
       SUM(Sales) AS category_revenue
FROM stores_sales_forecasting
GROUP BY Category
ORDER BY category_revenue DESC; 

-- Top 10 Customers by Spending
SELECT `Customer Name`,
       SUM(Sales) AS total_spent
FROM stores_sales_forecasting
GROUP BY `Customer Name`
ORDER BY total_spent DESC
LIMIT 10;

-- Revenue by Region
SELECT Region,
       SUM(Sales) AS regional_revenue
FROM stores_sales_forecasting
GROUP BY Region
ORDER BY regional_revenue DESC;

-- Monthly Sales Trend
SELECT MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS month,
       SUM(Sales) AS monthly_sales
FROM stores_sales_forecasting
GROUP BY MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y'))
ORDER BY month;

-- Top 5 Products by Revenue
SELECT `Product Name`,
       SUM(Sales) AS product_revenue
FROM stores_sales_forecasting
GROUP BY `Product Name`
ORDER BY product_revenue DESC
LIMIT 5;

-- Sales by Customer Segment
SELECT Segment,
       SUM(Sales) AS segment_sales
FROM stores_sales_forecasting
GROUP BY Segment
ORDER BY segment_sales DESC;

-- Average Order Value
SELECT AVG(Sales) AS average_order_value
FROM stores_sales_forecasting;

-- Average Order Value
SELECT AVG(Sales) AS average_order_value
FROM stores_sales_forecasting;

-- Category Revenue Contribution %
SELECT Category,
       SUM(Sales) AS revenue,
       SUM(Sales) * 100 /
       (SELECT SUM(Sales) FROM stores_sales_forecasting) AS revenue_percentage
FROM stores_sales_forecasting
GROUP BY Category
ORDER BY revenue DESC;