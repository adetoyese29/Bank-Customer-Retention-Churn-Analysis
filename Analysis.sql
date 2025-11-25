--- Query 1: The "Credit Score" Risk Analysis
SELECT 
    CASE 
        WHEN credit_score < 400 THEN 'Under 400'
        WHEN credit_score BETWEEN 400 AND 499 THEN '400-499'
        WHEN credit_score BETWEEN 500 AND 599 THEN '500-599'
        WHEN credit_score BETWEEN 600 AND 699 THEN '600-699'
        WHEN credit_score BETWEEN 700 AND 799 THEN '700-799'
        ELSE '800+' 
    END AS credit_score_bracket,
    COUNT(customer_id) AS total_customers,
    SUM(exited) AS churned_customers,
    -- Calculate Churn Rate
    ROUND((SUM(exited) * 1.0 / COUNT(customer_id)), 2) AS churn_rate
FROM bank_churn
GROUP BY 1
ORDER BY credit_score_bracket;


--- Query 2: Money Leaving and Staying
/* Calculate how much money (Balance) has left the bank vs. stayed.
*/
SELECT 
    geography,
    COUNT(customer_id) AS total_customers,
    SUM(exited) AS churned_customers,
    
    -- Total money managed for this region
    SUM(balance) AS total_balance_managed,
    
    -- Money lost due to churn
    SUM(CASE WHEN exited = 1 THEN balance ELSE 0 END) AS balance_lost,
    
    -- Churn Rate (%)
    ROUND((SUM(exited) * 1.0 / COUNT(customer_id)), 2) AS churn_rate_pct
FROM bank_churn
GROUP BY geography
ORDER BY balance_lost DESC;


--- Query 3:
SELECT 
    Geography,
    COUNT(customer_id) AS total_customers,
    AVG(Balance) AS avg_balance,
    SUM(Balance) AS total_capital_managed,
    SUM(exited) * 1.0 / COUNT(customer_id) AS churn_rate_pct
FROM bank_churn
GROUP BY Geography
ORDER BY total_capital_managed DESC;


--- Query 4: Product "Sticky-ness"
--- Hypothesis: If a customer uses more products (Credit Card + Savings + Loan), are they less likely to leave?
SELECT 
    num_of_products,
    COUNT(customer_id) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND((SUM(exited) * 1.0 / COUNT(customer_id)), 2) AS churn_rate_pct
FROM bank_churn
GROUP BY num_of_products
ORDER BY num_of_products;

--- Query 5: "Age group analysis"
SELECT 
    CASE 
        WHEN Age < 30 THEN '18-29 (Young Adult)'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39 (Adult)'
        WHEN Age BETWEEN 40 AND 49 THEN '40-49 (Mid-Life)'
        WHEN Age BETWEEN 50 AND 59 THEN '50-59 (Pre-Retirement)'
        WHEN Age >= 60 THEN '60+ (Senior)'
        ELSE 'Unknown'
    END AS Age_Group,
    
    COUNT(customer_id) AS total_customers,
    SUM(exited) AS churned_customers,
    ROUND((SUM(exited) * 1.0 / COUNT(customer_id)), 2) AS churn_rate_pct
FROM bank_churn
GROUP BY age_group
ORDER BY Age_Group;
