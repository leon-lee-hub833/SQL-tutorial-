/*
Data manipulation language including 
1. data insertion  ： insert
2. data update : update
3. data deletion: delete 

Note: SELECT is also often considered part of DML, but it is commonly categorized separately due to its complexity and importance.

*/

/*
data insertion :  two types
1.
insert into table_name (column_name_1， column_name_2.....）
values (value_1， value_2，....)

2.
insert into table_name
set column_name = value， column_name=value.....
*/

use girls;
select * from beauty;

# 1. insert into ... values 
# method 1.1： column have to match with value, use null if column has no value 
insert into beauty(id, name, sex, borndate, phone, photo, boyfriend_id)
values( 13, '刘亦菲', '女', null, '120',null,null);

# method 1.2: omit columns if no value 
insert into beauty(id, name, sex, phone)
values( 14, '郑爽', '女',  '100');

# note: if the primary key "id" is set as auto_increment, setting the value to NUll won't cause an error
# the system will automatically assign the ID as (current max ID+1）
insert into beauty(id, name, sex, phone)
values( null , '王倩', '女', '222');
 

# 1.3.the order of columns can be changed 
insert into beauty(name, id, sex, phone)
value('娜扎', null, '女','11222');

# 1.4. the number of columns and values must macth, otherwise, an error will occur  

# 1.5. can directly write the table name. it will assume all coulumns by default 
insert into beauty
values( null, ' 范冰冰' , '女', null, '222', null, null);


# 2. insert into table_name 
# set column = value， column= value， 
insert into beauty
set id=null, name='张天爱', phone='122';

# 3. comparison of two types of data insertion
# 3.1. type 1 supports inserting multiple rows, but type 2 does not 
insert into beauty(id,name, phone)
values (20, '小龙女', '10029'),
 (21, '小龙', '10019'),
  (22, '小花', '1022019');

# 3.2. type 1 support subqueries, but type 2 does not 
select * from boys;
insert into beauty(id, name, phone)
select id, boyName, '199989'as phone
from boys;


# data update 
/*
1. updating record in a single table 
syntax:
update table_name                           1 program enters table
set column= value， column= value....       3 filter the traget rows based on the where condition 
where condition                             2 locates the specified columns and updates their value

2. updating records across multiple tables 
syntax:
update table 1 as alias1
(inner)|left|right|full (outer) join table 2 as alias 2
on condiation 
set column = value.....
where condition 
*/

# Examples 
#1. update single report 

SET SQL_SAFE_UPDATES = 0; # turn off safe mode, allows update table
SET SQL_SAFE_UPDATES = 1; # turn on safe mode, disallows update table  

# update the phone number to 10000000 for all female records whose name start with "xiao"
update beauty 
set phone = '10000000'
where name like '小%';

# Update the name and user score of the boy whose ID is 2
update boys set boyName='leon', usercp = '1000'
where id=2;


# 2. updateing mutiple table 
# Update the phone number of 张无忌's girlfriend to 114 (INNER JOIN between two tables)
update boys as bo 
inner join beauty as b 
on bo.id = b.boyfriend_id 
set b.phone = '114'
where boyName = '张无忌';

# Update the boyfriend ID to 2 for all girls who do not have a boyfriend.

select *
from beauty as b
left outer join boys as bo 
on b.boyfriend_id = bo.id ;

update beauty as b
left outer join boys as bo 
on b.boyfriend_id = bo.id 
set b.boyfriend_id = 2
where bo.id is null 

#data deletion 
/*
delete single tabel
delete from table_name where condition

delect from mutiple tabel
delete alias1， alias2
from  table1 as alias1
join table2 as alias2  on  condition
where condition

2. truncate table  table_name
note : truncate does not allow where condition
*/

use girls;
select * from beauty;
select * from boys;

# delete
# delet from single table 
# delet the records of female users whose phone numbers end with 9
SET SQL_SAFE_UPDATES = 0;
delete from beauty
where phone like'%9';

# delete from mutiple table 
#Delete the record of Zhang Wuji's girlfriend.
delete b，bo
from beauty as b 
inner join boys as bo on b.boyfriend_id = bo.id 
where boyName = '张无忌'


# truncate 
# comparison between truncate and delete
/*
1. delete allows where conditions, truncate does not.
2. If the deleted table has an auto-increment column, DELETE continues counting from the last value,
   while TRUNCATE resets the count starting from 1.
3. TRUNCATE does not return the number of affected rows; DELETE does.
4. TRUNCATE is not reversible; DELETE can be rolled back (if used within a transaction).
*/


