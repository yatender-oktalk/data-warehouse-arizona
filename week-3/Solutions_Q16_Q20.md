
## Q16

To display the `TrainingID`, `TrainingName`, `TrainerID`, `TrainerFirstName`, and `TrainerLastName` for trainers who did not provide their last name, sorted by `TrainingID` and `TrainerID`, use the following SQL statement:

```sql
SELECT T.TrainingID, T.TrainingName, TT.TrainerID, TT.TrainerFirstName, TT.TrainerLastName
FROM Trainer TT
INNER JOIN Training T ON T.TrainingID = TT.TrainingID
WHERE TT.TrainerLastName IS NULL
ORDER BY T.TrainingID, TT.TrainerID;
```

### Expected Output

Executing the above query should display the `TrainingID`, `TrainingName`, `TrainerID`, `TrainerFirstName`, and `TrainerLastName` for trainers who did not provide their last name, sorted by `TrainingID` and `TrainerID`.

For example, the expected output might look something like this:

| TrainingID | TrainingName                    | TrainerID | TrainerFirstName | TrainerLastName |
|------------|---------------------------------|-----------|------------------|-----------------|
| 4          | Intro to Python                 | 5         | John             | NULL            |
| 10         | Employee Relations              | 14        | Vanessa          | NULL            |
| 11         | Travel and Expense Management   | 15        | Jordan           | NULL            |

### Q17

To display the distinct list of equipment used by current employees and sort the output by `EquipmentName`, use the following SQL statement:

```sql
SELECT DISTINCT E.EquipmentName
FROM Equipment E
INNER JOIN EmployeeEquipment EE ON E.EquipmentID = EE.EquipmentID
ORDER BY E.EquipmentName;
```

### Expected Output

Executing the above query should display a distinct list of equipment used by current employees, sorted by `EquipmentName`.

For example, the expected output might look something like this:

| EquipmentName           |
|-------------------------|
| Cell Phone              |
| Computer Monitor        |
| Headsets                |
| Internet Modem          |
| Multi-Function Printers |
| Notebook Computers      |
| Projector or Big Screen TV |
| Servers                 |

## Q18

To display the `FirstName`, `LastName`, `TrainingName`, and `trainer(s)` (with `TrainerFirstName` and `TrainerLastName` in two separate columns) for one of the employees, sorted by `TrainingName` and `TrainerFirstName`, use the following SQL statement. Assuming we are selecting the employee `Tom Harper`:

```sql
SELECT E.FirstName, E.LastName, T.TrainingName, TR.TrainerFirstName, TR.TrainerLastName
FROM Employee E
INNER JOIN EmployeeTraining ET ON E.EmployeeID = ET.EmployeeID
INNER JOIN Training T ON ET.TrainingID = T.TrainingID
INNER JOIN Trainer TR ON T.TrainingID = TR.TrainingID
WHERE E.FirstName = 'Tom' AND E.LastName = 'Harper'
ORDER BY T.TrainingName, TR.TrainerFirstName;
```

### Expected Output

Executing the above query should display the `FirstName`, `LastName`, `TrainingName`, and `trainer(s)` (with `TrainerFirstName` and `TrainerLastName` in two separate columns) for the specified employee, sorted by `TrainingName` and `TrainerFirstName`.

For example, the expected output might look something like this:

| FirstName | LastName | TrainingName                | TrainerFirstName | TrainerLastName |
|-----------|----------|-----------------------------|------------------|-----------------|
| Tom       | Harper   | Code of Conduct Training    | Michael          | Smith           |
| Tom       | Harper   | Travel and Expense Management | Jordan           | NULL            |
| Tom       | Harper   | Travel and Expense Management | Maria            | Hernandez       |

## Q19

To display the `EmployeeID`, `FirstName`, `LastName`, `DepartmentID`, `DepartmentName`, `EquipmentID`, and `EquipmentName` for all employees, sorted by `EmployeeID`, `DepartmentID`, and `EquipmentID`, use the following SQL statement:

```sql
SELECT E.EmployeeID, E.FirstName, E.LastName, D.DepartmentID, D.DepartmentNm AS DepartmentName, EE.EquipmentID, EQ.EquipmentName
FROM Employee E
INNER JOIN Department D ON E.DepartmentID = D.DepartmentID
INNER JOIN EmployeeEquipment EE ON E.EmployeeID = EE.EmployeeID
INNER JOIN Equipment EQ ON EE.EquipmentID = EQ.EquipmentID
ORDER BY E.EmployeeID, D.DepartmentID, EE.EquipmentID;
```

### Expected Output

