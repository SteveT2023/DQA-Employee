-- Create a procedure to find nulls, blanks, and whitespaces for each columns.
DELIMITER //
	CREATE PROCEDURE CompleteCheck (IN ColName VARCHAR(50))
		BEGIN
			SET @query = CONCAT(
			'INSERT INTO Complete_Stats ',
			'SELECT ',
				'"', ColName, '"', ' AS Columns, ',
				'SUM(CASE WHEN ', ColName, ' IS NULL THEN 1 ELSE 0 END) AS NullCount, ',
				'SUM(CASE WHEN ', ColName, ' = "" THEN 1 ELSE 0 END) AS BlankCount, ',
				'SUM(CASE WHEN TRIM(', ColName, ') = "" AND ', ColName, ' != "" THEN 1 ELSE 0 END) AS WhitespaceCount '
			'FROM Employee_Raw'
			);	
			
			PREPARE stmt FROM @query;
			EXECUTE stmt;
			DEALLOCATE PREPARE stmt;
		END //
DELIMITER ;

-- Create a temporary table to display the results.
CREATE TEMPORARY TABLE Complete_Stats
(
	Columns VARCHAR(50),
	NullCount INT,
	BlankCount INT,
	WhitespaceCount INT
);

-- Call procedures.
CALL CompleteCheck('Employee_ID');
CALL CompleteCheck('First_Name');
CALL CompleteCheck('Last_Name');
CALL CompleteCheck('Age');
CALL CompleteCheck('Department_Region');
CALL CompleteCheck('Status');
CALL CompleteCheck('Join_Date');
CALL CompleteCheck('Salary');
CALL CompleteCheck('Email');
CALL CompleteCheck('Phone');
CALL CompleteCheck('Performance_Score');
CALL CompleteCheck('Remote_Work');

-- Display results.
SELECT *
FROM Complete_Stats;
