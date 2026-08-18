USE credit_risk_project;

-- Payment behavior by customer
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer,
    COUNT(p.payment_id) AS total_payments,
    ROUND(AVG(p.days_late), 2) AS avg_days_late,
    MAX(p.days_late) AS worst_delay
FROM customers c
JOIN loans l ON c.customer_id = l.customer_id
JOIN payments p ON l.loan_id = p.loan_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY avg_days_late DESC;

-- Customers averaging more than 10 days late
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer,
    ROUND(AVG(p.days_late), 2) AS avg_days_late
FROM customers c
JOIN loans l ON c.customer_id = l.customer_id
JOIN payments p ON l.loan_id = p.loan_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING AVG(p.days_late) > 10
ORDER BY avg_days_late DESC;
