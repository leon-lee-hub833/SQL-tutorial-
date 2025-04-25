# basic select query 

/* select (list) from (table name)
use select can do 
1. can select column
2. can select constant value 
3. can select experssion 
4. can select function
*/

# 1.firstly we have to open database 
USE myemployees; 

# 2. query column
 # 2.1 query single column 
SELECT last_name FROM myemployees.employees;

# 2.2 query mutiple columns
SELECT last_name,salary,email FROM myemployees.employees; 

 /* 2.3 query all columns in table 
select employee_id,first_name,last_name,phone_number,....... 可以用F12整理格式 
the above is little bit complex 
we can use * instend all columns 
 */
SELECT * FROM myemployees.employees; 


# 3.query constant value 
SELECT 100;     # int
SELECT 'join';  # text

# 4. query expression
SELECT 100*98; 

# 5.query function
SELECT VERSION();   # check the current version


# 6.there are two methods can give the name to columns  
# 6.1 use AS 
SELECT last_name AS 姓,first_name AS 名 FROM myemployees.employees; 

# 6.2 use space 
SELECT last_name 姓 FROM myemployees.employees;

# if the name more than one words we have to use quotation mark (both "",'' can use)
SELECT first_name "your name" FROM myemployees.employees;

/* the benefit of give a name to columns
1.  easy to understand 
2. if the columns are repetition give a name can seperate
*/ 

# 7. remove duplicates
SELECT department_id FROM  myemployees.employees;
# add  DISTINCT to remove duplicates  
SELECT DISTINCT department_id FROM  myemployees.employees;


#8. + Operator – Only Used for Arithmetic, Not for Concatenation
/* 
SELECT 100+100;    result 200 
SELECT '123'+100;  result 223
SELECT 'JOIN'+100; result 0+100 = 100
 SELECT null+100;  result null 
*/

# we try use + to concate last_name and first name worng
SELECT 
last_name+first_name AS 姓名 
FROM 
myemployees.employees;  

# 9. use CONCAT（） function to concat t
SELECT CONCAT(last_name,first_name) FROM myemployees.employees;
SELECT CONCAT(last_name,first_name) AS 姓名 FROM myemployees.employees;


