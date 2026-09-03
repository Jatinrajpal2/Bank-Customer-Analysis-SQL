Select * From Bank_Churn

-- Add Age_Group Column 
Alter Table Bank_Churn
Add Age_Group varchar(20)

Update Bank_Churn
Set Age_Group = 
	Case
		When Age <=24 then '18 - 25'
		When Age <=34 then '25 - 35'
		When Age <=44 then '35 - 45'
		When Age <=54 then '45 - 55'
		When Age <=64 then '55 - 65'
		When Age <=74 then '65 - 75'
		When Age <=84 then '75 - 85'
		When Age <=94 then '85 - 95'
	End;


-- Q1. What is the total number of customers?
Select
	COUNT(Distinct CustomerId) as Total_Customers
From Bank_Churn

-- Q2. What is the average credit score of customers?
Select
	AVG(CreditScore) as Avg_Credit_Score
From Bank_Churn

-- Q3. What is the total number of active members?
Select
	COUNT(IsActiveMember) as Total_Active_Members
From Bank_Churn
where IsActiveMember = 1

-- Q4. What is the total number of customers who exited?
Select 
	COUNT(Exited) as Total_Exited 
From Bank_Churn
where Exited = 1

-- Q5. How many customers have a credit card?
Select 
	COUNT(HasCrCard) as Total_Credit_Card 
From Bank_Churn
where HasCrCard = 1 and IsActiveMember = 1

-- Q6. What is the Average Balance of customers?
Select 
	Round(AVG(Balance),3) as Avg_Balance
From Bank_Churn

-- Q7. Which geography has the highest number of customers with a credit card?
Select 
	Geography,
	count(HasCrCard) as Credit_Card
From Bank_Churn
where HasCrCard = 1
Group by Geography
Order by Credit_Card desc

-- Q8. How Many Years did customers stay before exiting?
Select 
	CustomerId,
	Tenure
From Bank_Churn
Where Exited = 1
Group by CustomerId, Tenure

-- Q9. Which Customers are using More Than 2 products?
Select CustomerId, NumOfProducts From Bank_Churn
Where NumOfProducts >2;

-- Q10. Who are the customers with the highest credit scores?
SELECT CustomerId, Surname, CreditScore
FROM Bank_Churn
WHERE CreditScore = (SELECT MAX(CreditScore) FROM Bank_Churn);

-- Q11. Which geography has the average credit score?
Select
	Geography, 
	AVG(CreditScore) as Avg_Credit_Score 
from Bank_Churn 
Group by Geography

-- Q12. Which age group has the number of customers with a credit card?
Select 
	Age_Group,
	COUNT(HasCrCard) as Credit_Card
from Bank_Churn
Where HasCrCard = 1
Group by Age_Group
Order by Credit_Card desc;

-- Q13. Which age group has the highest customer exit rate?
With cte as (
SELECT
    Age_Group,
    SUM(Case When Exited = 1 Then 1 Else 0 End) AS Total_Exited,
    CAST(
        100.0 * SUM(Case When Exited = 1 Then 1 Else 0 End)
        / SUM(SUM(Case When Exited = 1 Then 1 Else 0 End)) OVER ()
        AS DECIMAL(5,2)
    ) AS Exit_Rate
FROM Bank_Churn
GROUP BY Age_Group
)
select Age_Group, Exit_Rate from cte
ORDER BY Exit_Rate DESC;

-- Q14. Which geography has the highest customer exit rate?
SELECT 
	Geography,
	Round(CAST(100.0 * SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) As float) / COUNT(*),2) AS Exit_Rate
FROM Bank_Churn
GROUP BY Geography
ORDER BY Exit_Rate DESC;

-- Q15. Which gender has a higher exit rate?
With Cte as (
SELECT
    Gender,
    SUM(Case When Exited = 1 Then 1 Else 0 End) AS Total_Exited,
    CAST(
        100.0 * SUM(Case When Exited = 1 Then 1 Else 0 End)
        / SUM(SUM(Case When Exited = 1 Then 1 Else 0 End)) OVER ()
        AS DECIMAL(5,2)
    ) AS Exit_Rate
FROM Bank_Churn
GROUP BY Gender
)
Select Gender, Exit_Rate from Cte
ORDER BY Exit_Rate DESC;

-- Q16. What is the number of Active and Exited Customers in each Geography?
Select 
	Geography,
	SUM(Case When IsActiveMember = 1 Then 1 Else 0 End) as Active_Customers,
	SUM(Case When Exited = 1 Then 1 Else 0 End) as Exited_Customers
from Bank_Churn
Group by Geography

SELECT AVG(CAST(Tenure AS FLOAT)) AS Avg_Tenure_Before_Exit
FROM Bank_Churn
WHERE Exited = 1;

-- Avg check tenure customer stay before exit
SELECT round(AVG(cast(Tenure as float)),2) AS Avg_Tenure_Before_Exit
FROM Bank_Churn
WHERE Exited = 1;