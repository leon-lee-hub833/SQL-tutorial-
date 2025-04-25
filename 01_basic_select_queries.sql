# basic select query 

/* select (list) from (table name)
use select can do 
1. can select column
2. can select constant value 
3. can select experssion 
4. can select function
*/

# firstly we have to open database 
USE myemployees; 

 #  query single column 
SELECT last_name FROM myemployees.employees;

#  query mutiple columns
SELECT last_name,salary,email FROM myemployees.employees; 

 /* query all columns in table 
select employee_id,first_name,last_name,phone_number,....... 可以用F12整理格式 
the above is little bit complex 
we can use * instend all columns 
 */
SELECT * FROM myemployees.employees; 


# query constant value 
SELECT 100;     # int
SELECT 'join';  # text

# query expression
SELECT 100*98; 

# query function
SELECT VERSION();   # 查询当前版本 

# there are to methods can give the name to columns  

# 1.  use AS 
SELECT last_name AS 姓,first_name AS 名 FROM myemployees.employees; 

#  use space 
SELECT last_name 姓 FROM myemployees.employees;

# if the name more than one words we have to use quotation mark (both "",'' can use)
SELECT first_name "your name" FROM myemployees.employees;

/* the benefit of give a name to columns
1.  easy to understand 
2. if the columns are repetition give a name can seperate
*/ 


