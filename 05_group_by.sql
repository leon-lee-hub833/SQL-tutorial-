
/*
group by grammer

select 分组函数， 列 （要求出现在group by 的后面） 
from 表名
【 where 分组条件】 
group by 分组的列表 
【order by 排序】 
having  分组函数条件 

特点：
1. 分组查询中的筛选条件分为两类 
                 数据源                      位置                      关键字
分组前筛选       原始表                       group by 子句前面        where  
分组后筛选       分组后的结果集               group by 子句后面        having

注意 
分组函数做条件一定用 having 
使用原始表做条件筛选的优先使用  where ( 分组前筛选） 

2 group by 句子支持单个字段分组， 也支持多个字段 （字段之间用逗号隔开，顺序没有要求，）也可以用不函数或者表达式（较少）
3 可以添加排序 order by 放在最后  
*/

# 简单查询分组 

# 1. 案例查询每个部门的平均工资 
# 之前学过的查询所有员工的平均工资 
select avg(salary) from employees;

select avg(salary), department_id
from employees
group by department_id;

# 2. 查询每个工种的最高工资  
select max(salary), job_id 
from employees
group by job_id;

# 3.查询每个位置上的部门个数  
select count(*), location_id
from departments # 在departments有部门个数 
group by location_id;

# group by 前添加筛选条件 where 进行筛选 
# 4.查询邮箱中包含A字符的每个部门的平均工资 。  用where  筛选条件 
select avg(salary), department_id
from employees
where email like '%a%'
group by department_id;
# 困惑 ： 1.我怎么知道选出来的 email 都是含有a的 2 怎么在结果中显示 email 

select email 
from employees 
where email like '%a%';


# 3. 查询有奖金的每个领导手下员工的最高工资 
select max(salary), manager_id
from employees
where commission_pct is not null 
group by manager_id;


# group by 后面添加筛选条件 having进行筛选  

# 4. 查询哪个部门的员工个数大于2   添加分组后的筛选 用 having  
select count(*), department_id
from employees
group by department_id
having count(*)>2;

# 5 查询每个工种有奖金的员工的最高工资>12000的工种编号和最高工资 
select max(salary), job_id
from employees
where commission_pct is not null 
group by job_id
having max(salary)>12000;

# 6 查询领导编号>120的每个领导手下的最低工资>5000的领导编号是那些。 以及其最低工资 
select min(salary), manager_id
from employees
where manager_id>120
group by manager_id
having min(salary)>5000;


# 可以按照函数分组， 或者表达式分组 
# 7。按员工长度姓名分组， 查询每一组的员工个数， 筛选员工个数>5的有哪些 
select count(*), length(last_name)
from employees
group by length(last_name)
having count(*)>5;


# 按多个字段分组 ( department_id, job_id  行必须相同） 
#8. 查询每个部门每个工种的员工的平均工资  
select avg(salary), department_id, job_id 
from employees
group by department_id, job_id;


# 添加排序 
#9. 查询每个部门每个工种的员工的平均工资 ， 按员工工资高低排序 
select avg(salary), department_id, job_id 
from employees
group by department_id, job_id
order by avg(salary) desc;

# 结合着添加 
select avg(salary), department_id, job_id 
from employees
where department_id is not null # null 值去除 
group by department_id, job_id
having avg(salary)>10000  # 筛选大于10000的员工工资 
order by avg(salary) desc;

