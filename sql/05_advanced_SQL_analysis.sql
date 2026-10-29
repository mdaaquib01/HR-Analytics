/*==============================================================
  HR ANALYTICS PROJECT
  FILE: 05_advanced_SQL_analysis.sql

  Purpose:
  Apply advanced SQL techniques such as CTEs and window
  functions to answer business questions related to salary,
  experience, promotions, and attrition risk.
==============================================================*/


-- ============================================================
-- 1. Top 5 Highest Paid Employees
-- Purpose: Identify the employees with the highest monthly income.
-- ============================================================

SELECT *
FROM (
    SELECT
        EmployeeNumber,
        JobRole,
        Department,
        MonthlyIncome,
        ROW_NUMBER() OVER (ORDER BY MonthlyIncome DESC) AS rn
    FROM employees
) AS ranked_employees
WHERE rn <= 5;



-- ============================================================
-- 2. Salary Rank Within Each Department
-- Purpose: Rank employees based on salary within their department.
-- ============================================================

SELECT
    EmployeeNumber,
    Department,
    JobRole,
    MonthlyIncome,
    RANK() OVER (
        PARTITION BY Department
        ORDER BY MonthlyIncome DESC
    ) AS salary_rank
FROM employees;



-- ============================================================
-- 3. Highest Paid Employee in Each Department
-- Purpose: Identify the highest-paid employee from every department.
-- ============================================================

WITH salary_rank AS (
    SELECT
        EmployeeNumber,
        Department,
        JobRole,
        MonthlyIncome,
        ROW_NUMBER() OVER (
            PARTITION BY Department
            ORDER BY MonthlyIncome DESC
        ) AS rn
    FROM employees
)

SELECT *
FROM salary_rank
WHERE rn = 1;



-- ============================================================
-- 4. Department Salary Statistics
-- Purpose: Compare each employee's salary with department-level
-- salary statistics.
-- ============================================================

SELECT
    EmployeeNumber,
    Department,
    MonthlyIncome,
    AVG(MonthlyIncome) OVER (PARTITION BY Department) AS avg_salary,
    MAX(MonthlyIncome) OVER (PARTITION BY Department) AS highest_salary,
    MIN(MonthlyIncome) OVER (PARTITION BY Department) AS lowest_salary
FROM employees;



-- ============================================================
-- 5. Employees Earning Above Department Average
-- Purpose: Identify employees whose salary is above the average
-- salary of their department.
-- ============================================================

WITH dept_salary AS (
    SELECT
        Department,
        AVG(MonthlyIncome) AS avg_salary
    FROM employees
    GROUP BY Department
)

SELECT
    e.EmployeeNumber,
    e.Department,
    e.MonthlyIncome
FROM employees AS e
JOIN dept_salary AS d
    ON e.Department = d.Department
WHERE e.MonthlyIncome > d.avg_salary
ORDER BY
    e.Department,
    e.MonthlyIncome DESC;



-- ============================================================
-- 6. Experience Ranking
-- Purpose: Rank employees based on total working experience.
-- ============================================================

SELECT
    EmployeeNumber,
    JobRole,
    TotalWorkingYears,
    DENSE_RANK() OVER (
        ORDER BY TotalWorkingYears DESC
    ) AS experience_rank
FROM employees;



-- ============================================================
-- 7. Top 3 Most Experienced Employees in Each Department
-- Purpose: Identify the most experienced employees within each
-- department.
-- ============================================================

WITH experience_rank AS (
    SELECT
        EmployeeNumber,
        Department,
        JobRole,
        TotalWorkingYears,
        DENSE_RANK() OVER (
            PARTITION BY Department
            ORDER BY TotalWorkingYears DESC
        ) AS experience_rank
    FROM employees
)

SELECT *
FROM experience_rank
WHERE experience_rank <= 3;



-- ============================================================
-- 8. Salary Difference from Department Average
-- Purpose: Compare each employee's salary against the average
-- salary of their department.
-- ============================================================

SELECT
    EmployeeNumber,
    Department,
    MonthlyIncome,
    AVG(MonthlyIncome) OVER (PARTITION BY Department) AS department_average_salary,
    MonthlyIncome -
    AVG(MonthlyIncome) OVER (PARTITION BY Department) AS salary_difference
FROM employees;



-- ============================================================
-- 9. Employees Eligible for Promotion
-- Business Rule:
-- • Years Since Last Promotion >= 5
-- • Performance Rating = 4
-- ============================================================

SELECT
    EmployeeNumber,
    JobRole,
    YearsSinceLastPromotion,
    PerformanceRating
FROM employees
WHERE YearsSinceLastPromotion >= 5
  AND PerformanceRating = 4;



-- ============================================================
-- 10. Employee Attrition Risk Categories
-- Purpose: Classify employees into attrition risk groups using
-- overtime and job satisfaction.
-- ============================================================

SELECT
    EmployeeNumber,
    JobRole,
    MonthlyIncome,
    OverTime,
    JobSatisfaction,
    CASE
        WHEN OverTime = 'Yes'
             AND JobSatisfaction <= 2
            THEN 'High Risk'

        WHEN JobSatisfaction = 3
            THEN 'Medium Risk'

        ELSE 'Low Risk'
    END AS attrition_risk
FROM employees;



/*==============================================================
Notes

This file demonstrates advanced SQL techniques commonly used in
business reporting and workforce analytics.

The analysis applies CTEs and window functions to rank employees,
compare salaries within departments, identify promotion candidates,
and categorize attrition risk. These techniques help transform
employee-level data into actionable business insights for HR
decision-making.

SQL concepts demonstrated:
• Common Table Expressions (CTEs)
• ROW_NUMBER()
• RANK()
• DENSE_RANK()
• Window Aggregate Functions
• PARTITION BY
• CASE Expressions
• Business Rule Implementation
==============================================================*/









































