DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
    row_id INT,
    order_id VARCHAR(30),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(30),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country_region VARCHAR(100),
    city VARCHAR(100),
    state_province VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name TEXT,
    sales NUMERIC(12,3),
    quantity INT,
    discount NUMERIC(5,2),
    profit NUMERIC(12,4),
    year INT,
    month VARCHAR(20),
    month_no INT,
    quarter VARCHAR(5),
    shipping_days INT
);
COPY sales
FROM 'C:/Excel/DA1/sample_superstore_postgres.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ',',
    QUOTE '"',
    ESCAPE '"',
    ENCODING 'UTF8'
);
SELECT COUNT(*) FROM sales;
SELECT * FROM sales
LIMIT 10;
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'sales';
SELECT
COUNT(*) AS total_rows,
COUNT(row_id) AS row_id,
COUNT(order_id) AS order_id,
COUNT(customer_name) AS customer_name
FROM sales;
SELECT SUM(sales) AS total_sales
FROM sales;
SELECT SUM(profit) AS total_profit
FROM sales;
SELECT
product_name,
SUM(sales) AS total_sales
FROM sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;
SELECT
region,
SUM(sales) AS total_sales
FROM sales
GROUP BY region
ORDER BY total_sales DESC;
SELECT
category,
COUNT(*) AS orders
FROM sales
GROUP BY category;
SELECT ROUND(SUM(sales),2) AS total_sales
FROM sales;
SELECT ROUND(SUM(profit),2) AS total_profit
FROM sales;
SELECT COUNT(*) AS total_orders
FROM sales;
SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM sales;
SELECT ROUND(AVG(sales),2) AS average_sales
FROM sales;
SELECT *
FROM sales
ORDER BY profit DESC
LIMIT 1;
SELECT *
FROM sales
ORDER BY profit ASC
LIMIT 1;
SELECT
category,
ROUND(SUM(sales),2) AS total_sales
FROM sales
GROUP BY category
ORDER BY total_sales DESC;
SELECT
segment,
ROUND(SUM(sales),2) AS total_sales
FROM sales
GROUP BY segment
ORDER BY total_sales DESC;
SELECT
customer_name,
ROUND(SUM(sales),2) AS total_sales
FROM sales
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;
SELECT
month_no,
month,
ROUND(SUM(sales),2) AS total_sales
FROM sales
GROUP BY month_no, month
ORDER BY month_no;
SELECT
city,
ROUND(SUM(sales),2) AS total_sales
FROM sales
GROUP BY city
ORDER BY total_sales DESC
LIMIT 10;
-- ===========================
-- KPI Queries
-- ===========================
SELECT
    COUNT(*) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit,
    ROUND(AVG(sales),2) AS average_order_value
FROM sales;
-- ===========================
--Top 10 Best Selling Products
-- ===========================
SELECT
    product_name,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(sales),2) AS total_sales
FROM sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;
-- ===========================
--Top 10 Most Profitable Products
-- ===========================
SELECT
    product_name,
    ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;
-- ===========================
--Top 10 Loss-Making Products
-- ===========================
SELECT
    product_name,
    ROUND(SUM(profit),2) AS total_loss
FROM sales
GROUP BY product_name
ORDER BY total_loss ASC
LIMIT 10;
-- ===========================
--Sales & Profit by Category
-- ===========================
SELECT
    category,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY category
ORDER BY total_sales DESC;
-- ===========================
-- Sales & Profit by Sub Category
-- ===========================
SELECT
    sub_category,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY sub_category
ORDER BY total_sales DESC;
-- ===========================
--Region Performance
-- ===========================
SELECT
    region,
    COUNT(*) AS orders,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY region
ORDER BY total_sales DESC;
-- ===========================
--State-wise Sales
-- ===========================
SELECT
    state_province,
    ROUND(SUM(sales),2) AS total_sales
FROM sales
GROUP BY state_province
ORDER BY total_sales DESC
LIMIT 15;
-- ==============================
--City-wise Sales
-- ==============================
SELECT
    city,
    ROUND(SUM(sales),2) AS total_sales
FROM sales
GROUP BY city
ORDER BY total_sales DESC
LIMIT 15;
-- ==============================
--Customer Ranking
-- ==============================
SELECT
    customer_name,
    ROUND(SUM(sales),2) AS total_sales
FROM sales
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 20;
-- =======================
--Monthly Sales Trend
-- =======================
SELECT
    month_no,
    month,
    ROUND(SUM(sales),2) AS total_sales
