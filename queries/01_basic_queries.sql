USE credit_risk_project;

-- 1. Highest-income customers
SELECT first_name, last_name, annual_income
FROM customers
ORDER BY annual_income DESC;

-- 2. Customers earning more than $60,000
SELECT customer_id, first_name, last_name, annual_income
FROM customers
WHERE annual_income > 60000
ORDER BY annual_income DESC;

-- 3. All defaulted loans
SELECT *
FROM loans
WHERE loan_status = 'Default';

-- 4. Average loan size
SELECT ROUND(AVG(loan_amount), 2) AS avg_loan_amount
FROM loans;
