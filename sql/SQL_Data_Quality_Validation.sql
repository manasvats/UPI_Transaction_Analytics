CREATE DATABASE UPI_Transaction_Analytics;
USE UPI_Transaction_Analytics;

SELECT
    status,
    COUNT(*) AS Total_Transactions
FROM dbo.upi_transactions
GROUP BY status
ORDER BY Total_Transactions DESC;

SELECT
    failure_reason,
    COUNT(*) AS Failed_Transactions
FROM dbo.upi_transactions
WHERE status = 'FAILED'
GROUP BY failure_reason
ORDER BY Failed_Transactions DESC;

SELECT
    payment_app,
    COUNT(*) AS Total_Transactions,
    SUM(CASE WHEN status = 'SUCCESS' THEN 1 ELSE 0 END) AS Successful_Transactions,
    SUM(CASE WHEN status = 'FAILED' THEN 1 ELSE 0 END) AS Failed_Transactions,
    CAST(
        100.0 * SUM(CASE WHEN status = 'SUCCESS' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5,2)
    ) AS Success_Rate_Percentage
FROM dbo.upi_transactions
GROUP BY payment_app
ORDER BY Success_Rate_Percentage DESC;

SELECT
    sender_bank,
    COUNT(*) AS Total_Transactions,
    SUM(CASE WHEN status = 'SUCCESS' THEN 1 ELSE 0 END) AS Successful_Transactions,
    SUM(CASE WHEN status = 'FAILED' THEN 1 ELSE 0 END) AS Failed_Transactions,
    CAST(
        100.0 * SUM(CASE WHEN status = 'FAILED' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5,2)
    ) AS Failure_Rate_Percentage
FROM dbo.upi_transactions
GROUP BY sender_bank
ORDER BY Failure_Rate_Percentage DESC;

SELECT
    receiver_bank,
    COUNT(*) AS Total_Transactions,
    SUM(CASE WHEN status = 'SUCCESS' THEN 1 ELSE 0 END) AS Successful_Transactions,
    SUM(CASE WHEN status = 'FAILED' THEN 1 ELSE 0 END) AS Failed_Transactions,
    CAST(
        100.0 * SUM(CASE WHEN status = 'FAILED' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5,2)
    ) AS Failure_Rate_Percentage
FROM dbo.upi_transactions
GROUP BY receiver_bank
ORDER BY Failure_Rate_Percentage DESC;

SELECT
    transaction_hour,
    COUNT(*) AS Total_Transactions,
    SUM(CASE WHEN status = 'SUCCESS' THEN 1 ELSE 0 END) AS Successful_Transactions,
    SUM(CASE WHEN status = 'FAILED' THEN 1 ELSE 0 END) AS Failed_Transactions
FROM dbo.upi_transactions
GROUP BY transaction_hour
ORDER BY Total_Transactions DESC;

SELECT
    city,
    COUNT(*) AS Total_Transactions,
    SUM(CASE WHEN status = 'SUCCESS' THEN 1 ELSE 0 END) AS Successful_Transactions,
    SUM(CASE WHEN status = 'FAILED' THEN 1 ELSE 0 END) AS Failed_Transactions,
    CAST(
        100.0 * SUM(CASE WHEN status = 'FAILED' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5,2)
    ) AS Failure_Rate_Percentage
FROM dbo.upi_transactions
GROUP BY city
ORDER BY Total_Transactions DESC;

SELECT
    YEAR(transaction_date) AS Transaction_Year,
    MONTH(transaction_date) AS Transaction_Month,
    DATENAME(MONTH, transaction_date) AS Month_Name,
    COUNT(*) AS Total_Transactions,
    SUM(CASE WHEN status = 'SUCCESS' THEN 1 ELSE 0 END) AS Successful_Transactions,
    SUM(CASE WHEN status = 'FAILED' THEN 1 ELSE 0 END) AS Failed_Transactions
FROM dbo.upi_transactions
GROUP BY
    YEAR(transaction_date),
    MONTH(transaction_date),
    DATENAME(MONTH, transaction_date)
ORDER BY
    Transaction_Year,
    Transaction_Month;

    SELECT
    COUNT(DISTINCT customer_id) AS Total_Unique_Customers
FROM dbo.upi_transactions;

