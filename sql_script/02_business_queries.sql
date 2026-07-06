/*
=========================================================
 Project : Fintech Credit Risk & Portfolio Analytics
 File    : 02_business_queries.sql
 Author  : Khushi Jain
 Purpose : Business KPI & Credit Risk Analysis
=========================================================
*/

----------------------------------------------------------
-- 1. Total Number of Loans
----------------------------------------------------------

SELECT
COUNT(*) AS TotalLoans
FROM loan_portfolio_raw;

----------------------------------------------------------
-- 2. Total Portfolio Value
----------------------------------------------------------

SELECT
SUM(loan_amount) AS TotalPortfolioValue
FROM loan_portfolio_raw;

----------------------------------------------------------
-- 3. Average Loan Amount
----------------------------------------------------------

SELECT
AVG(loan_amount) AS AverageLoanAmount
FROM loan_portfolio_raw;

----------------------------------------------------------
-- 4. Average Interest Rate
----------------------------------------------------------

SELECT
AVG(interest_rate) AS AverageInterestRate
FROM loan_portfolio_raw;

----------------------------------------------------------
-- 5. Portfolio by Loan Status
----------------------------------------------------------

SELECT

loan_status,

COUNT(*) AS NumberOfLoans,

SUM(loan_amount) AS PortfolioValue

FROM loan_portfolio_raw

GROUP BY loan_status

ORDER BY PortfolioValue DESC;

----------------------------------------------------------
-- 6. Annual Income Statistics
----------------------------------------------------------

SELECT

MIN(annual_income) AS MinimumIncome,

MAX(annual_income) AS MaximumIncome,

AVG(annual_income) AS AverageIncome

FROM loan_portfolio_raw;

----------------------------------------------------------
-- 7. Outstanding Balance
----------------------------------------------------------

SELECT

loan_id,

loan_amount,

amount_paid,

(loan_amount-amount_paid) AS OutstandingBalance

FROM loan_portfolio_raw

ORDER BY OutstandingBalance DESC;

----------------------------------------------------------
-- 8. Days Past Due (DPD)
----------------------------------------------------------

SELECT

loan_id,

scheduled_payment_date,

actual_payment_date,

DATEDIFF
(
DAY,
scheduled_payment_date,
ISNULL(actual_payment_date,GETDATE())
) AS DaysPastDue

FROM loan_portfolio_raw;

----------------------------------------------------------
-- 9. Delinquency Risk Buckets
----------------------------------------------------------

SELECT

loan_id,

DATEDIFF
(
DAY,
scheduled_payment_date,
ISNULL(actual_payment_date,GETDATE())
) AS DaysPastDue,

CASE

WHEN DATEDIFF(DAY,
scheduled_payment_date,
ISNULL(actual_payment_date,GETDATE()))

BETWEEN 0 AND 30

THEN 'Bucket 1 (Low Risk)'

WHEN DATEDIFF(DAY,
scheduled_payment_date,
ISNULL(actual_payment_date,GETDATE()))

BETWEEN 31 AND 60

THEN 'Bucket 2 (Medium Risk)'

WHEN DATEDIFF(DAY,
scheduled_payment_date,
ISNULL(actual_payment_date,GETDATE()))

BETWEEN 61 AND 90

THEN 'Bucket 3 (High Risk)'

ELSE 'Default / Write-Off'

END AS DelinquencyTier

FROM loan_portfolio_raw;

----------------------------------------------------------
-- 10. Highest Risk Loans
----------------------------------------------------------

SELECT TOP 20

loan_id,

loan_amount,

loan_status,

amount_paid,

(loan_amount-amount_paid) AS OutstandingBalance

FROM loan_portfolio_raw

ORDER BY OutstandingBalance DESC;

----------------------------------------------------------
-- 11. Portfolio by Employment Length
----------------------------------------------------------

SELECT

employment_length,

COUNT(*) AS TotalLoans,

SUM(loan_amount) AS PortfolioValue

FROM loan_portfolio_raw

GROUP BY employment_length

ORDER BY PortfolioValue DESC;

----------------------------------------------------------
-- 12. Interest Revenue Estimate
----------------------------------------------------------

SELECT

loan_id,

loan_amount,

interest_rate,

(loan_amount * interest_rate /100) AS EstimatedInterestRevenue

FROM loan_portfolio_raw

ORDER BY EstimatedInterestRevenue DESC;

----------------------------------------------------------
-- 13. Portfolio Health Summary
----------------------------------------------------------

SELECT

COUNT(*) AS TotalLoans,

SUM(loan_amount) AS PortfolioValue,

SUM(amount_paid) AS TotalRecovered,

SUM(loan_amount-amount_paid) AS OutstandingBalance,

AVG(interest_rate) AS AverageInterestRate

FROM loan_portfolio_raw;

----------------------------------------------------------
-- 14. Risk Categorization using CTE
----------------------------------------------------------

WITH RiskAnalysis AS
(
SELECT

loan_id,

loan_amount,

loan_status,

DATEDIFF
(
DAY,
scheduled_payment_date,
ISNULL(actual_payment_date,GETDATE())
) AS DaysPastDue,

loan_amount-amount_paid AS OutstandingBalance

FROM loan_portfolio_raw
)

SELECT *

FROM RiskAnalysis

ORDER BY DaysPastDue DESC;

----------------------------------------------------------
-- 15. Non-Performing Loan (NPL) Ratio
----------------------------------------------------------

SELECT
CAST(
100.0 *
SUM(CASE WHEN loan_status IN ('Late','Default') THEN loan_amount ELSE 0 END)
/
SUM(loan_amount)
AS DECIMAL(10,2)
) AS NPL_Ratio_Percentage
FROM loan_portfolio_raw;