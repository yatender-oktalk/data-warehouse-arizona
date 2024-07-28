-- Q1
CREATE DATABASE IF NOT EXISTS Worker;
SHOW DATABASES;

-- Q2

USE Worker;

CREATE TABLE Department (
    DepartmentID TINYINT NOT NULL,
    DepartmentNm CHAR(30) NOT NULL,
    PRIMARY KEY (DepartmentID)
);

SHOW CREATE TABLE Department;

INSERT INTO Department (DepartmentID, DepartmentNm) VALUES
(1, 'Research & Development'),
(2, 'Production'),
(3, 'IT Support'),
(4, 'Operations'),
(5, 'Customer Service'),
(6, 'Purchasing'),
(7, 'Sales & Marketing'),
(8, 'Human Resource Management'),
(9, 'Accounting and Finance'),
(10, 'Legal Department');

SELECT * FROM Department ORDER BY DepartmentID;

-- Q3

CREATE TABLE Employee (
    EmployeeID INTEGER NOT NULL,
    DepartmentID TINYINT NOT NULL,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    PhoneNumberTxt VARCHAR(15),
    HireDate DATE NOT NULL,
    PRIMARY KEY (EmployeeID),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

SHOW CREATE TABLE Employee;

INSERT INTO Employee (EmployeeID, DepartmentID, FirstName, LastName, Address, PhoneNumberTxt, HireDate) VALUES
(1, 2, 'Andy', 'Wong', '345 South Street', '603-555-6880', '2001-01-15'),
(2, 3, 'Vivek', 'Pandey', '15 Mineral Drive', '603-555-4420', '2003-11-15'),
(3, 8, 'Kathy', 'Cooper', '15 Hatter Drive', '212-555-9630', '2011-11-18'),
(4, 1, 'John', 'Wilson', '560 Broadway', '518-555-6690', '2017-03-19'),
(5, 7, 'Nola', 'Davis', '15 Long Ave', '478-555-8822', '2016-03-23'),
(6, 9, 'Tom', 'Harper', '64 Highland Street', '212-555-7755', '2010-04-11');

SELECT * FROM Employee ORDER BY EmployeeID;

-- Q4

CREATE TABLE Equipment (
    EquipmentID INTEGER NOT NULL,
    EquipmentName VARCHAR(30) NOT NULL,
    EquipmentCostAmount DECIMAL(13, 2) NOT NULL,
    Currency VARCHAR(3) NOT NULL DEFAULT 'USD',
    PRIMARY KEY (EquipmentID)
);

SHOW CREATE TABLE Equipment;

INSERT INTO Equipment (EquipmentID, EquipmentName, EquipmentCostAmount, Currency) VALUES
(1, 'Notebook Computers', 1200.00, 'USD'),
(2, 'Headsets', 150.00, 'USD'),
(3, 'Computer Monitor', 300.00, 'USD'),
(4, 'Multi-Function Printers', 500.00, 'USD'),
(5, 'Projector or Big Screen TV', 1000.00, 'USD'),
(6, 'Servers', 2500.00, 'USD'),
(7, 'Internet Modem', 200.00, 'USD'),
(8, 'Cell Phone', 800.00, 'USD');

SELECT * FROM Equipment ORDER BY EquipmentID;

-- Q5


CREATE TABLE EmployeeEquipment (
    EmployeeID INTEGER NOT NULL,
    EquipmentID INTEGER NOT NULL,
    PRIMARY KEY (EmployeeID, EquipmentID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID)
);

SHOW CREATE TABLE EmployeeEquipment;

INSERT INTO EmployeeEquipment (EmployeeID, EquipmentID) VALUES
(1, 1),  -- Andy Wong needs Notebook Computers
(2, 1),  -- Vivek Pandey needs Notebook Computers
(2, 2),  -- Vivek Pandey needs Headsets
(2, 3),  -- Vivek Pandey needs Computer Monitor
(3, 1),  -- Kathy Cooper needs Notebook Computers
(3, 2),  -- Kathy Cooper needs Headsets
(3, 3),  -- Kathy Cooper needs Computer Monitor
(4, 1),  -- John Wilson needs Notebook Computers
(4, 3),  -- John Wilson needs Computer Monitor
(5, 1),  -- Nola Davis needs Notebook Computers
(5, 2),  -- Nola Davis needs Headsets
(6, 1),  -- Tom Harper needs Notebook Computers
(6, 3);  -- Tom Harper needs Computer Monitor

SELECT * FROM EmployeeEquipment ORDER BY EmployeeID, EquipmentID;

-- Q6

CREATE DATABASE IF NOT EXISTS Worker;

USE Worker;

CREATE TABLE Training (
    TrainingID INTEGER NOT NULL,
    TrainingName VARCHAR(50) NOT NULL,
    PRIMARY KEY (TrainingID)
);

SHOW CREATE TABLE Training;

INSERT INTO Training (TrainingID, TrainingName) VALUES
(1, 'COVID-19 Awareness and Protection Training'),
(2, 'Code of Conduct Training'),
(3, 'Safety Training'),
(4, 'Intro to Python'),
(5, 'Machine Learning'),
(6, 'Microsoft Certifications'),
(7, 'Security and Privacy'),
(8, 'Product Knowledge'),
(9, 'Sales Skills'),
(10, 'Employee Relations'),
(11, 'Travel and Expense Management');

SELECT * FROM Training ORDER BY TrainingID;

-- Q7
CREATE TABLE EmployeeTraining (
    EmployeeID INTEGER NOT NULL,
    TrainingID INTEGER NOT NULL,
    PRIMARY KEY (EmployeeID, TrainingID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (TrainingID) REFERENCES Training(TrainingID)
);

SHOW CREATE TABLE EmployeeTraining;

INSERT INTO EmployeeTraining (EmployeeID, TrainingID) VALUES
(1, 2),  -- Andy Wong needs Code of Conduct Training
(1, 3),  -- Andy Wong needs Safety Training
(2, 2),  -- Vivek Pandey needs Code of Conduct Training
(2, 6),  -- Vivek Pandey needs Microsoft Certifications
(2, 7),  -- Vivek Pandey needs Security and Privacy
(3, 2),  -- Kathy Cooper needs Code of Conduct Training
(3, 10), -- Kathy Cooper needs Employee Relations
(4, 2),  -- John Wilson needs Code of Conduct Training
(4, 4),  -- John Wilson needs Intro to Python
(4, 5),  -- John Wilson needs Machine Learning
(5, 2),  -- Nola Davis needs Code of Conduct Training
(5, 8),  -- Nola Davis needs Product Knowledge
(5, 9),  -- Nola Davis needs Sales Skills
(6, 2),  -- Tom Harper needs Code of Conduct Training
(6, 11); -- Tom Harper needs Travel and Expense Management

SELECT * FROM EmployeeTraining ORDER BY EmployeeID, TrainingID;

-- Q8

CREATE TABLE Trainer (
    TrainerID INTEGER NOT NULL,
    TrainingID INTEGER NOT NULL,
    TrainerFirstName VARCHAR(20) NOT NULL,
    TrainerLastName VARCHAR(20),
    PRIMARY KEY (TrainerID),
    FOREIGN KEY (TrainingID) REFERENCES Training(TrainingID)
);

SHOW CREATE TABLE Trainer;

INSERT INTO Trainer (TrainerID, TrainingID, TrainerFirstName, TrainerLastName) VALUES
(1, 1, 'James', 'Smith'),
(2, 1, 'Johnny', 'Khor'),
(3, 2, 'Michael', 'Smith'),
(4, 3, 'Maria', 'Garcia'),
(5, 4, 'John', NULL),
(6, 4, 'Paul', 'Deitel'),
(7, 5, 'Mike', 'Taylor'),
(8, 5, 'Avinash', 'Navlani'),
(9, 6, 'Robert', 'Smith'),
(10, 7, 'Maria', 'Rodriguez'),
(11, 8, 'Mike', 'Donlon'),
(12, 9, 'Kathy', 'Corby'),
(13, 10, 'Mary', 'Garcia'),
(14, 10, 'Vanessa', NULL),
(15, 11, 'Jordan', NULL),
(16, 11, 'Maria', 'Hernandez');

SELECT * FROM Trainer ORDER BY TrainerID;


-- Q9

SELECT * FROM Trainer WHERE TrainerLastName IS NULL ORDER BY TrainerID;

-- Q10

SHOW TABLES;

-- Q11
SELECT EmployeeID, FirstName, LastName, HireDate
FROM Employee
WHERE HireDate > (SELECT HireDate FROM Employee WHERE FirstName = 'Vivek' AND LastName = 'Pandey')
ORDER BY EmployeeID;

-- Q12
SELECT E.FirstName, E.LastName, T.TrainingName
FROM Employee E
INNER JOIN EmployeeTraining ET ON E.EmployeeID = ET.EmployeeID
INNER JOIN Training T ON ET.TrainingID = T.TrainingID
WHERE E.FirstName = 'Tom' AND E.LastName = 'Harper'
ORDER BY T.TrainingName;

-- Q13

SELECT TR.TrainingName, TT.TrainerFirstName, TT.TrainerLastName
FROM Training TR
INNER JOIN Trainer TT ON TR.TrainingID = TT.TrainingID
ORDER BY TR.TrainingName, TT.TrainerFirstName, TT.TrainerLastName;

-- Q14
SELECT E.EmployeeID, E.FirstName, E.LastName, E.HireDate
FROM Employee E
INNER JOIN Department D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentNm IN ('Accounting and Finance', 'IT Support', 'Production')
ORDER BY E.EmployeeID;

-- Q15
SELECT E.EmployeeID, E.FirstName, E.LastName, D.DepartmentNm AS DepartmentName, T.TrainingName
FROM Employee E
INNER JOIN Department D ON E.DepartmentID = D.DepartmentID
INNER JOIN EmployeeTraining ET ON E.EmployeeID = ET.EmployeeID
INNER JOIN Training T ON ET.TrainingID = T.TrainingID
ORDER BY E.EmployeeID, T.TrainingName;

-- Q16

SELECT T.TrainingID, T.TrainingName, TT.TrainerID, TT.TrainerFirstName, TT.TrainerLastName
FROM Trainer TT
INNER JOIN Training T ON T.TrainingID = TT.TrainingID
WHERE TT.TrainerLastName IS NULL
ORDER BY T.TrainingID, TT.TrainerID;

-- Q17
SELECT DISTINCT E.EquipmentName
FROM Equipment E
INNER JOIN EmployeeEquipment EE ON E.EquipmentID = EE.EquipmentID
ORDER BY E.EquipmentName;

-- Q18
SELECT E.FirstName, E.LastName, T.TrainingName, TR.TrainerFirstName, TR.TrainerLastName
FROM Employee E
INNER JOIN EmployeeTraining ET ON E.EmployeeID = ET.EmployeeID
INNER JOIN Training T ON ET.TrainingID = T.TrainingID
INNER JOIN Trainer TR ON T.TrainingID = TR.TrainingID
WHERE E.FirstName = 'Tom' AND E.LastName = 'Harper'
ORDER BY T.TrainingName, TR.TrainerFirstName;

-- Q19

SELECT E.EmployeeID, E.FirstName, E.LastName, D.DepartmentID, D.DepartmentNm AS DepartmentName, EE.EquipmentID, EQ.EquipmentName
FROM Employee E
INNER JOIN Department D ON E.DepartmentID = D.DepartmentID
INNER JOIN EmployeeEquipment EE ON E.EmployeeID = EE.EmployeeID
INNER JOIN Equipment EQ ON EE.EquipmentID = EQ.EquipmentID
ORDER BY E.EmployeeID, D.DepartmentID, EE.EquipmentID;

-- Q20
SELECT E.EmployeeID, E.FirstName, E.LastName, D.DepartmentID, D.DepartmentNm AS DepartmentName, ET.TrainingID, T.TrainingName
FROM Employee E
INNER JOIN Department D ON E.DepartmentID = D.DepartmentID
INNER JOIN EmployeeTraining ET ON E.EmployeeID = ET.EmployeeID
INNER JOIN Training T ON ET.TrainingID = T.TrainingID
ORDER BY E.EmployeeID, D.DepartmentID, ET.TrainingID;

