CREATE DATABASE Customer;

CREATE TABLE Customer.CustomerChurn_Stage (
    CustomerID INTEGER NOT NULL PRIMARY KEY,
    Surname VARCHAR(50),
    CreditScore INTEGER,
    Geography VARCHAR(50),
    Age TINYINT NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Balance DECIMAL(13, 2) NOT NULL,
    Exited TINYINT(1)
);


CREATE TABLE Customer.CustomerChurn (
    CustomerId INT PRIMARY KEY,
    Surname VARCHAR(50),
    CreditScore INT,
    Geography VARCHAR(50),
    Gender VARCHAR(10),
    Age TINYINT,
    Balance DECIMAL(13, 2),
    Exited TINYINT(1),
    SourceSystemNm NVARCHAR(20) NOT NULL,
    CreateAgentId NVARCHAR(20) NOT NULL,
    CreateDtm DATETIME NOT NULL,
    ChangeAgentId NVARCHAR(20) NOT NULL,
    ChangeDtm DATETIME NOT NULL
);

-- Load Data
LOAD DATA LOCAL INFILE '/Users/ysingh/Downloads/mysql_files_csv/CustomerChurn1.csv'
INTO TABLE Customer.CustomerChurn_Stage
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(CustomerID, Surname, CreditScore, Geography, Gender, Age, Balance, Exited);



-- Q6:
-- Create Customer.CustomerChurn_Version1 table and populate it with data from Customer.CustomerChurn
CREATE TABLE Customer.CustomerChurn_Version1 AS
SELECT * FROM Customer.CustomerChurn;



-- D) Truncate table
TRUNCATE TABLE Customer.CustomerChurn_Stage;

-- D) Load Data
LOAD DATA LOCAL INFILE '/Users/ysingh/Downloads/mysql_files_csv/CustomerChurn2.csv'
INTO TABLE Customer.CustomerChurn_Stage
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(CustomerID, Surname, CreditScore, Geography, Gender, Age, Balance, Exited);


-- Q7
SELECT 'CustomerChurn_Version1' AS TableName, COUNT(*) AS RowCount 
FROM Customer.CustomerChurn_Version1
UNION ALL
SELECT 'CustomerChurn' AS TableName, COUNT(*) AS RowCount 
FROM Customer.CustomerChurn
UNION ALL
SELECT 'CustomerChurn_Stage' AS TableName, COUNT(*) AS RowCount 
FROM Customer.CustomerChurn_Stage;

SELECT V1.*
FROM Customer.CustomerChurn_Version1 V1
LEFT JOIN Customer.CustomerChurn C
ON V1.CustomerId = C.CustomerId
WHERE C.CustomerId IS NULL;

-- **************************

-- To have backup of the current status
RENAME TABLE 
    Customer.CustomerChurn TO Customer.CustomerChurn_Original,
    Customer.CustomerChurn_Stage TO Customer.CustomerChurn_Stage_Original,
    Customer.CustomerChurn_Version1 TO Customer.CustomerChurn_Version1_Original;

-- Create new tables with the original names and copy the data:

CREATE TABLE Customer.CustomerChurn AS SELECT * FROM Customer.CustomerChurn_Original;
CREATE TABLE Customer.CustomerChurn_Stage AS SELECT * FROM Customer.CustomerChurn_Stage_Original;
CREATE TABLE Customer.CustomerChurn_Version1 AS SELECT * FROM Customer.CustomerChurn_Version1_Original;

-- To revert changes at any point:

DROP TABLE Customer.CustomerChurn, Customer.CustomerChurn_Stage, Customer.CustomerChurn_Version1;

RENAME TABLE 
    Customer.CustomerChurn_Original TO Customer.CustomerChurn,
    Customer.CustomerChurn_Stage_Original TO Customer.CustomerChurn_Stage,
    Customer.CustomerChurn_Version1_Original TO Customer.CustomerChurn_Version1;
-- **************************