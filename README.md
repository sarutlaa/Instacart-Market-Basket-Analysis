# Instacart-Market-Basket-Analysis
Building Dimensional Model and SQL Analysis in SnowflakeDB

The primary objective of this project is to construct a dimensional model utilizing Fact and Dimension tables, employing the Star Schema approach. The raw or flat data, residing in Amazon S3, serves as the foundational source for this model. The data model is being developed within the SnowflakeDB data warehouse environment, facilitating the organization and optimization of data for analytical purposes. 

Technologies/Tools used : 
1. SQL in SnowflakeDB
2. Amazon S3 for storing data in a bucket
3. AWS IAM access to the SnowflakeDB
   
Data Source and Data Dictonary : https://www.kaggle.com/c/instacart-market-basket-analysis/data.

Project WorkFlow:
1. Created a bucket in AWS S3 to store all the e-commerce files in the bucket.
   <img width="484" alt="image" src="https://github.com/sarutlaa/Instacart-Market-Basket-Analysis/assets/141533429/d91f712f-3728-4a7b-9ff4-7be62c6a7696">
2. Providing the IAM user access with the "Administrator Access" and stored the access keys.
3. In the SnowflakeDB, a new schema and database is created for the instacart-market-basket data.
   <img width="209" alt="image" src="https://github.com/sarutlaa/Instacart-Market-Basket-Analysis/assets/141533429/97a85c7d-e98a-454e-80e2-a8701a6ff206">
4. Created staging area (preparing Snowflake's environment to access the data from the S3) to maintain flexibility based on user preferences and requirements. In SnowflakeDB, the S3 .csv files have been imported using COPY command. Refer Instacart Fact Dim.sql
5. Identified the data model and constructed the dimension and fact tables.

Instacart Dimension Model:
![Instacart Dim Model](https://github.com/sarutlaa/Instacart-Market-Basket-Analysis/assets/141533429/be98d5ae-df11-4f37-af78-84fd61e73f07)





