/*  explain Conditional Query
Grammer：
	   SELECT   
				column list （expession/ function。。。）
       FROM     
				table name
       WHERE    
				filter condition;
                
Execution order: 1. Table name 2. Filter condition 3. Select list
			
Based on different filtering results, conditional queries can be calessified 
in to fowllowing types 

1 filter by conditional expressions 
  Use simple comparison operators:   <, > , =,  <>(!=) ,<=, >= 
  
2 filter by logical expressions 
  Purpose : used to connect multiple conditional expressions 
  logical operators 
          and / or / not 
          and : any condition is false, the result is false 
          or  : any condition is true,  the result is true
          not  : reverses the condition 
          
3 pattern matching 
		like 
        between and 
        in 
        is null 
*/


# 1  Filter by conditonal expressions 
#  1.1 question: The manager want to check all employees whose salalry is above 12000,
SELECT 
       * 
FROM 
       employees
WHERE 
       salary>12000;

# 1.2 question: The manager want to check the employee's last name and department id 
                # whose the department id is not 90;
SELECT 
	  last_name,
      department_id
FROM 
      employees
WHERE
	  department_id<>90;

# 2.filter by logical expressions
# 2.1 question: The manager wants to check the names, salaries, and commission_pct of employees whose salary is between 10,000 and 20,000.
SELECT 
       last_name,
       salary,
       commission_pct
FROM 
       employees
WHERE 
	   salary>=10000 AND salary<=20000;
	
    
# 2.2 question: Show the information of employees whose department number is not between 90 and 110, or whose salary is higher than 15,000
SELECT
       *
FROM 
      employees
WHERE 
      # department_id<90 OR department_id>110 OR salary>15000;
# or we can use 
      NOT(department_id>=90 AND department_id<=110) OR salary>15000;
      
# pattern matching 
/*
like 
Features：
used together with wildcard characters 
  wildcard:
	   %   matches any number of characters( including zero characters)
        _  matches any single character
        to escape special characters like _ or %, use the ESCAPE clause 

between and 
Features： 
between and  improves query simplicity 
includes both boundary values 
do not reverse the order of the two boundary values 

in 
Features: 
used to check whether a field's value is on of the items in the in list
more concise than using multiple or conditions
all values in the in list must be of the same data type
the in list does not support wildcard characters like %, _


is null 
Features: 
The operators = or <> can not be used to check for null values
use " is null" or " is not null" to check for null 
"is null" can only be used to check for null values, not for other values.


<=>
you can use <=> to compare values:
<=> can be used to compare both "null" and non-null values
*/

# 3. like 
#3.1 question: Show the information of employees whose names contain the letter "a".
SELECT * FROM employees
WHERE 
       last_name LIKE '%a%';
       
       
#3.2 question: Show the names and salaries of employees whose third character in the name is "n" and the fifth character is "l".
SELECT last_name,salary
FROM employees
WHERE 
     last_name LIKE '__n_l%';


#3.3 question: Show the names of employees whose second character is _ ( use escape）
SELECT last_name
FROM   employees
WHERE last_name LIKE'_p_%' ESCAPE 'p';


# 4.between and 
# 4.1 question: Show the information of employees whose employee ID is between 100 and 120. ( there are two methods)
SELECT 
       * 
FROM   
       employees
WHERE 
	   department_id>=100 and department_id<=120; 
       
#----- but use between and is more simple 
SELECT 
       * 
FROM   
       employees
WHERE 
	   department_id BETWEEN 100 and 120; 
       
       
       
# 5.in 
# 5.1 question: Show the last name and job IDs of employees whose job ID is one of the following: IT_PROG, AD_PRES, or AD_VP.
SELECT 
       last_name,
       job_id
FROM  
       employees
WHERE 
       job_id IN ( 'IT_PROG', 'AD_PRES', 'AD_VP');


# 6.is null 
# 6.1 question: Show the names and commission rates of employees who do not have a bonus.
SELECT 
        last_name,
		commission_pct
FROM 
        employees
WHERE
        commission_pct IS NULL; 
        
        
        
# 6.2 question: Show the names and commission rates of employees who have a bonus.
SELECT 
        last_name,
		commission_pct
FROM 
        employees
WHERE
        commission_pct IS NOT NULL; 
        
        
        
#  mark  <=> equal = but can use both null and num

SELECT 
    last_name,
    commission_pct
FROM   
    employees
WHERE 
    commission_pct <=> NULL;

SELECT 
    last_name,
    salary
FROM   
    employees
WHERE 
    salary <=> 12000;






