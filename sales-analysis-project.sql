-- View all data
SELECT * FROM sales;

-- Extract year from ORDERDATE
SELECT YEAR(STR_TO_DATE(ORDERDATE, '%m/%d/%Y')) AS `Year`
FROM sales;

-- Total quantity and sales
SELECT 
    SUM(QUANTITYORDERED) AS `Total Order`, 
    ROUND(SUM(SALES)) AS `Total Sales`
FROM sales;

-- Total sales by product line and year
SELECT 
    PRODUCTLINE,
    YEAR(STR_TO_DATE(ORDERDATE, '%m/%d/%Y')) AS `Year`,  
    ROUND(SUM(SALES)) AS `Total Sale`
FROM sales
GROUP BY PRODUCTLINE, YEAR(STR_TO_DATE(ORDERDATE, '%m/%d/%Y'))
ORDER BY `Year` ASC;

-- Sales by year, quarter, and month
SELECT 
    YEAR_ID, QTR_ID, MONTH_ID, 
    ROUND(SUM(SALES)) AS total_sales
FROM sales
GROUP BY YEAR_ID, QTR_ID, MONTH_ID
ORDER BY YEAR_ID, QTR_ID, MONTH_ID;

-- Average order value
SELECT 
    ROUND(AVG(SALES)) AS avg_order_value 
FROM sales;

-- Top 5 customers by sales
SELECT 
    CUSTOMERNAME, 
    ROUND(SUM(SALES)) AS total_sales
FROM sales
GROUP BY CUSTOMERNAME
ORDER BY total_sales DESC
LIMIT 5;

-- Number of customers per country
SELECT 
    COUNTRY, 
    COUNT(DISTINCT CUSTOMERNAME) AS customer_count
FROM sales
GROUP BY COUNTRY
ORDER BY customer_count DESC;

-- Number of orders per customer
SELECT 
    CUSTOMERNAME, 
    COUNT(DISTINCT ORDERNUMBER) AS order_count
FROM sales
GROUP BY CUSTOMERNAME
ORDER BY order_count DESC;

-- Customer type: New vs Returning
SELECT 
    CUSTOMERNAME,
    COUNT(DISTINCT ORDERNUMBER) AS order_count,
    CASE
        WHEN COUNT(DISTINCT ORDERNUMBER) > 1 THEN 'Returning'
        ELSE 'New'
    END AS customer_type
FROM sales
GROUP BY CUSTOMERNAME;

-- Total sales per country
SELECT 
    COUNTRY, 
    ROUND(SUM(SALES)) AS total_sales
FROM sales
GROUP BY COUNTRY
ORDER BY total_sales DESC;






