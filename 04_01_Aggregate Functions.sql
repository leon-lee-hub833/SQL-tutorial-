/* 
aggregate function
1. Categories 
sum() 
 avg() 
 max() 
 min（） 
 count()  

2 Features :
1 sum. avg generally handle numeric types, 
  max, min, count() can handle any data type 
  
2 all aggregate functions automatically ignore Null values  

3 Use the keyword Distinct to remove duplicates

4 count() 

5 when querying with aggregate functions, you can only select fields that appear after group by
*/

# 1.1 basic caculation 
select sum(salary) from employees;
select avg(salary) from employees;
select max(salary) from employees;
select max(salary) from employees;
select min(salary) from employees;
select count(salary)from employees;

# 1.2 mutipule query caculation at once 
select sum(salary), avg(salary),max(salary),min(salary),count(salary)
from employees;

# 1.3 functions can be nested
select sum(salary), round(avg(salary), 2) ,max(salary),min(salary),count(salary)
from employees;

# 2.1 sum. avg generally deal with numerica typle，while max, min, count() can deal with any types 
select sum(last_name), avg(last_name) from employees; #  result 0 ( cause can not deal with text)
select max(last_name) from employees; # result Zlotkey order by A-Z  
select min(last_name) from employees; # result  Abel order by A-Z
select count(last_name) from employees; # 107

# 2.2 all numerical fuctions ignore null value 
select sum(commission_pct), avg(commission_pct) from employees;
select avg(commission_pct), sum(commission_pct)/35, sum(commission_pct)/107 from employees;
select min(commission_pct), max(commission_pct) from employees;
select count(commission_pct) from employees;

# 3. use distinct remove duplicates
select sum(distinct salary) , sum(salary) from employees;
select count(distinct salary), count(salary) from employees;

# 4. count() function there are 4 types as below 
use myemployees;
select count(salary) from employees;  # query with single column
select count(*) from employees; # query all columns 
select count(1) from employees; # query all columns 
select count('haha') from employees; # query all columns not recommend   

# 5.If a SELECT statement contains both aggregation functions and normal fields, the normal fields must be included in the GROUP BY clause.
select count(salary), salary from employees; # 报错 

select sum(salary), salary 
from employees 
group by salary;


