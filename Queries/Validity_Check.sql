-- Employee_ID should have a PK assigned to it.

-- It's best to split the Department_Region into their own columns.

-- Join_Date should be a DATE datatype instead of VARCHAR(50).

-- Salary should be a DECIMAL datatype instead of VARCHAR(50).

-- Phone should be a VARCHAR datatype instad of BIGINT.

/*
Since I'm using DBeaver as my client, it has an issue importing Remote_Work due to it being a Boolean and have a value of TRUE or FALSE.
I changed the datatype from BOOLEAN to VARCHAR(50) in order for the dataset to be import successfully.
The values should be 1 and 0 and be converted back to BOOLEAN.
*/