SELECT TOP 10
    customer_id,
    COUNT(*) AS Total_Transactions,
    SUM(CASE WHEN status = 'SUCCESS' THEN 1 ELSE 0 END) AS Successful_Transactions,
    SUM(CASE WHEN status = 'FAILED' THEN 1 ELSE 0 END) AS Failed_Transactions,
    SUM(amount) AS Total_Transaction_Value
FROM dbo.upi_transactions
GROUP BY customer_id
ORDER BY Total_Transactions DESC;


WITH Customer_Transactions AS
(
    SELECT
        customer_id,
        COUNT(*) AS Total_Transactions
    FROM dbo.upi_transactions
    GROUP BY customer_id
)
SELECT
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Total_Transactions = 1 THEN 1 ELSE 0 END) AS One_Time_Customers,
    SUM(CASE WHEN Total_Transactions > 1 THEN 1 ELSE 0 END) AS Repeat_Customers,
    CAST(
        100.0 * SUM(CASE WHEN Total_Transactions > 1 THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5,2)
    ) AS Repeat_Customer_Percentage
FROM Customer_Transactions;


SELECT
    merchant_category,
    COUNT(*) AS Total_Transactions,
    SUM(CASE WHEN status = 'SUCCESS' THEN 1 ELSE 0 END) AS Successful_Transactions,
    SUM(CASE WHEN status = 'FAILED' THEN 1 ELSE 0 END) AS Failed_Transactions,
    SUM(CASE WHEN status = 'SUCCESS' THEN amount ELSE 0 END) AS Successful_Transaction_Value
FROM dbo.upi_transactions
WHERE transaction_type = 'P2M'
GROUP BY merchant_category
ORDER BY Total_Transactions DESC;

SELECT
    transaction_type,
    COUNT(*) AS Total_Transactions,
    SUM(CASE WHEN status = 'SUCCESS' THEN 1 ELSE 0 END) AS Successful_Transactions,
    SUM(CASE WHEN status = 'FAILED' THEN 1 ELSE 0 END) AS Failed_Transactions,
    CAST(
        100.0 * SUM(CASE WHEN status = 'SUCCESS' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5,2)
    ) AS Success_Rate_Percentage,
    SUM(CASE WHEN status = 'SUCCESS' THEN amount ELSE 0 END) AS Successful_Transaction_Value
FROM dbo.upi_transactions
GROUP BY transaction_type
ORDER BY Total_Transactions DESC;

SELECT
    status,
    COUNT(*) AS Total_Transactions,
    CAST(AVG(CAST(amount AS DECIMAL(10,2))) AS DECIMAL(10,2)) AS Average_Transaction_Amount,
    MIN(amount) AS Minimum_Amount,
    MAX(amount) AS Maximum_Amount
FROM dbo.upi_transactions
GROUP BY status
ORDER BY Average_Transaction_Amount DESC;

SELECT
    status,
    COUNT(*) AS Total_Transactions,
    CAST(
        AVG(CAST(processing_time_ms AS DECIMAL(10,2)))
        AS DECIMAL(10,2)
    ) AS Average_Processing_Time_MS,
    MIN(processing_time_ms) AS Minimum_Processing_Time_MS,
    MAX(processing_time_ms) AS Maximum_Processing_Time_MS
FROM dbo.upi_transactions
GROUP BY status
ORDER BY Average_Processing_Time_MS DESC;

SELECT
    status,
    COUNT(*) AS Total_Transactions,
    SUM(amount) AS Total_Transaction_Amount,
    CAST(AVG(CAST(amount AS DECIMAL(10,2))) AS DECIMAL(10,2))
        AS Average_Transaction_Amount
FROM dbo.upi_transactions
GROUP BY status
ORDER BY Total_Transaction_Amount DESC;

SELECT
    sender_bank,
    failure_reason,
    COUNT(*) AS Failed_Transactions
FROM dbo.upi_transactions
WHERE status = 'FAILED'
GROUP BY
    sender_bank,
    failure_reason
ORDER BY
    sender_bank,
    Failed_Transactions DESC;

    SELECT
    customer_id,
    COUNT(*) AS Failed_Transaction_Count,
    SUM(amount) AS Total_Failed_Attempt_Value
FROM dbo.upi_transactions
WHERE status = 'FAILED'
GROUP BY customer_id
HAVING COUNT(*) > 1
ORDER BY Failed_Transaction_Count DESC;

