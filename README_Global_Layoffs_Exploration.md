# Global Layoffs — Exploratory Data Analysis Using SQL

## Project Overview

This project explores a global layoffs dataset using MySQL. The goal is to identify patterns, trends, company-level differences, yearly changes, monthly trends, and yearly rankings in reported layoffs.

This project follows a previous data-cleaning project and focuses specifically on **exploratory analysis** rather than data cleaning.

## Tools

- MySQL
- SQL
- Common Table Expressions (CTEs)
- Window Functions

## Analysis Performed

The project investigates:

1. Maximum total layoffs and maximum layoff percentage
2. Companies that laid off 100% of their workforce
3. 100% layoffs in relation to company funding
4. Total layoffs by company
5. The date range covered by the dataset
6. Total layoffs by year
7. Total layoffs by company stage
8. Layoff percentage patterns by company
9. Monthly layoffs
10. Monthly layoffs with a rolling cumulative total
11. Total layoffs by company and year
12. Top five companies by layoffs for each year
13. Records with missing dates

## SQL Techniques Demonstrated

- `SELECT`
- `WHERE`
- `GROUP BY`
- `ORDER BY`
- Aggregate functions such as `SUM()` and `MAX()`
- Date functions including `YEAR()` and `DATE_FORMAT()`
- Common Table Expressions (`WITH`)
- Window functions
- `DENSE_RANK()`
- `PARTITION BY`
- Conditional filtering

## Key Exploration Questions

The analysis is designed to answer questions such as:

- Which companies recorded the largest numbers of layoffs?
- Which companies reported a 100% layoff rate?
- What years recorded the highest total layoffs?
- How do layoffs vary by company stage?
- How did layoffs change month by month?
- What does the cumulative rolling total look like over time?
- Which companies were among the top five for layoffs in each year?

## Important Note About Findings

The SQL script contains the analysis queries, but this repository does not claim specific numerical findings unless they are supported by saved query results. The purpose is to demonstrate a reproducible SQL exploration workflow.

## Project Structure

```text
global-layoffs-sql-exploration/
├── global_layoffs_exploratory_analysis.sql
└── README.md
```

## What This Project Demonstrates

This project demonstrates the ability to move from a cleaned dataset to structured exploratory analysis using SQL. It also demonstrates the use of CTEs and window functions to investigate trends and rank companies within each year.

## Next Steps

Possible extensions include:

- Creating visualizations from the monthly and yearly results
- Comparing layoffs across industries
- Investigating countries with the highest layoffs
- Building an interactive dashboard in Excel or Power BI
