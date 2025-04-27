# common functions
/* 

Grammer：
        select name of function(parameter) 
        【from table】;

Classification： 
       Scalar functions 
       Expamples ：ifnull() concat() length() 
       
       Dcalar functions can be categotized as ：
       1 String functions 
       2 Mathematical functions 
       3 Date functions 
       4 Other functions
       5 Control flow functions  
       
       Aggregate functions 
       used for statistical purposes, aslo known as statistical functions
       count()
       sum()
       avg()
       max()
       min()
       group by()
*/


# 1. Scalar functions - String functions 

# 1.1 .length () 
# get the byte length of the parameter value 
# length returns the byte lenfth while len in substr(str, opt,len) refers to the charcter len
SELECT LENGTH('li yang');
SELECT LENGTH('李阳');  # chinese take 4 bytes each

# 1.2. concat() 
#  concat string
SELECT CONCAT(last_name ,'_', first_name) FROM employees;

# 1.3. upper() lower ()
SELECT UPPER('join') ;
SELECT LOWER('JOIN');
# we aslo can upper last name and lower first name then use concat put it together
SELECT CONCAT(UPPER(last_name), LOWER(first_name)) AS 姓名 FROM employees;

# 1.4. substr() 
# Substring extraction = substring()
# (1) substr(str, option)   （note: indexing start from 1）
SELECT substr('we all love mysql', 6) AS out_put;  
#（2）substr(str, option, len)  
SELECT substr('we all love mysql', 2,6 ) AS out_put; 

# example : Capitalize the first letter of the last name and make the rest lowercase.
SELECT concat( upper(substr(last_name, 1, 1)),'_', lower(substr(last_name, 2))) AS 姓名 
FROM employees;

# 1.5. instr(str1, str2)  
# Return the index of the first occurrence of the string. If not found, return 0.
SELECT instr('we all love mysql', 'mysql') AS out_put; # 从第十三个索引开始往后 

#1.6. trim() 
#Remove leading and trailing spaces, but keep the spaces inside. 
SELECT length(trim('     we are love    '))AS out_put;
# Can remove custom characters from both ends of the string. 
SELECT trim( 'b' FROM 'bbbbbbbbbbbwe are lovebbbbbbbbb') AS out_put;

# 1.7. lpad(str，len, fill_str)
# Left-pad the string to a specified length with a specified character.
SELECT lpad('we',10, '&') AS out_put;  
SELECT lpad('we',1, '&') AS out_put; 

# 1.8. rpad(str，len, fill_str) 
# Right-pad the string to a specified length with a specified character.
SELECT rpad('we',10, '&') AS out_put;

# 1.9 replace('str', 'from_str', 'to_str')
SELECT replace('we love thailand', 'thailand','china') AS out_put;
SELECT replace('we love thailand thailand thailand ', 'thailand','china') AS out_put; # 都改




#2 Mathematical functions 

# 2.1. round(float) 
# rounds to the nearest interger 
SELECT round(1.990);  # returns 2
SELECT round (1.222); # returns 1
SELECT round(-1.345); #returns -1
SELECT round(-1.645); #returns -2

# 2.2 round(float, D)  D refers decimal 
SELECT round(1.236, 2);

# 2.3 ceil(float) 
# round up to the nearest integer
SELECT ceil(1.52);
SELECT ceil(-1.23); # returns -1

# 2.4. floor() 
# round down to the nearest integer
SELECT floor(1.52);
SELECT floor(-1.23); # returns -2

# 2.5 truncate() 
SELECT truncate(1.89755, 2); # Returns 1.89, keeps 2 digits after the decimal point

# 2.6 mod()  
SELECT mod(10,3); # 1
SELECT mod(-10,-3); # -1
SELECT mod(10,-3); # 1
SELECT mod(-10,3); # -1



# 3.Date functions 
# 3.1. now()  date-time
SELECT now();

# 3.2.curdate() date
SELECT curdate();

# 3.3. curtime() time
SELECT curtime();

# 3.4. year， momth ， DAY，hour， minte, scend 
SELECT YEAR(NOW());
SELECT MONTH (NOW());
SELECT MONTHNAME (NOW());


# 3.5.str_to_date(date, format)
# convert a string into a date using a specified fromat
SELECT str_to_date('1998-3-2','%Y-%m-%d');

# quetion: query employee information with hire date" 1992-4-3)
SELECT * FROM employees
WHERE hiredate = str_to_date('3-4-1992','%d-%m-%Y');


# 3.6 data_format(date, str) 
# convert a date into a fotmatted string 
SELECT date_format(now(), '%y年-%c月-%d日');

# question: Query last name and hire date (formatted as MM/DD YY) of employees who have commission
select last_name, date_format(hiredate, '%c月/%d日 %y年'),commission_pct
From employees
where commission_pct is not null;


# 4. other functions 
# 4.1 version()  check the current version
SELECT VERSION();

# 4.2 database() check the current database 
select database();

# 4.3 user() check the current user
select user();



# 5.Control flow functions  : if / case 

# 5.1. if (exp, return_if_true, return_if_false)  
select if (10>5, 'big', 'small');

# question: Check whether employees have bonuses
select last_name, commission_pct, if(commission_pct is null, 'no_bonuse', 'bonuse')
from employees;


# 5.2 case() 
# there are two types   
# 1
/* 
case column/ expression 
when column= value1 then result1
when column= value2 then restult2
....
else result n
end + as name 
*/

# example 
select salary, department_id,
case department_id
when 30 then salary*1.1
when 40 then salary*1.2
when 50 then salary*1.4
else salary
end as new_salary 
from employees;

/*
2 
mutiple condition evaluation
case 
when condition1 then result1 
when condition2 then result2 
...
else result N
end
*/
# example 
select salary,
case 
when salary>20000 then 'A'
when salary>15000 then 'B'
when  salary>10000 then 'C'
else 'D'
end as salary_range
from employees;





