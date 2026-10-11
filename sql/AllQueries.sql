CREATE DATABASE IF NOT EXISTS ecommerce_sales_analytics;
USE ecommerce_sales_analytics;

DROP TABLE IF EXISTS superstore_sales;

CREATE TABLE superstore_sales (
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(100),
    state VARCHAR(100),
    city VARCHAR(100),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(100),
    sub_category VARCHAR(100),
    product_name VARCHAR(200),
    sales DECIMAL(12,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(12,2),
    payment_mode VARCHAR(50)
);

DESCRIBE superstore_sales;

USE ecommerce_sales_analytics;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/superstore_sales.csv'
INTO TABLE superstore_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    order_id,
    order_date,
    ship_date,
    ship_mode,
    customer_id,
    customer_name,
    segment,
    country,
    state,
    city,
    region,
    product_id,
    category,
    sub_category,
    product_name,
    sales,
    quantity,
    discount,
    profit,
    payment_mode
);

SELECT COUNT(*) AS total_rows FROM superstore_sales;
SELECT * FROM superstore_sales LIMIT 10;

USE ecommerce_sales_analytics;

-- 1. Overall KPI summary
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / NULLIF(SUM(sales), 0)) * 100, 2) AS profit_margin_percent,
    ROUND(AVG(discount), 3) AS avg_discount
FROM superstore_sales;

-- 2. Sales and profit by category
SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / NULLIF(SUM(sales), 0)) * 100, 2) AS profit_margin_percent
FROM superstore_sales
GROUP BY category
ORDER BY total_sales DESC;

-- 3. Sales and profit by sub-category
SELECT
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / NULLIF(SUM(sales), 0)) * 100, 2) AS profit_margin_percent
FROM superstore_sales
GROUP BY category, sub_category
ORDER BY total_sales DESC;

-- 4. Regional performance
SELECT
    region,
    state,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / NULLIF(SUM(sales), 0)) * 100, 2) AS profit_margin_percent
FROM superstore_sales
GROUP BY region, state
ORDER BY total_sales DESC;

-- 5. Customer segments
SELECT
    segment,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / NULLIF(SUM(sales), 0)) * 100, 2) AS profit_margin_percent
FROM superstore_sales
GROUP BY segment
ORDER BY total_sales DESC;

-- 6. Discount impact on sales and profit
SELECT
    discount,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(quantity), 2) AS avg_quantity
FROM superstore_sales
GROUP BY discount
ORDER BY discount ASC;

-- 7. Top customers by revenue
SELECT
    customer_name,
    segment,
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_sales
GROUP BY customer_name, segment, region
ORDER BY total_sales DESC
LIMIT 10;

-- 8. Monthly sales and profit trend
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month_name ASC;

-- 9. Products with high sales and low or negative profit
SELECT
    product_name,
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / NULLIF(SUM(sales), 0)) * 100, 2) AS profit_margin_percent
FROM superstore_sales
GROUP BY product_name, category, sub_category
HAVING total_sales > 500
ORDER BY total_profit ASC, total_sales DESC;

-- 10. Best performing products by profit
SELECT
    product_name,
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_sales
GROUP BY product_name, category, sub_category
ORDER BY total_profit DESC
LIMIT 10;


