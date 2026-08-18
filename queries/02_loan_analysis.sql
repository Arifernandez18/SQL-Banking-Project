USE credit_risk_project;

-- Total borrowed per customer
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer,
    COUNT(l.loan_id) AS number_of_loans,
    SUM(l.loan_amount) AS total_borrowed
FROM customers c
JOIN loans l ON c.customer_id = l.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_borrowed DESC;

-- Loan performance by type
SELECT
    loan_type,
    COUNT(*) AS total_loans,
    ROUND(AVG(loan_amount), 2) AS avg_loan_amount,
    ROUND(AVG(interest_rate), 2) AS avg_interest_rate,
    SUM(CASE WHEN loan_status = 'Default' THEN 1 ELSE 0 END) AS defaults,
    ROUND(
      100.0 * SUM(CASE WHEN loan_status = 'Default' THEN 1 ELSE 0 END) / COUNT(*),
      2
    ) AS default_rate_pct
FROM loans
GROUP BY loan_type
ORDER BY default_rate_pct DESC;
