/* 
 constraints 
 definition: constraints are used to limits the data in rows or columns of a table. 
		     they help ensure accuracy and consisitency of the data in the table
 
 syntax:
 create table table_name （
    column_name  column_type  constraints
    ）


six main types of constraints 

constraint      chinese name       description
not null        非空约束 ：        the column cannot be NULL 
default         默认约束 ：        assigns a default value to a column. if no value is provided, the default is used  
primary key     主键约束 :         ensure the column has unique and non-null values
unique          唯一约束 ：        ensure all values in a column are unique, it can allow null( eg., seat numbers)
check           检查约束 ：        used to limit the range of values, but not supported in mysql 
foreign key     外键约束 ：        ebsure that the values in this column must exist in the referenced colimns of other table  


adding constraints：
when creating a table 
when modifying an existing table 

types of constraint definitions 
column-level constraints (commonly use) 
	 other constranits all can use,only foreign key syntax is allowed, but doesn't take affect （suggest use table_level） 
 table-level constraints 
     not null and default are not supported at the table level 
     
placement of constraints 
column-level：
      create table table_name （
    column_name  column_type  constraint，
	column_name  column_type  constraint，
    ）
    
table-level  
	create table table_name （
    column_name  column_type  constraint，
     column_name  column_type  constraint，
     constraint 
    ）
    */
    
# add constraints when create table 
# create column-level constraint
create database students;
use students;
create table stuinfo(
        id int primary key, # primaty key
        stuName varchar(20) not null,# not null key
        gender char(1) check(gender='男' or gender='女'), # check 
        seat int unique, # unique
        age int default 18); 
select * from stuinfo;
desc stuinfo;  

    
# add table-level 
create table stuinfo1(
        id int,
        stuName varchar(20),
        gender char(1),
        seat int,
        age int,
        majorID int,  # the last column have to use , devide with table constraint
        PRIMARY KEY(id), 
        unique(seat),
         foreign key(majorid) references major(id)
        );
        
 create table major (
        id int primary key,
        majorName varchar(20));
        
# common write: only forgine use table-level, the others use column-level
/*
create table stuinfo(
        id int primary key, 
        stuName varchar(20) not null,
        gender char(1),
        seat int unique, 
        age int default 18,
        majorID int,
        CONSTRAINT fk_stuinfo1_major forgien key(majorid) references major(id) #(complete clause)
        );
*/


# different between primary key and unique 
/*
name				  unique			 null allowed			   how many per table		Composite Key Allowed
primary key             √                ×                          only one                  can （ no common）
unique                  √                √ only one null            can multiple              can （ no common） 
*/

# characteristics of foreign keys
# 1. Foreign key relationships are defined in the child table( foreign/secondary table)
# 2. The foreign key column in the child table must have the same data type as the reference columns in the parent table ( column names can differ)
# 3. the reference column in the parent table must be a key( usually a primary key or unique)
# 4. when inserting data, the system checks the parent table first before inserting into child table 
# 5. when deleting data, delete from the child table before deleting from the parent table 


# add constraint when modify columns 
#alter table table_name  motify column column_name  column_type  constraint 

# add table-level constraint
# allter table table_name add constraint（columns） 

# removeing constraints when modifying a table 
# to remove a constraint, simply omit it when modifying the column
# alter table table_name  motify column column_name column_type 

# or 
# delet primary key 
# alter table table_name drop primary key;
# delete unique
# alter table table_name drop index;
# delete foreign key
# alter table table_name drop foreign key FK_name 



