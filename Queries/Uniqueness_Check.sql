-- Look for duplicates for Employee_ID.
SELECT 
	Employee_ID AS Columns,
	COUNT(*) AS DupCount
FROM Employee_Raw
GROUP BY Employee_ID
HAVING COUNT(*) > 1;

-- Look for duplicates for Email.
SELECT 
	Email AS Columns,
	COUNT(*) AS DupCount
FROM Employee_Raw
GROUP BY Email
HAVING COUNT(*) > 1;

-- Look for duplicates for Phone.
SELECT 
	Phone AS Columns,
	COUNT(*) AS DupCount
FROM Employee_Raw
GROUP BY Phone
HAVING COUNT(*) > 1;

-- Create temporary table to display results.
CREATE TEMPORARY TABLE Unique_Stats
(
	Employee_ID VARCHAR(50),
	Emp_Dup_Count INT,
	Email VARCHAR(50),
	Email_Dup_Count INT,
	Phone BIGINT,
	Phone_Dup_Count INT
);

-- Insert the finding into Unique_Stats table.
INSERT INTO Unique_Stats (Phone, Phone_Dup_Count)
SELECT 
	Phone AS Columns,
	COUNT(*) AS DupCount
FROM Employee_Raw
GROUP BY Phone
HAVING COUNT(*) > 1;

-- Display result.
SELECT *
FROM Unique_Stats;
