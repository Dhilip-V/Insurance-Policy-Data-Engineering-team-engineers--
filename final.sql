CREATE DATABASE insurance_raw;
USE insurance_raw;

CREATE TABLE customer (
customer_id INT,
customer_name VARCHAR(100),
customer_segment VARCHAR(50),
marital_status VARCHAR(20),
gender VARCHAR(10),
dob DATE
);

CREATE TABLE policy (
policy_id INT,
customer_id INT,
policy_name VARCHAR(100),
policy_type VARCHAR(50),
type_desc VARCHAR(100),
policy_term VARCHAR(50),
policy_start_dt DATE,
policy_end_dt DATE
);

CREATE TABLE address (
customer_id INT,
country VARCHAR(50),
region VARCHAR(50),
state VARCHAR(50),
city VARCHAR(50),
postal_code VARCHAR(20)
);

CREATE TABLE transactions (
policy_id INT,
premium_amt DECIMAL(10,2),
total_policy_amt DECIMAL(10,2),
premium_paid_till_date DECIMAL(10,2)
);

SELECT * FROM customer LIMIT 10;
SELECT * FROM policy LIMIT 10;
SELECT * FROM address LIMIT 10;
SELECT * FROM transactions LIMIT 10;

CREATE DATABASE insurance_db;
USE insurance_db;

SHOW TABLES;

USE insurance_raw;
	SELECT * FROM customer_25_proper LIMIT 10;

SELECT * FROM policy_25_proper LIMIT 10;	

SELECT * FROM address_25_proper LIMIT 10;

SELECT * FROM transactions_25_proper LIMIT 10;

SELECT COUNT(*) FROM customer_25_proper;
SELECT COUNT(*) FROM policy_25_proper;
SELECT COUNT(*) FROM address_25_proper;
SELECT COUNT(*) FROM transactions_25_proper;

SELECT 
c.customer_id,
c.customer_name,
c.gender,
c.customer_segment,
p.policy_id,
p.policy_name,
p.policy_type,
a.country,
a.state,
a.city,
t.premium_amt,
t.total_policy_amt
FROM customer_25_proper c
JOIN policy_25_proper p 
ON c.customer_id = p.customer_id
JOIN address_25_proper a 
ON c.customer_id = a.customer_id
JOIN transactions_25_proper t 
ON p.policy_id = t.policy_id
LIMIT 50;

DESCRIBE customer_25_proper;

SELECT 
c.Customer_ID,
c.Customer_Name,
c.Gender,
c.Segment,
p.policy_id,
p.policy_name,
p.policy_type,
a.country,
a.state,
a.city,
t.premium_amt,
t.total_policy_amt
FROM customer_25_proper c
JOIN policy_25_proper p 
ON c.Customer_ID = p.customer_id
JOIN address_25_proper a 
ON c.Customer_ID = a.customer_id
JOIN transactions_25_proper t 
ON p.policy_id = t.policy_id;

DESCRIBE transactions_25_proper;

SELECT 
c.Customer_ID,
c.Customer_Name,
c.Gender,
c.Segment,
p.Policy_ID,
p.Policy_Name,
p.Policy_Type,
a.Country,
a.State,
a.City,
t.Policy_Amount,
t.Premium_Amount,
t.Premium_Amount_Paid_Till_Date
FROM customer_25_proper c
JOIN policy_25_proper p 
ON c.Customer_ID = p.Customer_ID
JOIN address_25_proper a 
ON c.Customer_ID = a.Customer_ID
JOIN transactions_25_proper t 
ON p.Policy_ID = t.Policy_ID;

CREATE TABLE insurance_analysis AS
SELECT 
c.Customer_ID,
c.Customer_Name,
c.Gender,
c.Segment,
p.Policy_Name,
p.Policy_Type,
a.Country,
a.State,
a.City,
t.Policy_Amount,
t.Premium_Amount
FROM customer_25_proper c
JOIN policy_25_proper p 
ON c.Customer_ID = p.Customer_ID
JOIN address_25_proper a 
ON c.Customer_ID = a.Customer_ID
JOIN transactions_25_proper t 
ON p.Policy_ID = t.Policy_ID;

SELECT * FROM insurance_analysis LIMIT 20;

SELECT SUM(Policy_Amount) FROM insurance_analysis;

SELECT * 
FROM customer_25_proper
WHERE Customer_ID IS NULL OR Customer_Name IS NULL;

SELECT * 
FROM transactions_25_proper
WHERE Policy_ID IS NULL;

DELETE FROM customer_25_proper
WHERE Customer_ID IS NULL;

SELECT * FROM customer_25_proper WHERE Customer_ID IS NULL OR Customer_Name IS NULL;


SELECT * FROM transactions_25_proper WHERE Policy_ID IS NULL;


SELECT SUM(Policy_Amount)
FROM insurance_analysis;

SELECT Policy_Amount 
FROM insurance_analysis 
LIMIT 20;

