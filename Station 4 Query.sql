# Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

SELECT 
    (SELECT COUNT(CITY) FROM STATION) - 
    (SELECT COUNT(DISTINCT CITY) FROM STATION) AS Difference;

# Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE UPPER(SUBSTR(CITY, 1, 1)) NOT IN ('A', 'E', 'I', 'O', 'U')
   OR UPPER(SUBSTR(CITY, -1)) NOT IN ('A', 'E', 'I', 'O', 'U');

# Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY
FROM STATION
WHERE UPPER(SUBSTR(CITY, 1, 1)) NOT IN ('A', 'E', 'I', 'O', 'U')
    AND UPPER(SUBSTR(CITY, -1)) NOT IN ('A', 'E', 'I', 'O', 'U');


# Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. 
If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name, 3), ID ASC;

# Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

SELECT name
FROM Employee
ORDER BY name ASC;


# Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

SELECT name
FROM Employee
ORDER BY name ASC;

# Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than 2000$ per month
 who have been employees for less than 10 months. Sort your result by ascending employee_id.

 SELECT name
FROM Employee
WHERE salary > 2000 AND months_employed < 10
ORDER BY employee_id ASC;


#P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
*****
****
***
**
*
# Write a query to print the pattern P(20)?

DELIMITER $$

CREATE PROCEDURE stars(r INT) 
    BEGIN 
        WHILE r >= 1 DO 
            SELECT repeat('* ', r);
            SET r = r - 1;
            END WHILE;
    END; $$
    


CALL stars(20);

# P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
*
**
***
****
*****
# Write a query to print the pattern P(20)?

-- For an N amount of rows (with an input) 
-- print the ascending amount of stars. 


DELIMITER $$

CREATE PROCEDURE stars(r INT) -- procedure stars() with r as an int
BEGIN
    DECLARE counted INT DEFAULT 1; -- counted as a variable
    WHILE counted <= r DO -- loop as long as counted is <= r
        SELECT REPEAT('* ', counted); -- print out * per amount counted
        SET counted = counted + 1; -- increment +1 for each counted row        
    END WHILE;
END $$
    
CALL stars(20); -- call procedure with the value 20


# Write a query to print all prime numbers less than or equal to 1000. Print your result on a single line,
 and use the ampersand () character as your separator (instead of a space). For example, the output for all prime numbers =< 10 would be:
 

SELECT GROUP_CONCAT(NUMB SEPARATOR '&')
FROM (
    SELECT @num:=@num+1 as NUMB FROM
    information_schema.tables t1,
    information_schema.tables t2,
    (SELECT @num:=1) tmp
) tempNum
WHERE NUMB<=1000 AND NOT EXISTS(
		SELECT * FROM (
			SELECT @nu:=@nu+1 as NUMA FROM
			    information_schema.tables t1,
			    information_schema.tables t2,
			    (SELECT @nu:=1) tmp1
			    LIMIT 1000
			) tatata
		WHERE FLOOR(NUMB/NUMA)=(NUMB/NUMA) AND NUMA<NUMB AND NUMA>1
	)