FROM sales
GROUP BY month_no, month
ORDER BY month_no;
-- =======================
--Quarterly Sales
-- =======================
SELECT
    quarter,
    ROUND(SUM(sales),2) AS total_sales
FROM sales
GROUP BY quarter
ORDER BY quarter;
-- =======================
--Year-wise Sales
-- =======================
SELECT
    year,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY year
ORDER BY year;
-- =======================
--Sales by Ship Mode
-- =======================
SELECT
    ship_mode,
    COUNT(*) AS orders,
    ROUND(SUM(sales),2) AS total_sales
FROM sales
GROUP BY ship_mode
ORDER BY total_sales DESC;
-- =======================
--Sales by Segment
-- =======================
SELECT
    segment,
    COUNT(*) AS orders,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY segment
ORDER BY total_sales DESC;
-- =======================
--Top 10 Customers by Profit
-- =======================
SELECT
    customer_name,
    ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY customer_name
ORDER BY total_profit DESC
LIMIT 10;
-- =======================
--Top 10 States by Profit
-- =======================
SELECT
    state_province,
    ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY state_province
ORDER BY total_profit DESC
LIMIT 10;
-- =======================
--Top 10 Cities by Profit
-- =======================
SELECT
    city,
    ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY city
ORDER BY total_profit DESC
LIMIT 10;
-- =================================
--Average Shipping Days by Ship Mode
-- =================================
SELECT
    ship_mode,
    ROUND(AVG(shipping_days),2) AS avg_shipping_days
FROM sales
GROUP BY ship_mode
ORDER BY avg_shipping_days;
-- =======================
--Sales vs Profit by Region
-- =======================
SELECT
    region,
    ROUND(SUM(sales),2) AS sales,
    ROUND(SUM(profit),2) AS profit
FROM sales
GROUP BY region
ORDER BY sales DESC;
-- =======================
--Top Discounted Products
-- =======================
SELECT
    product_name,
    ROUND(AVG(discount),2) AS avg_discount
FROM sales
GROUP BY product_name
ORDER BY avg_discount DESC
LIMIT 10;
-- =======================
--Products Sold (Quantity)
-- =======================
SELECT
    product_name,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY product_name
ORDER BY total_quantity DESC
LIMIT 10;
-- ==========================
--Customers with Most Orders
-- ==========================
SELECT
    customer_name,
    COUNT(order_id) AS total_orders
FROM sales
GROUP BY customer_name
ORDER BY total_orders DESC
LIMIT 10;
-- =======================
--Number of Orders by Category
-- =======================
SELECT
    category,
    COUNT(order_id) AS total_orders
FROM sales
GROUP BY category
ORDER BY total_orders DESC;
-- =======================
--Monthly Profit Trend
-- =======================
SELECT
    month_no,
    month,
    ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY month_no, month
ORDER BY month_no;
-- ==================
--CREATE VIEW
-- ==================
CREATE OR REPLACE VIEW vw_kpi_summary AS
SELECT
    COUNT(*) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(sales), 2) AS average_order_value
FROM sales;
-- =========================
--View for Category Analysis
-- =========================
CREATE OR REPLACE VIEW vw_category_sales AS
SELECT
    category,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY category;
-- ==========================
--View for Region
-- ==========================
CREATE OR REPLACE VIEW vw_region_sales AS
SELECT
    region,
    COUNT(*) AS orders,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit
FROM sales
GROUP BY region;
-- =======================
--View for Monthly Trend
-- =======================
CREATE OR REPLACE VIEW vw_monthly_sales AS
SELECT
    month_no,
    month,
    ROUND(SUM(sales),2) AS total_sales
FROM sales
GROUP BY month_no, month;
-- ===========================
--View for Customer Ranking
-- ===========================
CREATE OR REPLACE VIEW vw_customer_ranking AS
SELECT
    customer_name,
    ROUND(SUM(sales),2) AS total_sales
FROM sales
GROUP BY customer_name;
-- =========================
--View for Product Ranking
-- =========================
CREATE OR REPLACE VIEW vw_product_sales AS
SELECT
    product_name,
    SUM(quantity) AS quantity,
    ROUND(SUM(sales),2) AS total_sales
FROM sales
GROUP BY product_name;
-- ================================
--to view
-- ================================
SELECT * FROM vw_kpi_summary;

SELECT * FROM vw_category_sales;

SELECT * FROM vw_region_sales;

SELECT * FROM vw_monthly_sales;

SELECT * FROM vw_customer_ranking;

SELECT * FROM vw_product_sales;
ALTER USER postgres
WITH PASSWORD 'anjana2006';