SELECT SUM(IFNULL(Policy_Amount,0)) 
FROM insurance_analysis;

SELECT COUNT(*) 
FROM insurance_analysis;

SELECT COUNT(*) 
FROM insurance_analysis;

SELECT Segment, COUNT(*)
FROM insurance_analysis
GROUP BY Segment;

SELECT COUNT(*) FROM customer_25_proper;
SELECT COUNT(*) FROM policy_25_proper;
SELECT COUNT(*) FROM address_25_proper;
SELECT COUNT(*) FROM transactions_25_proper;


DESCRIBE customer_25_proper;
DESCRIBE policy_25_proper;
DESCRIBE address_25_proper;
DESCRIBE transactions_25_proper;

SELECT *
FROM customer_25_proper
WHERE Customer_ID IS NULL
OR Customer_Name IS NULL;

SELECT *
FROM transactions_25_proper
WHERE Policy_ID IS NULL;

SELECT Customer_ID, COUNT(*)
FROM customer_25_proper
GROUP BY Customer_ID
HAVING COUNT(*) > 1;

SELECT 
c.Customer_ID,
c.Customer_Name,
c.Segment,
c.Gender,
p.Policy_ID,
p.Policy_Type,
a.Country,
a.State,
a.City,
t.Policy_Amount
FROM customer_25_proper c
LEFT JOIN policy_25_proper p
ON c.Customer_ID = p.Customer_ID
LEFT JOIN address_25_proper a
ON c.Customer_ID = a.Customer_ID
LEFT JOIN transactions_25_proper t
ON p.Policy_ID = t.Policy_ID
LIMIT 20;

SELECT Customer_ID
FROM customer_25_proper
LIMIT 10;

SELECT Customer_ID
FROM policy_25_proper
LIMIT 10;

SELECT *
FROM policy_25_proper
LIMIT 20;

SELECT 
c.Customer_ID,
c.Customer_Name,
c.Segment,
c.Gender,
p.Policy_ID,
p.Policy_Type
FROM customer_25_proper c
LEFT JOIN policy_25_proper p
ON c.Customer_ID = p.Customer_ID
LIMIT 20;

SELECT Customer_ID 
FROM customer_25_proper 
LIMIT 10;

SELECT *
FROM policy_25_proper
LIMIT 20;

SELECT c.Customer_ID
FROM customer_25_proper c
LEFT JOIN policy_25_proper p
ON c.Customer_ID = p.Customer_ID
WHERE p.Customer_ID IS NULL;

CREATE TABLE insurance_analysis AS
SELECT 
c.Customer_ID,
c.Customer_Name,
c.Segment,
c.Gender,
p.Policy_ID,
p.Policy_Type,
a.Country,
a.State,
a.City,
t.Policy_Amount
FROM customer_25_proper c
LEFT JOIN policy_25_proper p
ON c.Customer_ID = p.Customer_ID
LEFT JOIN address_25_proper a
ON c.Customer_ID = a.Customer_ID
LEFT JOIN transactions_25_proper t
ON p.Policy_ID = t.Policy_ID;

DROP TABLE insurance_analysis;

CREATE TABLE insurance_analysis AS
SELECT 
c.Customer_ID,
c.Customer_Name,
c.Segment,
c.Gender,
p.Policy_ID,
p.Policy_Type,
a.Country,
a.State,
a.City,
t.Policy_Amount
FROM customer_25_proper c
LEFT JOIN policy_25_proper p
ON c.Customer_ID = p.Customer_ID
LEFT JOIN address_25_proper a
ON c.Customer_ID = a.Customer_ID
LEFT JOIN transactions_25_proper t
ON p.Policy_ID = t.Policy_ID;

SELECT Segment, COUNT(*)
FROM insurance_analysis
GROUP BY Segment;

SELECT 
c.Customer_ID,
c.Customer_Name,
p.Policy_Type AS Current_Policy_Type,
p.Policy_ID AS Current_Policy_ID,
p.Policy_Name AS Current_Policy_Name,
p2.Policy_Type AS Previous_Policy_Type,
p2.Policy_ID AS Previous_Policy_ID,
p2.Policy_Name AS Previous_Policy_Name
FROM policy_25_proper p
JOIN policy_25_proper p2
ON p.Customer_ID = p2.Customer_ID
AND p.Policy_ID > p2.Policy_ID
JOIN customer_25_proper c
ON c.Customer_ID = p.Customer_ID
WHERE p.Policy_Type <> p2.Policy_Type;

SELECT Customer_ID, Policy_Type
FROM policy_25_proper
ORDER BY Customer_ID;

SELECT Customer_ID, COUNT(*)
FROM policy_25_proper
GROUP BY Customer_ID
HAVING COUNT(*) > 1;	

DESCRIBE policy_25_proper;

