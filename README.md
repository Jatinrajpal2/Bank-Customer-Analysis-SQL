Bank Customer Churn Analysis (SQL Project)

📌 Overview

Analyzed a banking dataset of 10,000 customers using MS SQL Server to identify key factors driving customer churn. 
Performed data analysis on customer demographics, account activity, and product usage to uncover high-risk segments. 
Used aggregate functions, CTEs, and window functions to calculate exit rates by age group, gender, and geography. 
Delivered actionable insights to support customer retention strategies, including identification of the highest churn segment (35–45 age group, 34.51% exit rate) 
and key engagement patterns between active and inactive members.

🎯 Objective

Understand customer churn behavior and identify high-risk customer segments 
Analyze exit rates based on Age, Gender, and Geography
Examine the impact of Credit Score, Balance, and Product usage on churn
Compare active vs inactive members to understand engagement patterns

🛠️ Tools & Technologies

MS SQL Server
SSMS (SQL Server Management Studio)

📊 Dataset
Table Name: Bank_Churn

CustomerId, 
Surname, 
CreditScore, 
Geography, 
Gender, 
Age, 
Tenure,
Balance,
NumOfProducts,
HasCrCard,
IsActiveMember,
EstimatedSalary,
Exited,
Age_Group

❓ Business Problems Solved

What is the total number of customers?
What is the average credit score of customers?
What is the total number of active members?
What is the total number of customers who exited?
How many customers have a credit card?
What is the average balance of customers?
Which geography has the most customers with a credit card?
How many years did customers stay before exiting?
Which customers are using more than 2 products?
Who are the customers with the highest credit scores?
Which geography has the highest average credit score?
Which age group has the most customers with a credit card?
Which age group has the highest customer exit rate?
Which geography has the highest customer exit rate?
Which gender has a higher exit rate?
What is the number of active and exited customers in each geography?

💡 Key Insights

There are 10,000 total customers, of which 5,151 are active (51.5%) and 2,037 have exited (20.4%)
France has the highest number of customers using credit cards (3,543), followed by Germany (1,791) and Spain (1,721)
The highest exit rate is among customers aged 35–45 (34.51%), followed by the 45–55 age group (34.46%)
The highest credit card usage is among customers aged 35–45 (2,812), followed by the 25–35 age group (2,296)
Only 326 customers are using more than two products across the bank's services
The exit rate is higher among female customers (55.92%) than male customers (44.08%)
Exited customers stayed with the bank for an average of 4.9 years before churning

✅ Conclusion

The analysis reveals that customer churn is influenced by a combination of age, geography, gender, and account activity rather than a single factor. 
Customers aged 35–45, female customers, and inactive members show a higher tendency to churn. These insights can help the bank design targeted retention 
strategies, such as personalized engagement programs and focused outreach for high-risk segments, to reduce overall churn rate.
