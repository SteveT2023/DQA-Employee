-- Finding duplicates in columns that are supposed to be unique.
SELECT 
	Employee_ID AS Value,
	COUNT(*) AS Occurs
FROM Employee
GROUP BY Employee_ID
HAVING COUNT(*) > 1

UNION ALL

SELECT 
	Phone,
	COUNT(*)
FROM Employee
GROUP BY Phone
HAVING COUNT(*) > 1;
