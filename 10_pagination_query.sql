/*
application scenario： when the displayed data cannot fit on a single page, a pagination request should be submitted

SQL clause execution order:
select column                             6
from table                                1
join type  on                             2
where                                      3
group by                                   4
having                                     5
order by                                   7
limit offset, count                        8

特点：
limit cluase should put the lastest in the whole clause

*/

# 1.retrieve the first five employee records
use myemployees;
select *
from employees 
limit 0, 5;

# if offset strats from beginning it can be omitted
use myemployees;
select *
from employees 
limit 5;   

#2.Retrieve employee records from the 11th to the 25th.
select * 
from employees 
limit 10,15;

# 3. Retrieve the first 10 employees who have a bonus.
select *
from employees 
where commission_pct is not null 
order by salary desc
limit 10;



