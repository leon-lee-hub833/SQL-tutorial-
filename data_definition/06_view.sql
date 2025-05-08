/*
view
definition: 
A view encapsulates the result of a complex query and presents it as a virtial table
Instead of repeating long SQL statements, we can reuse the view in future queries as if it were a real table 
This help simplify complex SQL logic, improve readability, and centralize business rules in one place 


create view 
syntax:
create view view_name 
as
follow by complex select query;


modify view - two methods 
syntax:
1. 
create or replace view view_name
as
follow by complex select query;
2. 
alter view view_name
as
follow by complex select query;


delete view 
can delete one or more views at once 
it requires drop privileges, usually granted to the view owner or the root user
syntax:
drop view view1_name， view2_name.....;


view structure inspection - two method 
1.
desc view_name
2.
show create view view_name 
*/

use myemployees;

# 1. Create a view to query employees whose email contains the letter 'a' with department_name and job_title
# email, last_name in employees table, department_name in departments, job_title in jobs table
create view em_de_job
as 
select department_name, job_title, email 
from employees as e 
join departments as d on e.department_id = d.department_id 
join jobs as j on e.job_id = j.job_id; 

select * from em_de_job where email like '%a%';

# 2. query the salary grade level for each department 
# first, create a view of the average salary for each department
drop view avg_salary;
create view avg_salary 
as 
select avg(salary) as av, department_id
from employees 
group by department_id;

select * from avg_salary;

# then join with the job table to find corresponding reade levels 
select department_id, av, grade_level
from avg_salary as a
join job_grades as j on av between lowest_sal and highest_sal;


#3. query the department with the lowest average salary 
select * from avg_salary order by av asc limit 1;

# 4. query the department name and salaries for the department with the lowest average salary
# first, create a new view 
# the join to get department name and employee salaries  
drop view lowest_sa;
create view lowest_sa
as 
select * from avg_salary order by av asc limit 1;

select l.department_id, d.department_name, e.salary
from lowest_sa as l
join departments as d on l.department_id = d.department_id
join employees as e on e.department_id = l.department_id;




