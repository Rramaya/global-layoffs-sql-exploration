-- GLOBAL LAYOFFS - EXPLORATORY DATA ANALYSIS
-- Purpose:
-- Explore patterns, trends, and key insights in the global
-- layoffs dataset using SQL.



-- 1. VIEW THE DATASET
SELECT *
FROM layoffs_staging3;

-- 2. MAXIMUM LAYOFFS AND LAYOFF PERCENTAGE
SELECT
    MAX(total_laid_off) AS max_total_laid_off,
    MAX(percentage_laid_off) AS max_percentage_laid_off
FROM layoffs_staging3;

-- 3. COMPANIES THAT LAID OFF 100% OF THEIR EMPLOYEES
SELECT *
FROM layoffs_staging3
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

-- 4. COMPANIES WITH 100% LAYOFFS ORDERED BY FUNDING
SELECT *
FROM layoffs_staging3
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

-- 5. TOTAL LAYOFFS BY COMPANY
SELECT
    company,
    SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging3
GROUP BY company
ORDER BY total_laid_off DESC;

-- 6. DATE RANGE OF THE DATASET
SELECT
    MIN(`date`) AS earliest_date,
    MAX(`date`) AS latest_date
FROM layoffs_staging3;

-- 7. TOTAL LAYOFFS BY YEAR
SELECT
    YEAR(`date`) AS year,
    SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging3
WHERE `date` IS NOT NULL
GROUP BY YEAR(`date`)
ORDER BY year DESC;

-- 8. TOTAL LAYOFFS BY COMPANY STAGE
SELECT
    stage,
    SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging3
GROUP BY stage
ORDER BY total_laid_off DESC;

-- 9. TOTAL PERCENTAGE OF LAYOFFS BY COMPANY
SELECT
    company,
    SUM(percentage_laid_off) AS total_percentage_laid_off
FROM layoffs_staging3
GROUP BY company
ORDER BY total_percentage_laid_off DESC;

-- 10. TOTAL LAYOFFS BY MONTH
-- Keeps each month associated with its year.
SELECT
    DATE_FORMAT(`date`, '%Y-%m') AS month,
    SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging3
WHERE `date` IS NOT NULL
GROUP BY DATE_FORMAT(`date`, '%Y-%m')
ORDER BY month;

-- 11. MONTHLY LAYOFFS WITH ROLLING TOTAL
WITH CTE monthly_layoffs AS (
    SELECT
        DATE_FORMAT(`date`, '%Y-%m') AS month,
        SUM(total_laid_off) AS total_laid_off
    FROM layoffs_staging3
    WHERE `date` IS NOT NULL
    GROUP BY DATE_FORMAT(`date`, '%Y-%m')
)
SELECT
    month,
    total_laid_off,
    SUM(total_laid_off) OVER (
        ORDER BY month
    ) AS rolling_total
FROM monthly_layoffs
ORDER BY month;

-- 12. TOTAL LAYOFFS BY COMPANY AND YEAR
SELECT
    company,
    YEAR(`date`) AS year,
    SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging3
WHERE `date` IS NOT NULL
GROUP BY company, YEAR(`date`)
ORDER BY total_laid_off DESC;

-- 13. TOP 5 COMPANIES WITH THE MOST LAYOFFS EACH YEAR
WITH company_year AS (
    SELECT
        company,
        YEAR(`date`) AS year,
        SUM(total_laid_off) AS total_laid_off
    FROM layoffs_staging3
    WHERE `date` IS NOT NULL
    GROUP BY company, YEAR(`date`)
),
company_year_ranked AS (
    SELECT
        company,
        year,
        total_laid_off,
        DENSE_RANK() OVER (
            PARTITION BY year
            ORDER BY total_laid_off DESC
        ) AS ranking
    FROM company_year
)
SELECT
    company,
    year,
    total_laid_off,
    ranking
FROM company_year_ranked
WHERE ranking <= 5
ORDER BY year, ranking;

-- 14. RECORDS WITH MISSING DATES
SELECT
    company,
    `date`
FROM layoffs_staging3
WHERE `date` IS NULL;
