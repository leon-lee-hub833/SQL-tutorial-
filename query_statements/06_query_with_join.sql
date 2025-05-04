/*
type of join query 
inner join ： equijoins， non-equijoins， self-joins 
outer join： left outer join， right outer join， full outer join（ mysql does not suppport full outer join） 
cross join : cartesian product of two table 

syntax：
inner join:
 
select ...
from ...
(inner) join ...... on .....=... 

Features：
1. can add filters， sorting，grouping etc.
2. The key word inner can be omitted


syntax:
cross join

select....
from ....
cross join .... 

cross join = Cartesian product, if Table 1 has m rows and Table 2 has n rows, the resulting table will have m × n rows.

*/

#1 inner join
#1.1 inner join < equijoins>
# query last_name  and department name 
select last_name, department_name 
from  employees as e 
join departments as d on e.department_id = d.department_id;  # The two tables can be switched.


# Query the job ID and the names of employees whose names contain the letter "E". （ include where conditions: like） 
select last_name, job_title
from employees as e
join jobs as j
on e.job_id = j.job_id 
where last_name like'%e%';


# Query the city names and the number of departments in each city, where the number of departments is greater than 3 (grouping + filtering). 
select city, count(*) 
from locations as l 
join departments as d 
on l.location_id = d.location_id
group by  city
having count(*) >3;

# Query the department names and the number of employees for departments that have more than 3 employees, sorted in descending order by the number of employees.
select department_name , count(*) 
from departments as d 
join employees as e 
on d.department_id = e.department_id 
group by department_name 
having count(*) >3
order by count(*) desc;

#  Query the employee names, department names, and job titles, sorted in descending order by department name (join three tables and sort).
select e.last_name, d.department_name, j.job_title  
from employees as e 
join departments as d on e.department_id = d.department_id
join jobs as j on e.job_id = j.job_id
order by department_name desc;

# 1.2 inner join<non-equijoins>
# Query salary grade of employees.
select salary, grade_level
from employees 
join job_grades 
on salary BETWEEN lowest_sal and highest_sal;

select * from job_grades;

# Query the salary grades that have more than 20 employees, and sort them in descending order by salary grade.
select grade_level, count(*)
from employees as e
join job_grades as j
on e.salary between j.lowest_sal and j.highest_sal
group by grade_level
having count(*) > 20
order by grade_level desc;

#3 inner join < self-join>
# Query employee's name and their manager's name  
select e.last_name as employees_name, m.last_name as manager_name
from employees as e
join employees as m
on m.manager_id = e.employee_id ;

#  Query the names of employees whose names contain the letter 'K', and the names of their managers. 
select e.last_name as employees_name, m.last_name as manager_name
from employees as e
join employees as m
on m.manager_id = e.employee_id 
where e.last_name like '%k%';





# outer join  
/*
outer join divide to 

left outer join 
example 
left table have name column 
right table have department column 
name + IT -match - show both rows 
name + null - department not found 
wont appear - name not found 

right outer join 
left table have name column 
right table have department column 
name + IT -match - show both rows 
null + IT- name not found
wont appear - department not found

full outer join
musql not support fll outer join 

syntax: 
selet ....
from tabel 2
left/right [outer] join table2 on key1 = key 2 

*/

select * from girls.beauty;
select * from girls.boys;

# outer join <left join>
# query the girl's name who haven.t boyfriend 
select name, boyName 
from beauty 
left join boys 
on beauty.boyfriend_id= boys.id
where boyName is null;

select name, boyName 
from boys
left join beauty
on beauty.boyfriend_id= boys.id;

# query which department haven't employee 
select department_name, e.employee_id
from departments as d 
left join employees as e 
on d.department_id = e.department_id
where e.employee_id is null;


# outer join < right join>
select name, boyName 
from boys
right join beauty
on beauty.boyfriend_id= boys.id
where boyName is null;

# full outer join
# mysql not support fll outer join 

/*
cross join = Cartesian product, if Table 1 has m rows and Table 2 has n rows, the resulting table will have m × n rows.

*/ 
use girls;
select b.*, bo.* 
from beauty as b 
cross join boys as bo;




