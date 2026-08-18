# Key Findings

This project uses synthetic data, so the findings are illustrative rather than real-world financial conclusions.

- Borrowers with lower credit scores also show higher average payment delays in this sample.
- Personal and business loans carry more delinquency/default risk than auto loans in the synthetic portfolio.
- Customers with repeated late payments can be flagged using a combination of credit score and average days late.
- Window functions make it easy to rank customers without collapsing the detail needed for downstream analysis.
- CTEs help separate payment-behavior calculations from final risk classification logic.
