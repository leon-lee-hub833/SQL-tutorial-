/*
sql99 支持
内连接 ： 等值连接， 非等值连接， 自连接 
外连接： 左外连接， 右外连接， 全连接（ mysql不支持） 
交叉连接 

语法：
内连接 
select ...
from ...
(inner) join ...... on .....=... 

特点：
1. 可添加，筛选， 排序， 分组 
2. 可以省略 inner 

外连接 
select....
from ....
left/right (outor) join .... on .....= ...

交叉连接 
select....
from ....
cross join .... on .....= ...
*/

#1 内连接 
#1.1 等值内连接  
# 案例： 查询员工名， 部门名
select last_name, department_name 
from  employees as e 
join departments as d on e.department_id = d.department_id;  # 两个表可以调换顺序 

#案例：查询工种名和名字中包含E的员工名 （ 包含查询条件: 模糊查询） 
select last_name, job_title
from employees as e
join jobs as j
on e.job_id = j.job_id 
where last_name like'%e%';


#案例3， 查询部门分组>3的城市名， 和部门个数， （分组+筛选） 
select city, count(*) 
from locations as l 
join departments as d 
on l.location_id = d.location_id
group by  city
having count(*) >3;

# 案例4： 查询哪个部门的部门员工个数>3的部门名和员工个数， 按个数降序 
select department_name , count(*) 
from departments as d 
join employees as e 
on d.department_id = e.department_id 
group by department_name 
having count(*) >3
order by count(*) desc;

# 案例5： 查询员工名， 部门名，工种名 ，按照部门名降序 （三表连接+排序） 
select e.last_name, d.department_name, j.job_title  # ( 要加库名.表名） 
from employees as e 
join departments as d on e.department_id = d.department_id
join jobs as j on e.job_id = j.job_id
order by department_name desc;

# 1.2 非等值连接 
# 员工的工资级别 
select salary, grade_level
from employees 
join job_grades 
on salary BETWEEN lowest_sal and highest_sal;

select * from job_grades;

# 查询工资级别的个数>2， 并且按工资级别降序  ( 大于20的工资级别有多少）
select grade_level, count(*)
from employees as e
join job_grades as j
on e.salary between j.lowest_sal and j.highest_sal
group by grade_level
having count(*) > 20
order by grade_level desc;

#3 自连接 
# 查询员工的名字， 上级的名字 ( 我怎么知道哪个是领导， 哪个是员工呢？）  
select e.last_name as 员工名字, m.last_name as 领导名字
from employees as e
join employees as m
on m.manager_id = e.employee_id ;

select * from employees;
#  查询姓名中包含字符K的 员工的名字， 上级的名字 ( 我怎么知道哪个是领导， 哪个是员工呢？）  
select e.last_name as 员工名字, m.last_name as 领导名字
from employees as e
join employees as m
on m.manager_id = e.employee_id 
where e.last_name like '%k%';

# 外连接  
# 左外连接  A ，B两个表 用A表的目标列的全部匹配B的目标行 没有的 null 

select * from girls.beauty;
select * from girls.boys;

# 案例：查询没有男朋友的女人的名字
select name, boyName 
from beauty 
left join boys 
on beauty.boyfriend_id= boys.id
where boyName is null;

select name, boyName 
from boys
left join beauty
on beauty.boyfriend_id= boys.id;


# 右外连接 
select name, boyName 
from boys
right join beauty
on beauty.boyfriend_id= boys.id
where boyName is null;


# 案例 哪个部门没有员工
select department_name, e.employee_id
from departments as d 
left join employees as e 
on d.department_id = e.department_id
where e.employee_id is null;

# 全外连接， mysql 不支持 
# 全外查询的是交集部门，主表有从表没有的null , 从表有主表没有的 null  

# 交叉连接 = 卡迪尔乘急， 每一行链接  
use girls;
select b.*, bo.* 
from beauty as b 
cross join boys as bo;




