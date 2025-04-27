/* 
分组函数 又叫 统计函数， 聚合函数 
1分类：
sum() 求和， avg() 平均值， max() 最大值， min（）最小值， count() 计数 

2特点:
1 sum. avg 一般处理数值类型， max, min, count() 可以处理任何类型 
2 所有分类都忽略了null 值 

3 用关键字 distinct 去重

4 count() 函数的介绍 

5 和分组函数查询的字段 只能是group by 后的字段
*/

# 1.1简单单个运算 
select sum(salary) from employees;
select avg(salary) from employees;
select max(salary) from employees;
select max(salary) from employees;
select min(salary) from employees;
select count(salary)from employees;

# 1.2多个一起查询 
select sum(salary), avg(salary),max(salary),min(salary),count(salary)
from employees;

# 1.3函数可嵌套 
select sum(salary), round(avg(salary), 2) ,max(salary),min(salary),count(salary)
from employees;

# 2.1 sum. avg 一般处理数值类型， max, min, count() 可以处理任何类型 
select sum(last_name), avg(last_name) from employees; # 显示0 
select max(last_name) from employees; #显示 Zlotkey 按字母排序  
select min(last_name) from employees; #显示 Abel 按字母排序  
select count(last_name) from employees; # 107

# 2.2 所有分类都忽略了null 值 
select sum(commission_pct), avg(commission_pct) from employees;
select avg(commission_pct), sum(commission_pct)/35, sum(commission_pct)/107 from employees;
select min(commission_pct), max(commission_pct) from employees;
select count(commission_pct) from employees;

# 3. 用关键字 distinct 去重 不加逗号
select sum(distinct salary) , sum(salary) from employees;
select count(distinct salary), count(salary) from employees;
# 用的最多的这两个  

# 4. count() 函数的介绍 有四种方法可以计数  
select count(salary) from employees;  # 单个行的查询
select count(*) from employees; # 全部查询
select count(1) from employees; # 全部查询
select count('haha') from employees; # 全部查询 不推荐  

# 5.和分组函数查询的字段 只能是group by 后的字段
# 和分组函数查询的字段， 表格需要一致 
select count(salary), salary from employees; # 报错 


