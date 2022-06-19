###############################################################
###############################################################
-- Project: Using SQL String Functions to Clean Data
###############################################################
###############################################################
 

#############################
-- Task One: Introduction
-- In this task, we will create new tables; the customers
-- and sales tables in the database
#############################

-- 1.1: Create the customers table
CREATE TABLE customers
(
	Customer_ID CHAR(8) PRIMARY KEY,
	Bracket_cust_id CHAR(10),
	Customer_Name VARCHAR(255),
	Segment VARCHAR(255),
	Age INT,
	Country VARCHAR(255),
	City VARCHAR(255),
	State VARCHAR(255),
	Postal_Code INT,
	Region VARCHAR(255)
);

-- 1.2: Create the sales table
CREATE TABLE sales
(
    Order_line INT,
	Order_ID VARCHAR(255),
	Order_Date DATE,
	Ship_Date DATE,
    Ship_Mode VARCHAR(255),
    Customer_ID CHAR(8),
	Product_ID VARCHAR(255),
	Sales DECIMAL(10,5),
	Quantity INT,
    Discount DECIMAL(4,2),
	Profit DECIMAL(10,5)
);

-- 1.3: Retrieve data from the customers and sales tables
SELECT * FROM customers;
SELECT * FROM sales;
/* Since these tables are newly created, no data will be retrieved.
To import the data for these tables, on the Browser pane, right-click on the table name and select import.
Once the data are imported, try running again the query above to verify if the data are loaded correctly.*/

#############################
-- Task Two: LENGTH, LEFT, RIGHT
-- In this task, we will use the LENGTH function to return the 
-- length of a specified string, expressed as the number of characters.
-- In addition, we will use the LEFT/RIGHT functions to pull a certain number of characters 
-- from the left or right side of a string and present them as a separate string
#############################

-- 2.1: Retrieve data from the employees table
SELECT * FROM employees;

-- 2.2: Find the length of the first name of male employees
SELECT first_name, LENGTH(first_name) AS characters_num
FROM employees
WHERE gender = 'M';

-- 2.3: Find the length of the first name of male employees
-- where the length of the first name is greater than 5
SELECT first_name, LENGTH(first_name) AS characters_num
FROM employees
WHERE gender = 'M' AND LENGTH(first_name) > 5
ORDER BY characters_num;

-- 2.4: Retrieve a list of the customer group of all customers
SELECT * FROM customers;

SELECT customer_id, LEFT(customer_id, 2) AS cust_group
FROM customers;


-- 2.5: Retrieve a list of the customer number of all customers
SELECT customer_id, RIGHT(customer_id, 5) AS cust_number
FROM customers;


-- 2.6: Retrieve the length of the customer_id column
SELECT customer_id, LENGTH(customer_id)
FROM customers;
/*Now, RIGHT works well in this case, because we know that the number
of characters will be consistent across the entire field.
If it was not consistent, it's still possible to pull
a string from the right side in a way that makes sense.*/


-- 2.7: Retrieve a list of the customer group of all customers
SELECT customer_id, RIGHT(customer_id, LENGTH(customer_id)-3) AS cust_number
FROM customers;
/*And this gives the same result like we have seen earlier.*/

#############################
-- Task Three: UPPER & LOWER 
-- In this task, we will use the UPPER and LOWER functions to convert all 
-- characters in the specified string to uppercase or lowercase.
#############################

-- 3.1: Change Ariel-SQL-Projects to uppercase letters
SELECT UPPER('Ariel-SQL-Projects');

-- 3.2: Change Ariel-SQL-Projects to lowercase letters
SELECT LOWER('Ariel-SQL-Projects');

-- 3.3: Retrieve the details of the first employee
SELECT * FROM employees
WHERE emp_no = '10001';

-- Start a transaction
BEGIN;
/* After running this query, any query updates you make will be committed.
So, what transaction helps you to do is to be able to manually COMMIT or ROLLBACK.*/

-- 3.4: Change the first name of the first employee to uppercase letters
UPDATE employees
SET first_name = UPPER(first_name)
WHERE emp_no = '10001';

-- Rollback to the previous step
ROLLBACK;
/*let's roll back now to the last step so that I can have my database intact.*/

#############################
-- Task Four: REPLACE
-- In this task, we will learn how to use the 
-- REPLACE function to replace all occurrences of a specified string
#############################

-- 4.1: Change M to Male in the gender column of the employees table
SELECT first_name, last_name, gender, REPLACE(gender, 'M', 'Male') AS Emp_Gender
FROM employees;

-- 4.2: Change F to Female in the gender column of the employees table
SELECT first_name, last_name, gender, REPLACE(gender, 'f', 'Female') AS Emp_Gender
FROM employees;
/* The gender column is case sensitive. So for example, if you use 'f' instead of 'F', it will not recognised the REPLACE command.
However, say we dont know if the column is case sensitive, but we really want to replace a certain value with upper case character, we can
simply convert the column first to LOWER case then apply the REPLACE. See sample below.*/

-- 4.3: Retrieve data from the customers table
SELECT * FROM customers;

