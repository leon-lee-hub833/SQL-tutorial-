# 1. 
# common types of data 
/*
Numeric Types； 
integer types
Decimal/Floating-point types ： 

Character Types；
Short text： char, varchar
Long text: text, blob

Date and Time types；
*/


# The simpler the selected data type, the better; the smaller the size it used to store numeric values the better. 

/* Numeric- integer  
                   tinyint, smallint, mediumint, int/integer, bigint
  Starge(bytes)      1         2        3          4            8
 
 
 there are devide two types:      
 signed- ， unsigned（no negative numvers） 

1.Signed or Unsigned 
  By default, integers are signed( can store negative values)
  if want only non-negative values, use: int unsigned
  
2.Exceeding integer range
  if a value exceeds the defined range, it will trigger an " out of range" error
  or be stored as a boundary value.
 
3.int display width
 default width for signed int is 11
 default witdth for unsigned int is 10
 you can define the display width when creating a table using int(n)
 

Numeric- Floating point
floating point types
float (M, D） 4 bytes
double(M, D） 8 bytes

fixed point type:
dec(M, D） = decimal(M, D）

1. what is (M, D） 
(M, D）can be omitted， 
 M represents the total number of digits： 2.33 M is 3， 
 D represents the number of digits after the decimal point :  2.33 D is 2
*/

/*
Character Types
short text:  char, varchar
char(M)          
Fixed-length string, regardless of the number of characters entered, it always uses the full fixed length
the parameter M can be omitted, and defaults to 1 

varchar(M)
Variable-length string. the storage legth depends on the number of characters entered.

explain:
M  represent the maxium number of characters allowed  
M for char can be omitted, default to 1 
store gneder only "male" and "female"  use char(1) is appropriate

binary types:
binary and varbinary  store short binary data 

enum（'a', 'b','c') 
Can only store one value from the list 

set （'a', 'b','c') 
Can store nultiple values from the list at one 

long text:  test, blob 

*/

/*
date  store only the date (YYYY-MM-DD)
time  store time (HH:MM:SS)
year  store year (YYYY)

datetime   range 1000-9999      Not affected by time zones
timestamp  range 1970-2038     affected by time zones
*/
