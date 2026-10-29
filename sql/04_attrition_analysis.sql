/*==============================================================
  HR ANALYTICS PROJECT
  FILE: 04_attrition_analysis.sql

  Purpose:
  Analyze employee attrition across different workforce
  segments to identify patterns and potential drivers of
  employee turnover.
==============================================================*/


-- ============================================================
-- 1. Overall Attrition Rate
-- Purpose: Calculate the percentage of employees who have left
-- the organization.
-- ============================================================

SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees;



-- ============================================================
-- 2. Attrition by Department
-- Purpose: Compare employee turnover across departments.
-- ============================================================

SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY Department
ORDER BY attrition_rate DESC;



-- ============================================================
-- 3. Attrition by Job Role
-- Purpose: Identify job roles with the highest turnover.
-- ============================================================

SELECT
    JobRole,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY JobRole
ORDER BY attrition_rate DESC;



-- ============================================================
-- 4. Attrition by Gender
-- Purpose: Compare attrition rates across gender groups.
-- ============================================================

SELECT
    Gender,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY Gender;



-- ============================================================
-- 5. Attrition by Marital Status
-- Purpose: Analyze whether marital status is associated with
-- employee turnover.
-- ============================================================

SELECT
    MaritalStatus,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY MaritalStatus
ORDER BY attrition_rate DESC;



-- ============================================================
-- 6. Attrition by Overtime Status
-- Purpose: Evaluate the relationship between overtime and
-- employee turnover.
-- ============================================================

SELECT
    OverTime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY OverTime
ORDER BY attrition_rate DESC;



-- ============================================================
-- 7. Attrition by Salary Band
-- Purpose: Compare attrition across different income groups.
-- ============================================================

SELECT
    CASE
        WHEN MonthlyIncome < 5000 THEN 'Low'
        WHEN MonthlyIncome BETWEEN 5000 AND 10000 THEN 'Medium'
        WHEN MonthlyIncome BETWEEN 10001 AND 15000 THEN 'High'
        ELSE 'Very High'
    END AS salary_band,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY salary_band
ORDER BY attrition_rate DESC;



-- ============================================================
-- 8. Attrition by Age Group
-- Purpose: Analyze employee turnover across different age
-- categories.
-- ============================================================

SELECT
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 39 THEN '30–39'
        WHEN Age BETWEEN 40 AND 49 THEN '40–49'
        ELSE '50+'
    END AS age_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY age_group
ORDER BY age_group;



/*==============================================================
Notes

Employee attrition is one of the most important HR metrics because
it measures workforce turnover and helps identify where employees
are most likely to leave.

This analysis segments attrition by department, job role, gender,
marital status, overtime, salary band, and age group to uncover
patterns that can support retention strategies and workforce
planning.

SQL concepts demonstrated:
• CASE Expressions
• Conditional Aggregation
• GROUP BY
• Aggregate Functions
• ORDER BY
• Business Segmentation
==============================================================*/

















































