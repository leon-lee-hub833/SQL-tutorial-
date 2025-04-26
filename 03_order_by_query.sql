
# question.Select the employee name, department number, and annual salary, 
# and sort the results by annual salary in descending order, then by department number in ascending order.
use myemployees;
SELECT last_name, department_id  ,salary*12*(1+IFNULL(commission_pct,0)) AS annual
FROM employees
ORDER BY annual DESC, department_id ASC;


# question: Select the names and salaries of employees whose salaries are not between 8,000 and 17,000, ordered by salary in descending order.
SELECT last_name,salary
FROM   employees
WHERE  salary NOT BETWEEN 8000 AND 17000
ORDER BY  salary DESC;


# Select all employee information where the email contains the letter 'e',
# sort the results by the byte length of the email in descending order
# then by department number in ascending order.
SELECT * , LENGTH(EMAIL) #  we have to creat new column for caculate length of email 
FROM employees
WHERE email LIKE '%e%'
ORDER BY LENGTH(EMAIL) DESC, department_id ASC;

