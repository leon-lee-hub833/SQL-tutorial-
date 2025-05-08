/*
auto-incretment column
Definition： 
No need to manually insert values; the system will automatically assign sequential numbers


features：
1. Auto-increment columns don't have to be primary keys, but they must be asssociated with an index
2. A table can only have one auto-increment column
3. Auto-increment columns can only be applied to integer data type, int
*/

select * from tab_identity;

#create a auto_increment
# add after column type ( auto_increment)
use test2;

# create table then create auto-increment column
create table tab_identity(
           id int primary key  auto_increment,
	       name varchar(20));


# add row into the tab_identity table, there are two methods to deal with auto-increment
# 1. set to 'null' will automatically generate the next available integer value for it
insert into tab_identity values(null, 'china');

# 2. only the name column is explicitly set to 'thailand', but the id columns will utomatically assign the next available ID value
insert into tab_identity(name) values('thailand');



# Auto-increment step size can be configured (not commonly used) 
show variables like 'auto_increment%';  # used to check the current auto-increment step and strating value 
set AUTO_INCREMENT_increment = 3;  # set the auto-increment step size to 3


# the starting value of auto-incerement cannot be directly set in MySQL
# but it can be changed using a workaround 
/*
example 
insert into tab_identity values(10, 'china'); manually set a row with id=10 
insert into tab_identity values(null , 'japan'); then set next rows id= null, the auto-increment will start from 11, 
*/

# delete auto-increment column 
alter table tab_identity modify column id int;

# set up a auto-increment column when modify table   
alter table tab_identity modify column id int auto_increment;


