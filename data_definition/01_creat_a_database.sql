/*
 the process of creat a database  
1， tf a database with the same name exists, delete it first 
2， cerate a new database
3， create a table in the database 
4， insert data into the table 
*/

# example 
drop database if EXISTS test2;
create database if not exists test2;
use test2;
create table boys(
		id int,
        name varchar(7),
        age int,
        girlfriend varchar(7));

insert into boys
values( 1, 'leon', 34, 'herke'),
      ( 2, 'nali', 34, 'hhoe');

select * from boys;

drop database if exists test2;
