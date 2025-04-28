#1, find the maximun, minimun , average and sum of employee salary for each job_id and order by job_id ascending 
select max(salary), min(salary), avg(salary), job_id
from employees
group by job_id
order by job_id ASC;

#2.query the defference between highest and lowest salaries 
select max(salary) - min(salary) as difference 
from employees; 


# 3. query the lowest salary of employee in each manager 
#    while the lowest salary can not be less than 6000, and excluding the manager without employee
select min(salary), manager_id
from employees 
where  manager_id is not null 
group by manager_id 
having min(salary)>6000;

# 4. query the department_id, employee number, and average salary, while order by average salary desc 
select department_id, count(*), avg(salary) 
from employees 
group by department_id 
order by avg(salary) desc;

# 5.  quert the employee number of each job_id
select count(*) , job_id 
from employees 
group by job_id;

