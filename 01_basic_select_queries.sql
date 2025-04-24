# 进阶1 基础查询 select
/* select 查询列表 from 表名
查询列表可以是什么
可以查询表中字段column, 常量值，表达式，函数
查询表格是一个虚拟的表格
*/
# 先打开库名 
USE myemployees; 

 #  查询表格的单个字段 
SELECT last_name FROM myemployees.employees;

# 查询表中的多个字段
SELECT last_name,salary,email FROM myemployees.employees; 

 /*查询表中的所有字段 
select employee_id,first_name,last_name,phone_number,....... 可以用F12整理格式 
这个比较麻烦 */
SELECT * FROM myemployees.employees; 

# 要执行哪条，选中哪条以后点闪电执行就可以了 

# 查询常量值 
SELECT 100;     # 查询整数型 
SELECT 'join';  # 查询字符型

# 查询表达式 
SELECT 100*98; 

# 查询函数 
SELECT VERSION();   # 查询当前版本 

# 给字段 column 起别名 两种方式 
/* 好处 
1. 便于理解
2. 如果要查询的column 有重名可以使用别名区分开来 
*/ 
# 方式1 用AS
SELECT last_name AS 姓,first_name AS 名 FROM myemployees.employees; 
# 方式2 使用空格 
SELECT last_name 姓 FROM myemployees.employees;

# 如果起的别名大于一个单词 用双引号或者单引号引起来 如下
SELECT first_name 'your name' FROM myemployees.employees;


