/*
union query 

keyword: union 
defination： combine the results of multiple query statements into one  
syntax：
select cluase 1 
unoin 
select cluase 2
union 
select cluase 3
.....

application scenario
the results to be queried come from nultiple tables, 
and this tables do not have direcy relationships between them
however, as long as the information we are querying is structurally consistent, 
we can use union queries 

notes
1. when using union queries across multiple tables, the number of columns in each query must be same
2. when the column count is the same, it is also recommended that the column names match across the table for alignment.
3. if there are duplicate valuesm union will remove duplicates by default
*/

# 1.Retrieve employee information where the department ID is greater than 90 or the email contains the letter 'a'.
use myemployees;
select *
from employees
where department_id > 90 or email like '%a%';

# union 
select *
from employees 
where department_id > 90 
union 
select *
from employees 
where email like '%a%';


/*
create two table 
table 1 tca
id cnname cnsex 
1  韩梅梅  女 
2  李霄    男
3  李明    男  

table 2 tua
t_id  tNmae  Tgender 
1      join     male 
2      lucy     female
3      lily     female
4      jack     male
5      rose     female 

*/

CREATE DATABASE test;
USE test;
CREATE TABLE tca (  
    id INT AUTO_INCREMENT PRIMARY KEY,  
    cnname VARCHAR(255) NOT NULL,  
    cnsex ENUM('男', '女') NOT NULL  
);  
  
# insert data to tca table 
INSERT INTO tca (cnname, cnsex) VALUES ('韩梅梅', '女');  
INSERT INTO tca (cnname, cnsex) VALUES ('李霄', '男');  
INSERT INTO tca (cnname, cnsex) VALUES ('李明', '男');

CREATE TABLE tua (  
    t_id INT AUTO_INCREMENT PRIMARY KEY,  
    tName VARCHAR(255) NOT NULL,  
    Tgender ENUM('male', 'female') NOT NULL  
);  
  
#insert data to tua table
INSERT INTO tua (tName, Tgender) VALUES ('join', 'male');  
INSERT INTO tua (tName, Tgender) VALUES ('lucy', 'female');  
INSERT INTO tua (tName, Tgender) VALUES ('lily', 'female');  
INSERT INTO tua (tName, Tgender) VALUES ('jack', 'male');  
INSERT INTO tua (tName, Tgender) VALUES ('rose', 'female');

# 2. Retrieve all male users from Chinese users and all male users from foreign users (with consistent query information).
use test;
select id,cnname, cnsex 
from tca 
where cnsex = '男'
union
select t_id, tName, Tgender
from tua
where Tgender = 'male';