Executing the above query should display the `EmployeeID`, `FirstName`, `LastName`, `DepartmentID`, `DepartmentName`, `EquipmentID`, and `EquipmentName` for all employees, sorted by `EmployeeID`, `DepartmentID`, and `EquipmentID`.

For example, the expected output might look something like this:

| EmployeeID | FirstName | LastName | DepartmentID | DepartmentName         | EquipmentID | EquipmentName           |
|------------|-----------|----------|--------------|------------------------|-------------|-------------------------|
| 1          | Andy      | Wong     | 2            | Production             | 1           | Notebook Computers      |
| 2          | Vivek     | Pandey   | 3            | IT Support             | 1           | Notebook Computers      |
| 2          | Vivek     | Pandey   | 3            | IT Support             | 2           | Headsets                |
| 2          | Vivek     | Pandey   | 3            | IT Support             | 3           | Computer Monitor        |
| 3          | Kathy     | Cooper   | 8            | Human Resource Management | 1        | Notebook Computers      |
| 3          | Kathy     | Cooper   | 8            | Human Resource Management | 2        | Headsets                |
| 3          | Kathy     | Cooper   | 8            | Human Resource Management | 3        | Computer Monitor        |
| 4          | John      | Wilson   | 1            | Research & Development | 1           | Notebook Computers      |
| 4          | John      | Wilson   | 1            | Research & Development | 3           | Computer Monitor        |
| 5          | Nola      | Davis    | 7            | Sales & Marketing      | 1           | Notebook Computers      |
| 5          | Nola      | Davis    | 7            | Sales & Marketing      | 2           | Headsets                |
| 6          | Tom       | Harper   | 9            | Accounting and Finance | 1           | Notebook Computers      |
| 6          | Tom       | Harper   | 9            | Accounting and Finance | 3           | Computer Monitor        |

## Q20

To display the `EmployeeID`, `FirstName`, `LastName`, `DepartmentID`, `DepartmentName`, `TrainingID`, and `TrainingName` for all employees, sorted by `EmployeeID`, `DepartmentID`, and `TrainingID`, use the following SQL statement:

```sql
SELECT E.EmployeeID, E.FirstName, E.LastName, D.DepartmentID, D.DepartmentNm AS DepartmentName, ET.TrainingID, T.TrainingName
FROM Employee E
INNER JOIN Department D ON E.DepartmentID = D.DepartmentID
INNER JOIN EmployeeTraining ET ON E.EmployeeID = ET.EmployeeID
INNER JOIN Training T ON ET.TrainingID = T.TrainingID
ORDER BY E.EmployeeID, D.DepartmentID, ET.TrainingID;
```

### Expected Output

Executing the above query should display the `EmployeeID`, `FirstName`, `LastName`, `DepartmentID`, `DepartmentName`, `TrainingID`, and `TrainingName` for all employees, sorted by `EmployeeID`, `DepartmentID`, and `TrainingID`.

For example, the expected output might look something like this:

| EmployeeID | FirstName | LastName | DepartmentID | DepartmentName         | TrainingID | TrainingName                |
|------------|-----------|----------|--------------|------------------------|------------|-----------------------------|
| 1          | Andy      | Wong     | 2            | Production             | 2          | Code of Conduct Training    |
| 1          | Andy      | Wong     | 2            | Production             | 3          | Safety Training             |
| 2          | Vivek     | Pandey   | 3            | IT Support             | 2          | Code of Conduct Training    |
| 2          | Vivek     | Pandey   | 3            | IT Support             | 6          | Microsoft Certifications    |
| 2          | Vivek     | Pandey   | 3            | IT Support             | 7          | Security and Privacy        |
| 3          | Kathy     | Cooper   | 8            | Human Resource Management | 2        | Code of Conduct Training    |
| 3          | Kathy     | Cooper   | 8            | Human Resource Management | 10       | Employee Relations          |
| 4          | John      | Wilson   | 1            | Research & Development | 2          | Code of Conduct Training    |
| 4          | John      | Wilson   | 1            | Research & Development | 4          | Intro to Python             |
| 4          | John      | Wilson   | 1            | Research & Development | 5          | Machine Learning            |
| 5          | Nola      | Davis    | 7            | Sales & Marketing      | 2          | Code of Conduct Training    |
| 5          | Nola      | Davis    | 7            | Sales & Marketing      | 8          | Product Knowledge           |
| 5          | Nola      | Davis    | 7            | Sales & Marketing      | 9          | Sales Skills                |
| 6          | Tom       | Harper   | 9            | Accounting and Finance | 2          | Code of Conduct Training    |
| 6          | Tom       | Harper   | 9            | Accounting and Finance | 11         | Travel and Expense Management |
