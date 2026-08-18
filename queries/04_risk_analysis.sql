USE credit_risk_project;

-- Risk classification using payment behavior + credit score
WITH payment_stats AS (
    SELECT
        l.customer_id,
        ROUND(AVG(p.days_late), 2) AS avg_days_late,
        MAX(p.days_late) AS max_days_late,
        COUNT(p.payment_id) AS total_payments
    FROM loans l
    JOIN payments p ON l.loan_id = p.loan_id
    GROUP BY l.customer_id
),
latest_scores AS (
    SELECT customer_id, credit_score
    FROM (
        SELECT
            customer_id,
            credit_score,
            ROW_NUMBER() OVER (
                PARTITION BY customer_id
                ORDER BY score_date DESC, score_id DESC
            ) AS rn
        FROM credit_scores
    ) ranked_scores
    WHERE rn = 1
)
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer,
    c.annual_income,
    ls.credit_score,
    ps.avg_days_late,
    ps.max_days_late,
    CASE
        WHEN ls.credit_score < 620 AND ps.avg_days_late > 10 THEN 'High Risk'
        WHEN ls.credit_score < 680 OR ps.avg_days_late > 5 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS risk_level
FROM customers c
JOIN latest_scores ls ON c.customer_id = ls.customer_id
JOIN payment_stats ps ON c.customer_id = ps.customer_id
ORDER BY
    CASE
        WHEN ls.credit_score < 620 AND ps.avg_days_late > 10 THEN 1
        WHEN ls.credit_score < 680 OR ps.avg_days_late > 5 THEN 2
        ELSE 3
    END,
    ps.avg_days_late DESC;

-- Rank customers by borrowing
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer,
    SUM(l.loan_amount) AS total_borrowed,
    DENSE_RANK() OVER (ORDER BY SUM(l.loan_amount) DESC) AS borrowing_rank
FROM customers c
JOIN loans l ON c.customer_id = l.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY borrowing_rank;
