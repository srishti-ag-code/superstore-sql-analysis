-- ========================================
-- SUPERSTORE SALES ANALYSIS (SQL PROJECT)
-- Author: Srishti Agrawal
-- ========================================


-- 1. TOTAL SALES & PROFIT OVERVIEW
-- Insight: High total sales but relatively low profit indicates poor profit margins
SELECT 
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore;


-- 2. PROFIT RATIO (BUSINESS HEALTH)
-- Insight: Low profit ratio (~1%) suggests inefficiencies in pricing or discount strategy
SELECT 
    ROUND(SUM(profit) / SUM(sales), 4) AS profit_ratio
FROM superstore;


-- 3. REGION-WISE PERFORMANCE
-- Insight: Central region performs best; Southeast Asia shows losses despite strong sales
SELECT region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;


-- 4. CATEGORY-WISE ANALYSIS
-- Insight: Some categories drive high sales but do not proportionally contribute to profit
SELECT 
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;


-- 5. SUB-CATEGORY ANALYSIS (KEY BUSINESS PROBLEM)
-- Insight: 'Tables' sub-category generates high revenue but causes significant losses
SELECT 
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY sub_category
ORDER BY total_profit ASC;


-- 6. CUSTOMER SEGMENT ANALYSIS
-- Insight: Different customer segments contribute unevenly to profitability
SELECT 
    segment,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY segment
ORDER BY total_sales DESC;


-- 7. DISCOUNT IMPACT ANALYSIS (ROOT CAUSE)
-- Insight: Higher discount levels (70%+) are strongly associated with negative profit
SELECT 
    ROUND(discount, 2) AS discount_level,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY discount_level
ORDER BY discount_level;


-- 8. MONTHLY SALES & PROFIT TREND
-- Insight: Sales trends fluctuate over time; profit does not always follow sales growth
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(sales) AS monthly_sales,
    SUM(profit) AS monthly_profit
FROM superstore
GROUP BY month
ORDER BY month;


-- 9. TOP 10 PRODUCTS BY SALES
-- Insight: A small number of products contribute disproportionately to total revenue
SELECT 
    product_name,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 5;


-- 10. TOP 10 LOSS-MAKING PRODUCTS
-- Insight: Identifies products that require pricing or cost optimization
SELECT 
    product_name,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY product_name
ORDER BY total_profit ASC
LIMIT 10;