/*
Subquery
Definition： 
a select statement that appears inside another SQL statement is called subquery 
the outer SQL statement is called the main query or outer query



Classification: 

Classified by position:
         After - select : Scalar subquery 
		 After - from   : Table subquery 
         After - where/having: Scalary subquery/ column subquery/ row subquery（less common） 
         After - exists:  Table subquery 

Classified by result set:
         Scalar subquery（ result: one row, one column） 
         column subquery (result: one column, nultiple rows） 
         row subquery  （ result: one row, multiple rows or nultiple rows and columns） 
		 table subquery 
*/


# after - where/having  (1. one row, one column/ 2.one column, nultiple rows)
/* feature：
1 placed inside parentheses（） 
2 Scalar subqueries are used with single-row operators like  <, >, <..
3 column subqueries are used with nulit-row operators like:  in , all , any/some  
4 the result of the subquery serves as the condition for the main query  
*/

# 1.where - subquery result : one column, one row
# 1.1. who's salary greater than abel 

# explan: fisrt we have to query abel's salary 
select salary , last_name
from employees 
where last_name = 'abel';

# then we query the last name and salary who greater than abel
select last_name , salary 
from employees 
where salary > (
               select salary 
               from employees 
               where last_name = 'abel');


# 1.2 use two subqueries inside the where clause, combined with "and“
# query the last_name, job_id, and salary of employees whose job ID is the same as that of employee 141 and whose salary is greater than employee 143
# first query the job_id of employee 141
select job_id 
from employees 
where employee_id = 141;

# then query the salary of employee 143
select salary 
from employees 
where employee_id= 143;

# last query last_name， job_id , salary while have to mactch job_id = 141 and  salary > 143
select last_name , job_id, salary 
from employees
where job_id = (
				select job_id 
                from employees 
				where employee_id = 141
) 
and 
salary > (
          select salary 
		  from employees 
          where employee_id= 143
);
                

#where
# 1.3 use an aggregate function (min) 
#：return the last_name, job_id, and salary of the employees with the lowest salary in the company 
# first find the lowest salary of employees 
select min(salary)
from employees;

# then use min salary as a condition 
select last_name , job_id, salary 
from employees 
where salary = (
                select min(salary)
                from employees);
                
                
                
                
# 1.4 having  (after group by)  subquery result one row one column
# 1.4 query the department ids and their minimum salaries where the department's minimum salary is gerter than the minimun salary of department 50
# first query the minumum salary of department 50
select min(salary)
from employees 
where department_id = 50;

# then query the department_id , and minumum salary of whose department id 
# extra: those minumum salary have to greater than minimum salary of department 50 ( as a condition) 
select department_id, min(salary) 
from employees 
group by department_id
having min(salary) > (
                      select min(salary)
                      from employees 
                      where department_id = 50);



# 2.where: result one column, nultiple rows / use In ， any,  some , all 
# 2.1  return the name of all employees who work in departments located at location_id 1400_1700
# first query the location_id is 1400 and 1700 and department_id in departments table
# use in 
select department_id, location_id
from departments
where location_id in (1400, 1700);

select last_name 
from employees
where department_id in (
   select department_id
   from departments
   where location_id in (1400, 1700)
);

# also can use any 
select last_name 
from employees
where department_id = any (
   select department_id
   from departments
   where location_id in (1400, 1700)
   );
   
# 2. 2 return the name of all employees who not work in departments located at location_id 1400_1700
# not in 

select last_name 
from employees
where department_id not in  (
   select department_id
   from departments
   where location_id in (1400, 1700)
);

#not in can use  <>ALL instead
select last_name 
from employees
where department_id <> ALL  (
   select department_id
   from departments
   where location_id in (1400, 1700)
);


# 案例2 返回其他部门中比 job_id 为 “IT PROG'部门任意工资低的员工的员工号， 姓名， job_id, salary  = any()
# 1先找出 job_id为“IT PROG'的部门 工资 
select salary 
from employees 
where job_id = "IT_pROG";

# 在找员工号 姓名， job_id， salary  其中 salary any 低 
use myemployees;
select last_name, job_id, salary
from employees 
where salary < any( 
                    select DISTINCT salary   # distinct 去一下重，因为查找的是不任意一个值小就可以了， 相同的值没有用 
                    from employees 
					where job_id = "IT_PROG"
)
and 
job_id <> "IT_pROG";

# 或者用max()
select last_name, job_id, salary
from employees 
where salary < ( 
                    select  max(salary)   
                    from employees 
					where job_id = "IT_pROG"
)
and 
job_id <> "IT_pROG";

# 案例3；返回其他部门中比job_id为 "IT_PROG"部门所有工资都低的员工的员工号，姓名，job_id，salary
#1 先找job_id为 "IT_PROG"的工资 
select salary 
from employees 
where job_id = "IT_PROG"

#2 在找 员工号，姓名，job_id，salary 并且  工资低与 1 
select employee_id, last_name , job_id, salary 
from employees 
where salary < all(
                   select salary 
                   from employees 
                   where job_id = "IT_PROG"
);
#或者用min() 
select employee_id, last_name , job_id, salary 
from employees 
where salary < (
                   select min(salary) 
                   from employees 
                   where job_id = "IT_PROG"
);

# 案例3；返回其他部门中比job_id为 "IT_PROG"部门所有工资都低的员工的员工号，姓名，job_id，salary
#1 先找job_id为 "IT_PROG"的工资 
select salary 
from employees 
where job_id = "IT_PROG"

#2 在找 员工号，姓名，job_id，salary 并且  工资低与 1 
select employee_id, last_name , job_id, salary 
from employees 
where salary < all(
                   select salary 
                   from employees 
                   where job_id = "IT_PROG"
);
#或者用min() 
select employee_id, last_name , job_id, salary 
from employees 
where salary < (
                   select min(salary) 
                   from employees 
                   where job_id = "IT_PROG"
);


# 行子查询 ，一行多列， 或多行多列（较少用） 
# 案例1 员工编号是最小的，工资最高的员工信息。
#1 首先查员最小的员工编号  
select min(employee_id)
from employees; 

#2 再查工资最高的  
select max(salary)
from employees;

#合起来 
select *
from employees 
where employee_id =(select min(employee_id) from employees)
and  salary = (select max(salary) from employees);

# 另一种写法 （前提是 两个条件符必须相同  = = ， <<, >>.....)
select * 
from employees 
where (employee_id, salary) = ( select min(employee_id), max(salary) from employees);






