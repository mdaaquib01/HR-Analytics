/*==============================================================
  HR ANALYTICS PROJECT
  FILE: 01_create_table.sql

  Purpose:
  Create the employees table with appropriate data types and
  constraints before importing the HR Analytics dataset.
==============================================================*/


-- ============================================================
-- Create Employees Table
-- ============================================================

CREATE TABLE employees (
    Age                      INT,
    Attrition                VARCHAR(10),
    BusinessTravel           VARCHAR(50),
    DailyRate                INT,
    Department               VARCHAR(50),
    DistanceFromHome         INT,
    Education                INT,
    EducationField           VARCHAR(50),
    EmployeeCount            INT,
    EmployeeNumber           INT PRIMARY KEY,
    EnvironmentSatisfaction  INT,
    Gender                   VARCHAR(10),
    HourlyRate               INT,
    JobInvolvement           INT,
    JobLevel                 INT,
    JobRole                  VARCHAR(100),
    JobSatisfaction          INT,
    MaritalStatus            VARCHAR(20),
    MonthlyIncome            INT,
    MonthlyRate              INT,
    NumCompaniesWorked       INT,
    Over18                   VARCHAR(5),
    OverTime                 VARCHAR(10),
    PercentSalaryHike        INT,
    PerformanceRating        INT,
    RelationshipSatisfaction INT,
    StandardHours            INT,
    StockOptionLevel         INT,
    TotalWorkingYears        INT,
    TrainingTimesLastYear    INT,
    WorkLifeBalance          INT,
    YearsAtCompany           INT,
    YearsInCurrentRole       INT,
    YearsSinceLastPromotion  INT,
    YearsWithCurrManager     INT
);



-- ============================================================
-- Import Dataset
-- ============================================================

/*
The dataset was imported into PostgreSQL using the Import/Export
Data feature available in pgAdmin.


/*==============================================================
Notes

This script prepares the database by creating the employees table
with appropriate data types and defining EmployeeNumber as the
primary key to ensure each employee record is uniquely identified.

After creating the table, the HR Analytics dataset is imported
from the CSV file and becomes the foundation for all subsequent
validation and business analysis.

SQL concepts demonstrated:
• CREATE TABLE
• Data Types
• PRIMARY KEY Constraint
==============================================================*/























