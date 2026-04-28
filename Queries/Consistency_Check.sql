-- Check values in the Employee_ID column where it doesn't start with 'EMP' and numbers.
SELECT Employee_ID
FROM Employee_Raw
WHERE NOT REGEXP_LIKE(Employee_ID, '^EMP[0-9]{4}$');

-- Check values in the First_Name & Last_Name columns where it doesn't have a number or special character in them.
SELECT First_Name
FROM Employee_Raw
WHERE NOT REGEXP_LIKE(First_Name, '^[a-zA-z]+$');

SELECT Last_Name
FROM Employee_Raw
WHERE NOT REGEXP_LIKE(Last_Name, '^[a-zA-z]+$');

-- Check values in the Age column where it doesn't have a letter in them.
SELECT Age
FROM Employee_Raw
WHERE NOT REGEXP_LIKE(Age, '^[0-9]+$');

-- Check values in the Department_Region column where the department side doesn't have: DevOps, Finance, Admin, Cloud Tech, Sales, or HR.
-- Check values in the Department_Region column where the region side doesn't have: California, Texas, Nevada, Florida, New York, or Illinois.
SELECT DISTINCT SUBSTRING_INDEX(Department_Region, '-', 1)
FROM Employee_Raw
WHERE SUBSTRING_INDEX(Department_Region, '-', 1) NOT IN ('DevOps', 'Finance', 'Admin', 'Cloud Tech', 'Sales', 'HR');

SELECT DISTINCT SUBSTRING_INDEX(Department_Region, '-', -1)
FROM Employee_Raw
WHERE SUBSTRING_INDEX(Department_Region, '-', -1) NOT IN ('California', 'Texas', 'Nevada', 'Florida', 'New York', 'Illinois');

-- Check values in the Status column where it doesn't have: Active, Inactive, or Pending.
SELECT DISTINCT Status
FROM Employee_Raw
WHERE Status NOT IN ('Active', 'Inactive', 'Pending');

-- Check values in the Date column where it doesn't follows the date format.
SELECT Join_Date
FROM Employee_Raw
WHERE NOT REGEXP_LIKE(Join_Date, '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$');

-- Check values in the Salary column where it doesn't have an int. (INCONSISTENCY FOUND)
SELECT Salary
FROM Employee_Raw
WHERE NOT REGEXP_LIKE(Salary, '^[0-9]+\\.[0-9]{1,2}$');

-- Check values in the Email column where it doesn't follows the email format.
SELECT Email
FROM Employee_Raw
WHERE NOT REGEXP_LIKE(Email, '^[a-z]+\\.[a-z]+@example\\.com$');

-- Check values in the Phone column where it doesn't have a number.
SELECT Phone
FROM Employee_Raw
WHERE NOT REGEXP_LIKE(Phone, '^-[0-9]+$');

-- Check values in the Performance_Score column where it doesn't have: Poor, Average, Good, or Excellent.
SELECT DISTINCT Performance_Score
FROM Employee_Raw
WHERE Performance_Score NOT IN ('Poor','Average','Good','Excellent');

-- Check values in the Remote_Work column where it doesn't have: True or False.
SELECT DISTINCT Remote_Work
FROM Employee_Raw
WHERE Remote_Work NOT IN ('True','False');
