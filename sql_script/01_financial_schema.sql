/*
=========================================================
 Project : Fintech Credit Risk & Portfolio Analytics
 File    : 01_financial_schema.sql
 Author  : Khushi Jain
 Purpose : Create database and financial loan portfolio table
=========================================================
*/

--=======================================================
-- Create Database
--=======================================================

CREATE DATABASE FintechCreditRisk;
GO

USE FintechCreditRisk;
GO

--=======================================================
-- Verify Table
--=======================================================

SELECT *
FROM loan_portfolio_raw;
