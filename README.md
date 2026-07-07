<img width="1307" height="730" alt="Credit Portfolio Quality" src="https://github.com/user-attachments/assets/5bb9119c-0060-443e-b0ed-a52493999141" />
# Fintech Credit Risk & Portfolio Analytics

Fintech Credit Risk & Portfolio Analytics is an end-to-end data analytics project that analyzes loan portfolio performance, evaluates borrower credit risk, estimates Expected Loss (EL), and visualizes portfolio health using SQL Server, Python, and Power BI. The project demonstrates a complete analytics workflow—from data preparation and business analysis to financial risk modeling and executive dashboard reporting—using a synthetic fintech loan portfolio dataset.

---

## Prerequisites

- SQL Server (SSMS)
- Python 3.10 or later
- Jupyter Notebook
- Power BI Desktop
- Git (optional)

---

## Project Workflow

- Import the raw loan portfolio dataset into SQL Server.
- Execute the database schema creation script.
- Run SQL business queries to analyze portfolio performance and credit risk.
- Perform data cleaning and feature engineering using Python.
- Calculate financial risk metrics including Expected Loss (EL).
- Connect the processed dataset to Power BI.
- Build interactive dashboards for portfolio monitoring and risk analysis.

---

# Repository Structure

```text
Fintech-Credit-Risk-Portfolio-Analytics/
│
├── README.md
│   └── Executive summary, project overview, setup instructions, and documentation.
│
├── data/
│   ├── loan_portfolio_raw.csv
│   ├── clean_credit_portfolio.csv
│   └── final_credit_portfolio.csv
│
├── sql_scripts/
│   ├── 01_financial_schema.sql
│   │   └── Database creation, table schema, and data model.
│   │
│   └── 02_business_queries.sql
│       └── Business SQL queries for KPIs, portfolio analysis, and credit risk.
│
├── python_notebooks/
│   ├── 01_data_pipeline_cleaning.ipynb
│   │   └── Data cleaning, preprocessing, and feature engineering.
│   │
│   └── 02_expected_loss_modeling.ipynb
│       └── Expected Loss (EL) modeling and financial risk analysis.
│
└── powerbi_dashboard/
    ├── credit_risk_executive.pbix
    │   └── Interactive Power BI dashboard.
    │
    ├── Credit Portfolio Quality.png
    └── Risk Adjusted Portfolio Analysis.png
```

---

# Project Architecture

```text
Raw Loan Portfolio Dataset
          │
          ▼
SQL Server (SSMS)
          │
          ├── Database Schema
          ├── Data Validation
          ├── Data Cleaning
          └── Business Queries
          │
          ▼
Python Analysis
          ├── Data Cleaning
          ├── Feature Engineering
          ├── Risk Categorization
          └── Expected Loss (EL) Modeling
          │
          ▼
Power BI Dashboard
          ├── Credit Portfolio Quality
          └── Risk Adjusted Portfolio Analysis
```

---

# Dashboard Pages

## Credit Portfolio Quality

Provides an executive overview of the loan portfolio through key financial indicators and portfolio health metrics.

### Key Metrics

- Total Portfolio Value
- Outstanding Balance
- Expected Loss
- Total Loans
- Average Interest Rate

### Visuals

- Loan Status Distribution
- Monthly Portfolio Trend
- Outstanding Balance by Risk Bucket
- Portfolio by Employment Length
- Highest Risk Loans

---

## Risk Adjusted Portfolio Analysis

Analyzes financial exposure and borrower risk using credit risk metrics and portfolio segmentation.

### Key Metrics

- Non-Performing Loan (NPL) Ratio
- Average Days Past Due (DPD)
- Recovery Rate
- Expected Loss

### Visuals

- Interest Rate vs Expected Loss
- Expected Loss by Loan Status
- Expected Loss by Risk Bucket
- Employment Length Distribution
- Portfolio Summary Matrix

---

## 📊 Power BI Dashboard

### Dashboard 1: Credit Portfolio Quality

<img width="1307" height="730" alt="Credit Portfolio Quality" src="https://github.com/user-attachments/assets/615ac654-4ea2-4fc4-98af-47e3b8afd183" />

### Dashboard 2: Risk-Adjusted Portfolio Analysis

<img width="1317" height="737" alt="Risk Adjusted Portfolio Analysis" src="https://github.com/user-attachments/assets/69c02160-52df-438b-98b8-04cfe92318aa" />

---

# Features

- Relational database design using SQL Server
- Business KPI generation using SQL
- Credit risk analysis using Days Past Due (DPD)
- Delinquency risk bucket classification
- Financial risk modeling using Expected Loss (EL)
- Data cleaning and feature engineering with Python
- Interactive Power BI dashboards
- Executive-level portfolio reporting
- Modular project organization with clear documentation

---

# Technologies Used

- SQL Server (SSMS)
- SQL
- Python
- Pandas
- NumPy
- Jupyter Notebook
- Power BI
- DAX
- Git & GitHub

---

# Financial Risk Metrics

The project calculates standard portfolio risk metrics including:

- Days Past Due (DPD)
- Outstanding Balance
- Probability of Default (PD)
- Loss Given Default (LGD)
- Exposure at Default (EAD)
- Expected Loss (EL)
- Non-Performing Loan (NPL) Ratio
- Portfolio Exposure

---

# Business Insights Generated

-Developed a pipeline that successfully flagged $410K in toxic credit exposure before actual default maturity.
-Isolated a critical underwriting weakness in mid-tier credit score segments, providing the data evidence needed to restructure credit policy guidelines and safeguard capital margins.
-Built an end-to-end credit risk analytics pipeline that evaluated a 27.73M loan portfolio and quantified 1.33M in expected credit losses using the Expected Loss (PD × LGD × EAD) framework.
-Identified that 5.1% of loans generated 58.4% of total portfolio risk, enabling targeted collection strategies and data-driven credit risk management.
-Reduced portfolio blind spots by isolating Default/Write-Off and Late loans as the primary contributors to expected losses, supporting better provisioning and lending decisions.

---

# Future Enhancements

- Machine Learning-based Probability of Default prediction
- Credit score integration
- Loan default forecasting
- Customer risk segmentation
- Automated ETL pipeline
- Real-time dashboard refresh
- Cloud deployment using Azure SQL Database and Power BI Service

---

# Author

**Khushi Jain**

Aspiring Data Analyst

**Skills:** SQL • Python • Power BI • Excel • Data Visualization • Business Intelligence

**GitHub:** https://github.com/khushi-golecha

---

# License

This project is intended for educational and portfolio purposes.
