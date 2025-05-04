
# after from is table - it can have any number of rows and columns ( the query result acts as a table)
# A subquery inside from must be given an alias. 

# 1. query the salary grade of the average salary in each department  
#  first, query the average salary of each department 
select department_id,avg(salary)
from employees 
GROUP BY department_id; 

# then, insert the result into the job_grades table by using a subquery  
select  ag_grade.*,grade_level
from (
       select department_id,avg(salary) as a
       from employees 
	   GROUP BY department_id 
) as ag_grade
join job_grades
on ag_grade.a between lowest_sal and highest_sal;


/*
exists 
what is exists : 
exists is a correlated subquery used too test whether a subquery returns any rows 
1. if the subquery returns at least one row, exists returns true 1
2. if the sybquery returns no rows, exists returns false 0 
3. even if the returned valuse is null, as long as there is a row, exists return true 1 

select exists ( complete cause ) / to check reture 1 or 0

*/


select exists ( select commission_pct from employees);  # the first coluns has null, returned 1 
select EXISTS (select commission_pct from employees where employee_id = 189); # there are employee_id is 189 so returned 1
select EXISTS ( select employee_id from employees where salary= 300000); # no employees salary is 300000, returned 0

# 1. query the department that have employees 
# use join 
select department_name, count(e.employee_id)
from departments as d 
join employees as e 
on d.department_id = e.department_id 
group by department_name;

# use exists 
select department_name
from departments as d 
where EXISTS( 
             select * 
             from employees as e 
             where e.department_id = d.department_id);

