/*==============================================================
  HR ANALYTICS PROJECT
  FILE: 03_employee_demographics.sql

  Purpose:
  Analyze the demographic composition of the workforce to
  understand employee distribution across gender, marital
  status, education, job roles, age, and salary.
==============================================================*/


-- ============================================================
-- 1. Employee Distribution by Gender
-- Purpose: Understand the gender composition of the workforce.
-- ============================================================

SELECT
    Gender,
    COUNT(*) AS total_employees
FROM employees
GROUP BY Gender
ORDER BY total_employees DESC;



-- ============================================================
-- 2. Employee Distribution by Marital Status
-- Purpose: Analyze employees based on marital status.
-- ============================================================

SELECT
    MaritalStatus,
    COUNT(*) AS total_employees
FROM employees
GROUP BY MaritalStatus
ORDER BY total_employees DESC;



-- ============================================================
-- 3. Employee Distribution by Education Field
-- Purpose: Identify the educational background of employees.
-- ============================================================

SELECT
    EducationField,
    COUNT(*) AS total_employees
FROM employees
GROUP BY EducationField
ORDER BY total_employees DESC;



-- ============================================================
-- 4. Employee Distribution by Job Role
-- Purpose: Examine workforce distribution across different job
-- roles.
-- ============================================================

SELECT
    JobRole,
    COUNT(*) AS total_employees
FROM employees
GROUP BY JobRole
ORDER BY total_employees DESC;



-- ============================================================
-- 5. Average Employee Age by Department
-- Purpose: Compare the average age of employees across
-- departments.
-- ============================================================

SELECT
    Department,
    ROUND(AVG(Age), 2) AS avg_age
FROM employees
GROUP BY Department
ORDER BY avg_age DESC;



-- ============================================================
-- 6. Average Monthly Salary by Department
-- Purpose: Compare average employee compensation across
-- departments.
-- ============================================================

SELECT
    Department,
    ROUND(AVG(MonthlyIncome), 2) AS avg_salary
FROM employees
GROUP BY Department
ORDER BY avg_salary DESC;



/*==============================================================
Notes

Understanding workforce demographics is an essential first step
in HR analytics. These queries provide a high-level overview of
employee distribution and help identify patterns related to
gender, education, job roles, age, and compensation.

The insights from this analysis establish a baseline for deeper
analyses such as attrition, performance, salary benchmarking,
and workforce planning.

SQL concepts demonstrated:
• GROUP BY
• Aggregate Functions (COUNT, AVG)
• ROUND()
• ORDER BY
• Business-Oriented Data Summarization
==============================================================*/













































