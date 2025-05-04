
# Fearures
# The sub-query that after select
# The value after select supports scalar subqueries, which return one row and one clumn


# 1. query the number of employees in each department 
# explain : This involves two tables: one is the employees table and the other is the department table
# first

select  count(*)
from employees as e
join departments as d
on e.department_id = d.department_id;

# then
select d.*, (
             select  count(*)
             from employees as e
             where e.department_id = d.department_id  #
             ) as employee_number
from departments as d;


#  or can use this 
select department_name , count(*) 
from departments as d 
join employees as e 
on d.department_id = e.department_id
group by department_name;


# 2. query the department name of the employee whose employee_id= 102
select department_name 
from departments as d
join employees as e
on d.department_id = e.department_id
where employee_id = 102;




