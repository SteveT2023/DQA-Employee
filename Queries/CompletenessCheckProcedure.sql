-- A dynamic procedure to find nulls, blanks, and whitespace. 
DELIMITER //
CREATE PROCEDURE CompletenessCheck (IN ColName VARCHAR(50))
BEGIN
	SET @sql = CONCAT(
		'INSERT INTO CompletenessTable (Columns, NullCount, BlankCount, WhitespaceCount)'
		'SELECT ', 
			'"', ColName, '"', ', ',
			'SUM(CASE WHEN ', ColName, ' IS NULL THEN 1 ELSE 0 END), ',
			'SUM(CASE WHEN ', ColName, ' = "" THEN 1 ELSE 0 END), ',
			'SUM(CASE WHEN TRIM(', ColName, ') = "" AND ', ColName, ' != "" THEN 1 ELSE 0 END) ',
		'FROM Employee'
	);

	PREPARE stmt FROM @sql;
	EXECUTE stmt;
	DEALLOCATE PREPARE stmt;
END //
DELIMITER ;
