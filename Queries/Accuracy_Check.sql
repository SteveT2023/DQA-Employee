-- Find a name that doesn't matched their email.
SELECT
	UPPER(First_Name) AS FirstName,
	UPPER(Last_Name) AS LastName,
	Email
FROM Employee_Raw

EXCEPT

SELECT
	UPPER(SUBSTRING_INDEX(SUBSTRING_INDEX(Email, '@', 1), '.', 1)) AS FirstName,
	UPPER(SUBSTRING_INDEX(SUBSTRING_INDEX(Email, '@', 1), '.', -1)) AS LastName,
	Email
FROM Employee_Raw;
