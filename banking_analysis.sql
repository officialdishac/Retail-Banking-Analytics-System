-- Retail Banking Customer & Transaction Analysis
-- SQL Project for Data Analyst Role

-- Dataset Note:
-- Each customer has only one transaction; hence frequency-based analysis is not applicable.

-- Section 1: Overview

-- Query 1: Total transactions + total revenue
SELECT 
    COUNT(Transaction_ID) AS total_transactions,
    SUM(Transaction_Amount) AS total_revenue
FROM bank_transaction_fraud_detection;

-- Query 2: Total unique customers
SELECT 
    COUNT(DISTINCT Customer_ID) AS total_customers
FROM bank_transaction_fraud_detection;

-- Section 2: Customer Analysis

-- Query 3: Top 10 customers by spending
WITH customer_spend AS (
    SELECT 
        Customer_ID,
        SUM(Transaction_Amount) AS total_spent
    FROM bank_transaction_fraud_detection
    GROUP BY Customer_ID
),
ranked_customers AS (
    SELECT 
        Customer_ID,
        total_spent,
        RANK() OVER (ORDER BY total_spent DESC) AS rnk
    FROM customer_spend
)
SELECT *
FROM ranked_customers
WHERE rnk <= 10;

-- Query 4: Average transaction value per customer
SELECT 
    Customer_ID,
    AVG(Transaction_Amount) AS avg_transaction_value
FROM bank_transaction_fraud_detection
GROUP BY Customer_ID
ORDER BY avg_transaction_value DESC;

-- Section 3: Time Analysis

-- Note: All transactions occur in a single month (Jan 2025), limiting time-series analysis

-- Query 5: Monthly transaction analysis
SELECT 
    DATE_FORMAT(
        STR_TO_DATE(Transaction_Date, '%d-%m-%Y'), 
        '%Y-%m'
    ) AS month,
    COUNT(*) AS total_transactions,
    SUM(Transaction_Amount) AS total_revenue
FROM bank_transaction_fraud_detection
GROUP BY month
ORDER BY month;

-- Section 4: Fraud Analysis

-- Query 6: Fraud vs Non-Fraud Count
SELECT 
    Is_Fraud,
    COUNT(*) AS total_transactions
FROM bank_transaction_fraud_detection
GROUP BY Is_Fraud;

-- Query 7: Fraud Rate (%)
SELECT 
    COUNT(CASE WHEN Is_Fraud = 1 THEN 1 END) * 100.0 / COUNT(*) AS fraud_percentage
FROM bank_transaction_fraud_detection;

-- Query 8: Fraud by Merchant Category
SELECT 
    Merchant_Category,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN Is_Fraud = 1 THEN 1 ELSE 0 END) AS fraud_count
FROM bank_transaction_fraud_detection
GROUP BY Merchant_Category
ORDER BY fraud_count DESC;

-- Query 9: Fraud by Transaction Type
SELECT 
    Transaction_Type,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN Is_Fraud = 1 THEN 1 ELSE 0 END) AS fraud_count
FROM bank_transaction_fraud_detection
GROUP BY Transaction_Type;

-- Section 5: Customer Segmentation

-- Query 10: Segment customers by spending
SELECT 
    Customer_ID,
    SUM(Transaction_Amount) AS total_spent,
    CASE 
        WHEN SUM(Transaction_Amount) > 50000 THEN 'High Value'
        WHEN SUM(Transaction_Amount) BETWEEN 20000 AND 50000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM bank_transaction_fraud_detection
GROUP BY Customer_ID;

-- Query 11: Count customers per segment
SELECT 
    customer_segment,
    COUNT(*) AS num_customers
FROM (
    SELECT 
        Customer_ID,
        CASE 
            WHEN SUM(Transaction_Amount) > 50000 THEN 'High Value'
            WHEN SUM(Transaction_Amount) BETWEEN 20000 AND 50000 THEN 'Medium Value'
            ELSE 'Low Value'
        END AS customer_segment
    FROM bank_transaction_fraud_detection
    GROUP BY Customer_ID
) t
GROUP BY customer_segment;