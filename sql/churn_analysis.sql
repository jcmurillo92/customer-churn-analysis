-- Overall churn count
SELECT
    Churn,
    COUNT(*) AS customers
FROM telco_churn
GROUP BY Churn;

-- Churn by contract type
SELECT
    Contract,
    Churn,
    COUNT(*) AS customers
FROM telco_churn
GROUP BY Contract, Churn
ORDER BY Contract;

-- Churn by tenure group
SELECT
    CASE
        WHEN tenure <= 12 THEN '0-12 months'
        WHEN tenure <= 24 THEN '12-24 months'
        WHEN tenure <= 48 THEN '24-48 months'
        ELSE '48+ months'
    END AS tenure_group,
    Churn,
    COUNT(*) AS customers
FROM telco_churn
GROUP BY
    CASE
        WHEN tenure <= 12 THEN '0-12 months'
        WHEN tenure <= 24 THEN '12-24 months'
        WHEN tenure <= 48 THEN '24-48 months'
        ELSE '48+ months'
    END,
    Churn
ORDER BY tenure_group;

-- Churn by payment method
SELECT
    PaymentMethod,
    Churn,
    COUNT(*) AS customers
FROM telco_churn
GROUP BY PaymentMethod, Churn
ORDER BY PaymentMethod;