-- 4.4: Change United States to US in the country column of the customers table
SELECT customer_name, region, country, REPLACE(LOWER(country), 'united states', 'US') AS New_country
FROM customers;

#############################
-- Task Five: TRIM, RTRIM, LTRIM
-- In this task, we will use the TRIM functions to remove
-- all specified characters either parts of a string
#############################

/* TRIM functions removes all specified characters
either from the beginning or the end of a string.
So, that's either from the leading or trailing part of a string.*/

/*RTRIM function removes all specified character
from the right-hand side of the string.*/

/*LTRIM removes all specified character from the left-hand side
of the- of the string.*/

-- 5.1: Trim the word Ariel-SQL-Projects
SELECT TRIM(leading ' ' FROM ' Ariel-SQL-Projects ');
/* In this example, I've added one space before and after Ariel-SQL-Projects. But the TRIM leading function 
helps me remove the space before the Ariel-SQL-Projects.*/

-- 5.2: Trim the word Ariel-SQL-Projects
SELECT TRIM(trailing ' ' FROM ' Ariel-SQL-Projects ');
/* Similar with the above, but this time the TRIM trailing function removes the space after the Ariel-SQL-Projects.*/

-- 5.3: Trim the word Ariel-SQL-Projects
SELECT TRIM(both ' ' FROM ' Ariel-SQL-Projects ');
/* Now with TRIM both function, the spaces before and after the Ariel-SQL-Projects has been removed.*/

-- 5.4: Trim the word Ariel-SQL-Projects
SELECT TRIM(' Ariel-SQL-Projects ');
/* Though the simpliest way to remove unnecessary spaces, use TRIM directly.*/

-- 5.5: Right trim the word Ariel-SQL-Projects
SELECT RTRIM(' Ariel-SQL-Projects ');
/* This works similar with TRIM trailing function.*/

-- 5.6: Left trim the word Ariel-SQL-Projects
SELECT LTRIM(' Ariel-SQL-Projects ');
/* This works similar with TRIM leading function.*/

/* Let's apply the TRIM function to real data. */

-- 5.7: Retrieve data from the customers table
SELECT * FROM customers;

-- 5.8: Remove the brackets from each customer id in the bracket_cust_id column
SELECT bracket_cust_id, TRIM(bracket_cust_id, '()') AS cleaned_cust_id
FROM customers;

#############################
-- Task Six: Concatenation
-- In this task, we will learn how to join or
-- concatenate two or more strings together
#############################

/* String concatenation means to append one string to the end
of another string. Concatenation can be used to join strings from 
different sources, including column values, literal strings, the 
output from a user-defined function or scalar sub-queries and so on.
There are two ways to concatenate strings. You can use the double pipe 
function or the CONCAT function. */

-- 6.1: Create a new column called Full_Name from the first_name and last_name of employees
SELECT * FROM employees;

-- First approach
SELECT emp_no, birth_date, first_name, last_name, CONCAT(first_name, ' ', last_name) AS Full_Name
FROM employees;

-- Second approach
SELECT emp_no, birth_date, first_name, last_name, first_name||' '||last_name AS Full_Name
FROM employees;


-- 6.2: Create a new column called Address from the city, state, and country of customers
SELECT * FROM customers;

SELECT customer_name, city||', '||state||', '||country AS Address
FROM customers;

-- 6.3: Create a column called desc_age from the customers name and age
SELECT customer_name, CONCAT(customer_name, ' is ', age, ' years old.') AS desc_age
FROM customers;

/* Or we can use the pipe function as below.*/
SELECT customer_name||' is '||age||' years old.' AS desc_age
FROM customers;

#############################
-- Task Seven: SUBSTRING
-- In this task, we will learn how to
-- extract a substring from a string
#############################

/* SUBSTRING is a function in SQL which allows the user to derive 
substring from any given string set as per the user needs. 
So, substring basically extract a string with a specified length 
starting from a given location in an input string. 
The purpose of substring in SQL is to return a specific portion of a string.
If we remember, the LEFT and RIGHT functions both create substrings
of a specified length but they only do so starting from the side of an
existing string. However, if we want to start in the middle of a string, you can use
SUBSTRING.*/

-- 7.1: Retrieve data from the customers table
SELECT * FROM customers;
/* In the customer_id column, the first two characters represent the 
customer's group and the last 5 digits are the customer's number.*/

-- 7.2: Retrieve the IDs, names, and groups of customers
-- Hint: Use the customer_id column
SELECT customer_id, customer_name,
SUBSTRING(customer_id FOR 2) AS cust_group
FROM customers;

-- 7.3: Retrieve the IDs, names of customers in the customer group 'AB'
SELECT customer_id, customer_name,
SUBSTRING(customer_id FOR 2) AS cust_group
FROM customers
WHERE SUBSTRING(customer_id FOR 2) = 'AB';

-- If we want to retrieve customer names from multiple groups
SELECT customer_id, customer_name,
SUBSTRING(customer_id FOR 2) AS cust_group
FROM customers
WHERE SUBSTRING(customer_id FOR 2) = 'AB' OR SUBSTRING(customer_id FOR 2) = 'DV';


