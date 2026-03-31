-- Check for nulls, blanks, and whitespace.
CREATE TEMPORARY TABLE CompletenessTable
(
	Columns VARCHAR(50),
	NullCount INT,
	BlankCount INT,
	WhitespaceCount INT
);

CALL CompletenessCheck("Employee_ID");
CALL CompletenessCheck("First_Name");
CALL CompletenessCheck("Last_Name");
CALL CompletenessCheck("Age");
CALL CompletenessCheck("Department_Region");
CALL CompletenessCheck("Status");
CALL CompletenessCheck("Join_Date");
CALL CompletenessCheck("Salary");
CALL CompletenessCheck("Email");
CALL CompletenessCheck("Phone");
CALL CompletenessCheck("Performance_Score");
CALL CompletenessCheck("Remote_Work");

SELECT *
FROM CompletenessTable;
