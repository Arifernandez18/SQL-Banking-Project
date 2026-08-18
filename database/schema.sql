-- Credit Risk & Loan Management System
-- MySQL 8+

CREATE DATABASE IF NOT EXISTS credit_risk_project;
USE credit_risk_project;

DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS credit_scores;
DROP TABLE IF EXISTS loans;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT CHECK (age >= 18),
    annual_income DECIMAL(12,2) NOT NULL,
    employment_status VARCHAR(30) NOT NULL,
    state CHAR(2) NOT NULL
);

CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    loan_amount DECIMAL(12,2) NOT NULL,
    interest_rate DECIMAL(5,2) NOT NULL,
    loan_type VARCHAR(30) NOT NULL,
    start_date DATE NOT NULL,
    loan_status VARCHAR(20) NOT NULL,
    CONSTRAINT fk_loans_customer
      FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    loan_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    days_late INT NOT NULL DEFAULT 0,
    CONSTRAINT fk_payments_loan
      FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
);

CREATE TABLE credit_scores (
    score_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    credit_score INT NOT NULL CHECK (credit_score BETWEEN 300 AND 850),
    score_date DATE NOT NULL,
    CONSTRAINT fk_scores_customer
      FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE INDEX idx_loans_customer_id ON loans(customer_id);
CREATE INDEX idx_payments_loan_id ON payments(loan_id);
CREATE INDEX idx_scores_customer_id ON credit_scores(customer_id);
CREATE INDEX idx_loans_status ON loans(loan_status);