-- 7.4: Retrieve the IDs, names, and customer number of customers in the customer group 'AB'
SELECT customer_id, customer_name,
SUBSTRING(customer_id FROM 4 FOR 5) AS cust_number -- the "FROM 4 FOR 5" means get the character starting in 4th character(from left), count 5 character and get them.
FROM customers
WHERE SUBSTRING(customer_id FOR 2) = 'AB';

-- 7.5: Retrieve the year of birth for all employees
SELECT * FROM employees;

/* The issue with this is that the year of birth is a DATE
type character. We cannot apply string functions on DATE, or any other
data type except only on characters.
So, what we'll do first is to CAST this data type as a character*/

SELECT emp_no, birth_date, SUBSTRING(CAST(birth_date AS CHAR(10)) FOR 4) AS year
FROM employees;
/* The reason why we're putting CHAR(10) is because I know that the values in this column is of 10 cahracters.
It's better to use CHAR of 10, than using VARCHAR of say 225 because this will help to optimize memory space. 
This is if I know the length of that particular column of each of the rows there.*/

/* if we did not cast this as a character, it will not work- it will throw up an error.
Now, remember that when using functions within other functions, it is important to remember
that the innermost function will be evaluated first. So, the CAST function will first work before applying
a substring that changes this to "FOR 4" for the first four characters. */

#############################
-- Task Eight: String Aggregation
-- In this task, we will learn how to use string aggregation 
-- to join strings together, separated by delimiter
#############################

/* This is slightly different from concatenation or the pipe
function we looked at earlier. The STRING_AGG() function is an aggregate function
that concatenate rows of strings For the concatenate or CONCAT() function we looked
at before, it just combines or join strings. But here, we want to join rows of strings 
into a single string, separated by a specified separator. 
It does not add the separator at the end of the result string. That's where the difference is. */

-- 8.1: Retrieve data from the dept_emp table
SELECT * FROM dept_emp;

-- 8.2: Retrieve a list of all department numbers for different employees
SELECT emp_no, STRING_AGG(dept_no, ', ') AS departments
FROM dept_emp -- next I want to try to get all the departments who has worked in using the department number.
GROUP BY emp_no;
/* Now, in the result that this genrated, we will see for employee number 10. That he has worked in department number four,
department number six. That's what STRING_AGG does. That's difference between this and the concatenate function.*/


-- 8.3: Retrieve data from the sales table
SELECT * FROM sales;

/* In this table, there are some customer who ordered the same product 
on the same day. We can see there are different products here.
So, we want to try to retrieve a list of all products that
were ordered by customer from the sales table, like the same
customer ordering different products.*/

-- 8.4: Retrieve a list of all products that were ordered by a customer from the sales table
SELECT order_id, STRING_AGG(product_id, ', ') AS prod_ordered
FROM sales
GROUP BY order_id
ORDER BY order_id;


#############################
-- Task Nine: COALESCE
-- In this task, we will learn how to use COALESCE
-- to fill null values with actual values
#############################

/* The SQL COALESCE function is used to handle null values.
During the expression evaluation process, the null values
are replaced with user defined values. The SQL COALESCE 
function evaluates the arguments in order and always returns 
the first not null value. That is the first not missing value 
from the defined argument list.*/

-- 9.1: Retrieve data from the departments_dup table
SELECT * FROM departments_dup;
/* If we check the ninth row after generating the query above, we will see a null value.
So basically, what we want to do is to replace the missing department number with the 
department name. The idea behind COALESCE is simple. For example, if I asked for the 
address of someone and the city is not available, I can replace it with, say, the region or 
the country or the postal code - something where you can replace a missing column or a
missing field with another value. I want to replace all department number with its
department name, that is I don't want to see any missing department number.*/

-- 9.2: Replace all missing department number with its department name
SELECT dept_no, dept_name,
COALESCE(dept_no, dept_name) AS dept
FROM departments_dup
ORDER BY dept_no;
/* Let's go to that missing department number (row no. 21).
We will see in dept column, it has replaced that missing value
with the department name.*/

-- 9.3: Change every missing department number to 'No Department Number' and
-- every missing department name to 'No Department Name' respectively
SELECT dept_no, dept_name,
COALESCE(dept_no, 'No Department Number') AS New_dept_no,
COALESCE(dept_name, 'No Department Name') AS new_dept_name
FROM departments_dup
ORDER BY dept_no;
/* In the new columns created, if there si a null values either in dept_no or in dept_name, the label we specified is properly reflected.*/

-- 9.4: Replace a missing country with the city, state or No Address
SELECT * FROM customers;
/* Observe the missing values in columns country and city.
What I want to do is to replace this missing value in country with the city.
And if the city is missing, replace it with the state. And if the state is missing, 
we'll replace it with no address.
Now there is a row there (for custmer id TB-21520) that has missing values 
from country to state columns. This will be replaced with 'No Address'.*/

SELECT customer_name, country, city, state,
COALESCE(country, city, state, 'No Address') AS cust_add
FROM customers;
/* Observe the missing values and how are they treated.
The customer Tracy Blumstein has missing values from country to state. And it was
labeled correctly in cust_add column.*/