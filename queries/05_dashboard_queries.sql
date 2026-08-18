USE credit_risk_project;

-- Portfolio KPI summary
SELECT
    COUNT(*) AS total_loans,
    SUM(loan_amount) AS total_originated,
    ROUND(AVG(loan_amount), 2) AS avg_loan_size,
    ROUND(AVG(interest_rate), 2) AS avg_interest_rate,
    SUM(CASE WHEN loan_status = 'Default' THEN 1 ELSE 0 END) AS defaulted_loans,
    ROUND(
      100.0 * SUM(CASE WHEN loan_status = 'Default' THEN 1 ELSE 0 END) / COUNT(*),
      2
    ) AS default_rate_pct
FROM loans;

-- Credit score vs delinquency dataset for visualization
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer,
    cs.credit_score,
    ROUND(AVG(p.days_late), 2) AS avg_days_late
FROM customers c
JOIN credit_scores cs ON c.customer_id = cs.customer_id
JOIN loans l ON c.customer_id = l.customer_id
JOIN payments p ON l.loan_id = p.loan_id
GROUP BY c.customer_id, c.first_name, c.last_name, cs.credit_score
ORDER BY cs.credit_score;
