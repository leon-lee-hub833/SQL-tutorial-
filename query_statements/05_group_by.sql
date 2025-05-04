
/*
group by grammer

select aggregate function， column （require column appear behind group by） 
from table name
【 where filter_condition】 
group by column_have_to_group_by
【order by 】 
having  filter_condition_after_group_by

features：
1. filter condition in group by divide two types 
                              data source                     position                      keyword
filter before group by        raw data                      before: group by clause          where  
filter after group by       data after group by             after: group by clause           having

note
when using conditions on aggregate functions you must use "having"
when using conditions on original table, use "where" ( filter before group by ） 

2 the ' group by' clause supports grouping by a single column, and also supports grouping by multiple columns
  (columns are separated by comma, and there is no required order)
  it can also use expression or functions for grouping (rare)
3  can add sorting using order by , which should be placed at the very end
*/

# simple group by query 

# 1. query the average salary for each department
select avg(salary), department_id
from employees
group by department_id;

# 2. query the max salary for each job
select max(salary), job_id 
from employees
group by job_id;

# 3. query department number for each location
select count(*), location_id
from departments # 在departments有部门个数 
group by location_id;


# put "where" in fort of group by caluse 
# 4.query the average salary for each department where the email contains the character"a"
select avg(salary), department_id, email
from employees
where email like '%a%'
group by department_id, email;


select email 
from employees 
where email like '%a%';


# 3. Find the maximum salary of employees under each manager, consider those who have a commission 
select max(salary), manager_id
from employees
where commission_pct is not null 
group by manager_id;



# put " having" after group by clause  


# 4. query the department where the number of employees is greater than 2 
select count(*), department_id
from employees
group by department_id
having count(*)>2;

# put both " where" and "having" in frot and after group by. 

# 5 query the job ID and maximun salaries for each job,
#   based on employees who have a commission and salaries are more than 12000
select max(salary), job_id
from employees
where commission_pct is not null 
group by job_id
having max(salary)>12000;

# 6 query the manager IDs where the manager ID is greater than 120, 
    # the minimun salary of their employees is greater than 5000,
select min(salary), manager_id
from employees
where manager_id>120
group by manager_id
having min(salary)>5000;


# 7. group the employees by the length of their last name,
    # query the number of employees in each group,
    # find the groups where the nnumber of employees is greater than 5 
select count(*), length(last_name)
from employees
group by length(last_name)
having count(*)>5;


 
# when grouping by multiple columns ( department_id and job_id have to be same rows number)
# when grouping by multiple columns, the grouping is performed in oreder:
# first by the earlier columns, the by the later columns


# 8. query the average salary of employees for each department and each job 
select avg(salary), department_id, job_id 
from employees
group by department_id, job_id;


# add the sorting 
#9. query the average salary of employees for each department and each job 
   # sort the result by average salary in descending order.
select avg(salary), department_id, job_id 
from employees
group by department_id, job_id
order by avg(salary) desc;

# wehre + group by + having + order by 
# 10. query the average salary of employees for each department and each job 
     # while department id is not null 
     # the average salary of employees should be greater than 10000 
     # sort the result by average salary in descending oreder. 
select avg(salary), department_id, job_id 
from employees
where department_id is not null # null 
group by department_id, job_id
having avg(salary)>10000  
order by avg(salary) desc;

