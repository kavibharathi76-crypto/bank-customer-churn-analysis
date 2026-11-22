SELECT DB_NAME() AS CurrentDatabase;

USE BankChurnDB;
GO

SELECT CAST(Exited AS INT) AS ExitedNumber
FROM churn_import;

SELECT TOP 5
    Exited,
    CAST(Exited AS INT) AS ExitedNumber
FROM dbo.churn_import;

select Geography,count(*) as TotalCustomers from churn_import group by geography

SELECT
    Geography,
    SUM(CAST(Exited AS INT)) AS ExitedNumber,
    count(*) as TotalCustomers,
    SUM(CAST(Exited AS INT)) * 100.0 / COUNT(*) AS ChurnRate    
FROM churn_import
GROUP BY Geography;


SELECT
    Gender,
    SUM(CAST(Exited AS INT)) AS ExitedNumber,
    COUNT(*) AS TotalCustomers
FROM churn_import
GROUP BY Gender;


SELECT
    Gender,
    SUM(CAST(Exited AS INT)) AS ExitedNumber,
    count(*) as TotalCustomers,
    SUM(CAST(Exited AS INT)) * 100.0 / COUNT(*) AS ChurnRate    
FROM churn_import
GROUP BY Gender;

SELECT TOP 5 Age
FROM churn_import;

SELECT
    Age,
    CASE
        WHEN Age < 30 THEN 'Under30'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Age BETWEEN 40 AND 49 THEN '40-49'
        WHEN Age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS AgeGroup
FROM dbo.churn_import;

SELECT
    AgeGroup,
    SUM(CAST(Exited AS INT)) AS ExitedNumber,
    COUNT(*) AS TotalCustomers
FROM churn_import
GROUP BY AgeGroup;


with AgeGroups as(
SELECT
    Age,
    CASE
        WHEN Age < 30 THEN 'Under30'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Age BETWEEN 40 AND 49 THEN '40-49'
        WHEN Age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END as AgeGroup,Exited FROM dbo.churn_import)
    
select AgeGroup, count(*) as TotalCustomers, Sum(cast(Exited as INT)) as ExitedNumber,SUM(CAST(Exited AS INT)) * 100.0 / COUNT(*) AS ChurnRate from AgeGroups group by AgeGroup
 

 SELECT
    IsActiveMember,
    COUNT(*) AS TotalCustomers,
    SUM(CAST(Exited AS INT)) AS ExitedNumber,
    SUM(CAST(Exited AS INT)) * 100.0 / COUNT(*) AS ChurnRate
FROM dbo.churn_import
GROUP BY IsActiveMember;

select 
    NumOfProducts, 
    count(*) as TotalCustomers, 
    sum(cast(Exited as INT)) as ChurnedCustomer,
    sum(cast(Exited as INT)) * 100.0  /  count(*) as ChurnRate 
from churn_import 
group by NumOfProducts

SELECT
    HasCrCard,
    COUNT(*) AS TotalCustomers,
    SUM(CAST(Exited AS INT)) AS ChurnedCustomer,
    SUM(CAST(Exited AS INT)) * 100.0 / COUNT(*) AS ChurnRate
FROM dbo.churn_import
GROUP BY HasCrCard;

SELECT
    Tenure,
    COUNT(*) AS TotalCustomers,
    SUM(CAST(Exited AS INT)) AS ChurnedCustomer,
    SUM(CAST(Exited AS INT)) * 100.0 / COUNT(*) AS ChurnRate
FROM dbo.churn_import
GROUP BY Tenure;

select Exited, Avg(cast(Balance as decimal)) as AvgBalance from churn_import group by Exited

select Exited, Avg(cast(EstimatedSalary as decimal)) as AvgSalary from churn_import group by Exited

select Exited, Avg(cast(CreditScore as decimal)) as AvgCreditScore from churn_import group by Exited