INSERT INTO policy_25_proper
(Type_Description, Policy_Name, Start_Date, Policy_Type, Policy_ID, Policy_Term, End_Date, Customer_ID)
VALUES
('Auto Insurance','Auto Protect','2012-01-01','Auto',999,'Quarterly','2013-01-01','1');

SELECT *
FROM policy_25_proper
WHERE Customer_ID = '1';

SELECT 
c.Customer_ID,
c.Customer_Name,
p.Policy_Type AS Current_Policy_Type,
p.Policy_ID AS Current_Policy_ID,
p2.Policy_Type AS Previous_Policy_Type,
p2.Policy_ID AS Previous_Policy_ID
FROM policy_25_proper p
JOIN policy_25_proper p2
ON p.Customer_ID = p2.Customer_ID
AND p.Policy_ID > p2.Policy_ID
JOIN customer_25_proper c
ON c.Customer_ID = p.Customer_ID
WHERE p.Policy_Type <> p2.Policy_Type;

SELECT Customer_ID, Policy_ID, Policy_Type
FROM policy_25_proper
WHERE Customer_ID = '1';

INSERT INTO policy_25_proper
(Type_Description, Policy_Name, Start_Date, Policy_Type, Policy_ID, Policy_Term, End_Date, Customer_ID)
VALUES
('Life Insurance','Life Protect','2011-01-01','Life',100,'Yearly','2012-01-01','1');

SELECT Customer_ID, Policy_ID, Policy_Type
FROM policy_25_proper
WHERE Customer_ID = '1';

SELECT 
c.Customer_ID,
c.Customer_Name,
p.Policy_Type AS Current_Policy_Type,
p.Policy_ID AS Current_Policy_ID,
p2.Policy_Type AS Previous_Policy_Type,
p2.Policy_ID AS Previous_Policy_ID
FROM policy_25_proper p
JOIN policy_25_proper p2
ON p.Customer_ID = p2.Customer_ID
AND p.Policy_ID > p2.Policy_ID
JOIN customer_25_proper c
ON c.Customer_ID = p.Customer_ID
WHERE p.Policy_Type <> p2.Policy_Type;

SELECT 
c.Customer_ID,
c.Customer_Name,
p.Policy_Type AS Current_Policy_Type,
p.Policy_ID AS Current_Policy_ID,
p.Policy_Name AS Current_Policy_Name,
p2.Policy_Type AS Previous_Policy_Type,
p2.Policy_ID AS Previous_Policy_ID,
p2.Policy_Name AS Previous_Policy_Name
FROM policy_25_proper p
JOIN policy_25_proper p2
ON p.Customer_ID = p2.Customer_ID
AND p.Policy_ID > p2.Policy_ID
JOIN customer_25_proper c
ON c.Customer_ID = p.Customer_ID
WHERE p.Policy_Type <> p2.Policy_Type;

SELECT 
c.Customer_ID,
c.Customer_Name,
a.Region,
SUM(t.Policy_Amount) AS Total_Policy_Amt
FROM customer_25_proper c
JOIN policy_25_proper p
ON c.Customer_ID = p.Customer_ID
JOIN address_25_proper a
ON c.Customer_ID = a.Customer_ID
JOIN transactions_25_proper t
ON p.Policy_ID = t.Policy_ID
GROUP BY c.Customer_ID, c.Customer_Name, a.Region;

SELECT 
c.Customer_ID,
c.Customer_Name,
a.Region,
SUM(t.Policy_Amount) AS Total_Policy_Amt
FROM customer_25_proper c
LEFT JOIN policy_25_proper p
ON c.Customer_ID = p.Customer_ID
LEFT JOIN address_25_proper a
ON c.Customer_ID = a.Customer_ID
LEFT JOIN transactions_25_proper t
ON p.Policy_ID = t.Policy_ID
GROUP BY c.Customer_ID, c.Customer_Name, a.Region;

SELECT * 
FROM address_25_proper
LIMIT 10;

SELECT * 
FROM transactions_25_proper
LIMIT 10;

SELECT 
c.Customer_ID,
p.Policy_ID,
a.Region,
t.Policy_Amount
FROM customer_25_proper c
LEFT JOIN policy_25_proper p
ON c.Customer_ID = p.Customer_ID
LEFT JOIN address_25_proper a
ON c.Customer_ID = a.Customer_ID
LEFT JOIN transactions_25_proper t
ON p.Policy_ID = t.Policy_ID;


SELECT Customer_ID, Region
FROM address_25_proper;

SELECT Policy_ID, Policy_Amount
FROM transactions_25_proper;

SELECT 
c.Customer_ID,
c.Customer_Name,
IFNULL(a.Region,'All') AS Region,
COUNT(p.Policy_ID) AS Total_Policies
FROM customer_25_proper c
LEFT JOIN policy_25_proper p
ON c.Customer_ID = p.Customer_ID
LEFT JOIN address_25_proper a
ON c.Customer_ID = a.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name, a.Region;