# Credit Risk & Loan Management System

A portfolio-ready SQL project that models a small lending database and analyzes borrower behavior, delinquency, default risk, and portfolio performance.

## Project goals

- Design a normalized relational database
- Practice primary and foreign keys
- Write multi-table joins
- Use aggregate functions, `GROUP BY`, and `HAVING`
- Build CTEs and window functions
- Create a simple borrower-risk classification
- Produce portfolio KPIs and a visualization-ready dataset

## Tech stack

- MySQL 8+
- SQL
- CSV
- Matplotlib (used only to generate the included project visual)

## Database structure

`customers` → `loans` → `payments`

`customers` → `credit_scores`

### Tables

- **customers**: borrower demographics and income
- **loans**: loan amount, type, rate, status, and start date
- **payments**: payment amount and delinquency
- **credit_scores**: borrower credit-score history

## Repository structure

```text
credit-risk-sql-project/
├── README.md
├── database/
│   ├── schema.sql
│   └── sample_data.sql
├── queries/
│   ├── 01_basic_queries.sql
│   ├── 02_loan_analysis.sql
│   ├── 03_payment_analysis.sql
│   ├── 04_risk_analysis.sql
│   └── 05_dashboard_queries.sql
├── data/
│   ├── customers.csv
│   ├── loans.csv
│   ├── payments.csv
│   └── credit_scores.csv
├── analysis/
│   └── findings.md
└── visuals/
    └── credit_score_vs_delinquency.png
```

## How to run

1. Install MySQL 8+ or use MySQL Workbench.
2. Run `database/schema.sql`.
3. Run `database/sample_data.sql`.
4. Execute the scripts inside `queries/` in numerical order.
5. Review `analysis/findings.md`.
6. Open `visuals/credit_score_vs_delinquency.png`.

## Example interview explanation

> I built a relational lending database in MySQL to analyze borrower and loan performance. I modeled one-to-many relationships between customers, loans, and payments, added referential constraints and indexes, and wrote analytical queries using joins, aggregates, CTEs, CASE statements, and window functions. I also created a risk segmentation based on credit score and payment delinquency and generated a visualization showing the relationship between score and average days late.

## SQL concepts demonstrated

`SELECT` · `WHERE` · `ORDER BY` · `JOIN` · `GROUP BY` · `HAVING` · `SUM` · `AVG` · `COUNT` · `CASE` · CTEs · `ROW_NUMBER` · `DENSE_RANK` · indexes · foreign keys

## Data note

All data in this repository is synthetic and created for educational and portfolio purposes.
