/*==============================================================
  HR ANALYTICS PROJECT
  FILE: 02_data_validation_and_EDA.sql

  Purpose:
  Validate the imported dataset and perform an initial
  exploratory analysis to understand workforce composition
  and key HR metrics.
==============================================================*/


/*==============================================================
                    DATA VALIDATION
==============================================================*/


-- ============================================================
-- 1. Total Number of Records
-- Purpose: Verify that all employee records have been imported
-- successfully.
-- ============================================================

SELECT COUNT(*) AS total_employees
FROM employees;



-- ============================================================
-- 2. Preview Dataset
-- Purpose: Inspect the dataset structure and verify that the
-- data has been imported correctly.
-- ============================================================

SELECT *
FROM employees
LIMIT 5;



-- ============================================================
-- 3. Check for Duplicate Employee Records
-- Purpose: Ensure EmployeeNumber is unique for every employee.
-- ============================================================

SELECT
    EmployeeNumber,
    COUNT(*) AS duplicate_count
FROM employees
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;



-- ============================================================
-- 4. Check for Missing Employee Numbers
-- Purpose: Verify that the primary key contains no NULL values.
-- ============================================================

SELECT *
FROM employees
WHERE EmployeeNumber IS NULL;



/*==============================================================
              EXPLORATORY DATA ANALYSIS (EDA)
==============================================================*/


-- ============================================================
-- 5. Total Employee Count
-- Purpose: Confirm the total workforce size before analysis.
-- ============================================================

SELECT COUNT(*) AS total_employees
FROM employees;



-- ============================================================
-- 6. Employee Distribution by Department
-- Purpose: Understand how employees are distributed across
-- departments.
-- ============================================================

SELECT
    Department,
    COUNT(*) AS total_employees
FROM employees
GROUP BY Department
ORDER BY total_employees DESC;



-- ============================================================
-- 7. Employee Distribution by Job Role
-- Purpose: Analyze the workforce composition by job role.
-- ============================================================

SELECT
    JobRole,
    COUNT(*) AS total_employees
FROM employees
GROUP BY JobRole
ORDER BY total_employees DESC;



-- ============================================================
-- 8. Employee Attrition Overview
-- Purpose: Compare the number of current and former employees.
-- ============================================================

SELECT
    Attrition,
    COUNT(*) AS total_employees
FROM employees
GROUP BY Attrition;



-- ============================================================
-- 9. Average Monthly Income
-- Purpose: Calculate the average monthly salary across all
-- employees.
-- ============================================================

SELECT
    ROUND(AVG(MonthlyIncome), 2) AS avg_monthly_income
FROM employees;



/*==============================================================
Notes

Before performing business analysis, it is important to validate
the dataset to ensure data quality and consistency. This includes
verifying record counts, checking for duplicate employee IDs, and
confirming that the primary key contains no missing values.

After validation, an initial exploratory data analysis (EDA) is
performed to understand the workforce composition, employee
distribution, attrition status, and average compensation. These
findings provide the foundation for deeper HR analyses such as
employee demographics, attrition, salary benchmarking, and
performance evaluation.

SQL concepts demonstrated:
• SELECT
• LIMIT
• GROUP BY
• HAVING
• Aggregate Functions (COUNT, AVG)
• ORDER BY
• Data Validation Techniques
==============================================================*/





























