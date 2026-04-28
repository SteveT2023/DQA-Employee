-- Find the oldest date and recent date.
SELECT
	MIN(STR_TO_DATE(Join_Date, '%c/%e/%Y')) AS OldestDate,
	MAX(STR_TO_DATE(Join_Date, '%c/%e/%Y')) AS RecentDate
FROM Employee_Raw;