SELECT
    MONTH(transaction_date) AS Transaction_Month,
    DATENAME(MONTH, transaction_date) AS Month_Name,
    COUNT(*) AS Total_Transactions,

    SUM(CASE
        WHEN status = 'SUCCESS' THEN 1
        ELSE 0
    END) AS Successful_Transactions,

    CAST(
        100.0 * SUM(CASE
            WHEN status = 'SUCCESS' THEN 1
            ELSE 0
        END) / COUNT(*) AS DECIMAL(5,2)
    ) AS Success_Rate_Percentage

FROM dbo.upi_transactions

GROUP BY
    MONTH(transaction_date),
    DATENAME(MONTH, transaction_date)

ORDER BY Transaction_Month;


SELECT
    payment_app,
    COUNT(*) AS Total_Transactions,

    SUM(CASE WHEN status = 'SUCCESS' THEN 1 ELSE 0 END)
        AS Successful_Transactions,

    SUM(CASE WHEN status = 'FAILED' THEN 1 ELSE 0 END)
        AS Failed_Transactions,

    SUM(CASE WHEN status = 'PENDING' THEN 1 ELSE 0 END)
        AS Pending_Transactions,

    CAST(
        100.0 * SUM(CASE WHEN status = 'FAILED' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5,2)
    ) AS Failure_Rate_Percentage

FROM dbo.upi_transactions
GROUP BY payment_app
ORDER BY Failure_Rate_Percentage DESC;


SELECT
    sender_bank,

    SUM(CASE
        WHEN status = 'SUCCESS' THEN amount
        ELSE 0
    END) AS Successful_Transaction_Value,

    SUM(CASE
        WHEN status = 'FAILED' THEN amount
        ELSE 0
    END) AS Failed_Attempted_Value,

    COUNT(CASE
        WHEN status = 'SUCCESS' THEN 1
    END) AS Successful_Transactions,

    COUNT(CASE
        WHEN status = 'FAILED' THEN 1
    END) AS Failed_Transactions

FROM dbo.upi_transactions

GROUP BY sender_bank

ORDER BY Successful_Transaction_Value DESC;



SELECT
    COUNT(*) AS Total_Transactions,

    COUNT(DISTINCT customer_id) AS Total_Customers,

    SUM(CASE WHEN status = 'SUCCESS' THEN 1 ELSE 0 END)
        AS Successful_Transactions,

    SUM(CASE WHEN status = 'FAILED' THEN 1 ELSE 0 END)
        AS Failed_Transactions,

    SUM(CASE WHEN status = 'PENDING' THEN 1 ELSE 0 END)
        AS Pending_Transactions,

    CAST(
        100.0 * SUM(CASE WHEN status = 'SUCCESS' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5,2)
    ) AS Success_Rate,

    CAST(
        100.0 * SUM(CASE WHEN status = 'FAILED' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(5,2)
    ) AS Failure_Rate,

    SUM(CASE WHEN status = 'SUCCESS' THEN amount ELSE 0 END)
        AS Successful_Transaction_Value,

    CAST(
        AVG(CAST(processing_time_ms AS DECIMAL(10,2)))
        AS DECIMAL(10,2)
    ) AS Average_Processing_Time_MS

FROM dbo.upi_transactions;




SELECT
    COUNT(*) AS Total_Rows,

    COUNT(DISTINCT transaction_id) AS Unique_Transaction_IDs,

    SUM(CASE
        WHEN amount < 100 OR amount > 5000 THEN 1
        ELSE 0
    END) AS Invalid_Amounts,

    SUM(CASE
        WHEN transaction_hour < 0 OR transaction_hour > 23 THEN 1
        ELSE 0
    END) AS Invalid_Hours,

    SUM(CASE
        WHEN status NOT IN ('SUCCESS', 'FAILED', 'PENDING') THEN 1
        ELSE 0
    END) AS Invalid_Statuses,

    SUM(CASE
        WHEN status = 'FAILED' AND failure_reason IS NULL THEN 1
        ELSE 0
    END) AS Failed_Without_Reason,

    SUM(CASE
        WHEN transaction_type = 'P2P'
        AND (merchant_id IS NOT NULL OR merchant_category IS NOT NULL)
        THEN 1 ELSE 0
    END) AS Invalid_P2P_Records,

    SUM(CASE
        WHEN transaction_type = 'P2M'
        AND (merchant_id IS NULL OR merchant_category IS NULL)
        THEN 1 ELSE 0
    END) AS Invalid_P2M_Records

FROM dbo.upi_transactions;