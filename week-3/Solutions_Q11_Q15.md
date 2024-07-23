
# Q11 to Q15 Solutions

## Q11

To display `EmployeeID`, `FirstName`, `LastName`, and `HireDate` of employees hired after employee `Vivek Pandey`, sorted by `EmployeeID`, use the following SQL statement:

```sql
SELECT EmployeeID, FirstName, LastName, HireDate
FROM Employee
WHERE HireDate > (SELECT HireDate FROM Employee WHERE FirstName = 'Vivek' AND LastName = 'Pandey')
ORDER BY EmployeeID;
```

### Expected Output

Executing the above query should display the `EmployeeID`, `FirstName`, `LastName`, and `HireDate` of employees who were hired after `Vivek Pandey`, sorted by `EmployeeID`.

For example, the expected output might look something like this:

| EmployeeID | FirstName | LastName | HireDate   |
|------------|-----------|----------|------------|
| 3          | Kathy     | Cooper   | 2011-11-18 |
| 4          | John      | Wilson   | 2017-03-19 |
| 5          | Nola      | Davis    | 2016-03-23 |

## Q12

To display `FirstName`, `LastName`, and `TrainingName` for employee `Tom Harper`, sorted by `TrainingName`, use the following SQL statement:

```sql
SELECT E.FirstName, E.LastName, T.TrainingName
FROM Employee E
INNER JOIN EmployeeTraining ET ON E.EmployeeID = ET.EmployeeID
INNER JOIN Training T ON ET.TrainingID = T.TrainingID
WHERE E.FirstName = 'Tom' AND E.LastName = 'Harper'
ORDER BY T.TrainingName;
```

### Expected Output

Executing the above query should display the `FirstName`, `LastName`, and `TrainingName` for employee `Tom Harper`, sorted by `TrainingName`.

For example, the expected output might look something like this:

| FirstName | LastName | TrainingName                |
|-----------|----------|-----------------------------|
| Tom       | Harper   | Code of Conduct Training    |
| Tom       | Harper   | Travel and Expense Management |

## Q13

To display the complete list of trainings and trainers (first and last name) available for each training, sorted by `TrainingName` and trainers' first and last name, use the following SQL statement:

```sql
SELECT TR.TrainingName, TT.TrainerFirstName, TT.TrainerLastName
FROM Training TR
INNER JOIN Trainer TT ON TR.TrainingID = TT.TrainingID
ORDER BY TR.TrainingName, TT.TrainerFirstName, TT.TrainerLastName;
```

### Expected Output

Executing the above query should display the complete list of trainings and trainers (first and last name) available for each training, sorted by `TrainingName` and trainers' first and last name.

For example, the expected output might look something like this:

| TrainingName                             | TrainerFirstName | TrainerLastName |
|------------------------------------------|------------------|-----------------|
| Code of Conduct Training                 | Michael          | Smith           |
| COVID-19 Awareness and Protection Training | James            | Smith           |
| COVID-19 Awareness and Protection Training | Johnny           | Khor            |
| Intro to Python                          | John             |                 |
| Intro to Python                          | Paul             | Deitel          |
| Machine Learning                         | Mike             | Taylor          |
| Machine Learning                         | Avinash          | Navlani         |
| Safety Training                          | Maria            | Garcia          |
| Travel and Expense Management            | Jordan           |                 |
| Travel and Expense Management            | Maria            | Hernandez       |

## Q14

To display `EmployeeID`, `FirstName`, `LastName`, and `HireDate` of employees who work for the departments `Accounting and Finance`, `IT Support`, and `Production`, sorted by `EmployeeID`, use the following SQL statement:

```sql
SELECT E.EmployeeID, E.FirstName, E.LastName, E.HireDate
FROM Employee E
INNER JOIN Department D ON E.DepartmentID = D.DepartmentID
WHERE D.DepartmentNm IN ('Accounting and Finance', 'IT Support', 'Production')
ORDER BY E.EmployeeID;
```

### Expected Output

Executing the above query should display the `EmployeeID`, `FirstName`, `LastName`, and `HireDate` of employees who work for the departments `Accounting and Finance`, `IT Support`, and `Production`, sorted by `EmployeeID`.

For example, the expected output might look something like this:

| EmployeeID | FirstName | LastName | HireDate   |
|------------|-----------|----------|------------|
| 1          | Andy      | Wong     | 2001-01-15 |
| 2          | Vivek     | Pandey   | 2003-11-15 |
| 3          | Kathy     | Cooper   | 2011-11-18 |

## Q15

To display the complete list of `Trainings`, `Employees` (with first and last name in two separate columns), and `Departments` (with department name) for each employee, sorted by `EmployeeID` and `TrainingName`, use the following SQL statement:

```sql
SELECT E.EmployeeID, E.FirstName, E.LastName, D.DepartmentNm AS DepartmentName, T.TrainingName
FROM Employee E
INNER JOIN Department D ON E.DepartmentID = D.DepartmentID
INNER JOIN EmployeeTraining ET ON E.EmployeeID = ET.EmployeeID
INNER JOIN Training T ON ET.TrainingID = T.TrainingID
ORDER BY E.EmployeeID, T.TrainingName;
```

### Expected Output

Executing the above query should display the complete list of `Trainings`, `Employees` (with first and last name in two separate columns), and `Departments` (with department name) for each employee, sorted by `EmployeeID` and `TrainingName`.

For example, the expected output might look something like this:

| EmployeeID | FirstName | LastName | DepartmentName         | TrainingName                |
|------------|-----------|----------|------------------------|-----------------------------|
| 1          | Andy      | Wong     | Production             | Code of Conduct Training    |
| 1          | Andy      | Wong     | Production             | Safety Training             |
| 2          | Vivek     | Pandey   | IT Support             | Code of Conduct Training    |
| 2          | Vivek     | Pandey   | IT Support             | Microsoft Certifications    |
| 2          | Vivek     | Pandey   | IT Support             | Security and Privacy        |
| 3          | Kathy     | Cooper   | Human Resource Management | Code of Conduct Training    |
| 3          | Kathy     | Cooper   | Human Resource Management | Employee Relations          |
| 4          | John      | Wilson   | Research & Development | Code of Conduct Training    |
| 4          | John      | Wilson   | Research & Development | Intro to Python             |
| 4          | John      | Wilson   | Research & Development | Machine Learning            |
| 5          | Nola      | Davis    | Sales & Marketing      | Code of Conduct Training    |
| 5          | Nola      | Davis    | Sales & Marketing      | Product Knowledge           |
| 5          | Nola      | Davis    | Sales & Marketing      | Sales Skills                |
| 6          | Tom       | Harper   | Accounting and Finance | Code of Conduct Training    |
| 6          | Tom       | Harper   | Accounting and Finance | Travel and Expense Management |
