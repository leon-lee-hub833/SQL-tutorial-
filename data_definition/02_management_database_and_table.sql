/*
management and operations of databases and tables 
 create 
 alter 
  drop 

database 
syntax:
create： create database database_name 
modify： alter database database_name  （ generally there's nothing that needs to be altered）  
delete： drop  database database_name  

note：
When working with multiple people, we may not know whether a database has already been created 
to avoid errors, use if not exists for creation and if exists for deletion
 
create： create database if not exists database_name  
delete： drop  database if exists database_name

table
syntax:
create:
create table tabel_name（
                         column_name data_type【（length） constraint】 --optional,
                         column_name data_type【（length） constraint】,
                         .....
                         column_name data_type【（length） constraint】
）


modify
1. rename a column  :                   alter table table_name change column old_column_name new_column_name column_type；
2. column type or constraints：         alter table table_name modify column column_name new_column_type； 
3. add column :                         alter table table_name add cloumn new_column_name column_type；
4. delete a column ：                   alter  table table_name drop cloumn column_name；
5. rename the table ：                  alter  table  table_name  rename to new_table_name； 

delete table
drop table table_name

note：
when create and drop the table also can use to text
create table if not exists book(
drop table if exists book 

copy a table
1. copy table structure only(no data):  create table new_table like original_table
2. copy structure and data:             create table new_table as select * from original_table
3. copy only paetial data:              create table new_table as select column1, column2 from original where condition

*/

# examples 
# create a database
create database if not exists books;  

# modify database  
# if we want the database to use GBK character set( commonly used for simplified chinese) 
# usually we do not modify database 
alter database books character set gbk;

#delete database 
drop database IF EXISTS books;




# create a table  
create database if not exists books;
use books;
create table book(
			id int,
            bName VARCHAR(20),
            price double,
            authorID int,
            publishDate datetime);

# view the structure of a table   
desc book;

create table auther(
			id int,
            au_Name VARCHAR(20),
            nation varchar(10) );
            
		
        
# modify table 

# rename columns name 
# 1. modify the column name phulishDate to pubdate in the book table 
alter table book change column publishDate pubdate datetime;

# modify column type or constraints
# 2.modify the data type of pubdate column in the book table from datation to timestap 
alter table book modify column pubdate timestamp;

# add column 
# 3.add the author's annual salary column to the author table 
alter table auther add column annual double ;

# drop column
# 4.delete the author's annual salary column from the author table 
alter table auther drop column annual;

# modify the table name 
alter table auther rename to authors;


# delete  
# drop table table_name 

# common syntax for create  
# drop database if exists database_name  # delete the existing database first
# creat database database_name           #  then create your won database 


# copy table 

# create value for after use 
insert into auther
values( 1, ' hanhan', 'china'), ( 2, 'moyan', 'china'),(3, 'haimingwei','sua');
select * from auther;
 
 #1. copy table structure only (no data)
 create table copy like auther;
 select * from copy;
 
 #2. copy table structure + all data 
 create table copy2
 select * from auther;
 select * from copy2;
use books;

#3. copy table structure + target data 
create table copy3
select id, au_Name 
from copy2;

select * from copy3;

# 4. copy some clounms from original table ( uncommon)
create table copy4 
select id, au_Name 
from copy2 
where 0;
select * from copy4;  





