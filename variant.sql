/* Variant
Universal Semi-structured data type used to represent arbitrary data structures.
Variant data type can hold up to 16Mb compressed data per row
*/
use role sysadmin;
use database testdb;
use schema public;

create table my_variant_table  (
name variant,
address variant,
hobbies variant
);

insert into my_variant_table
select
'Alina Nowak'::variant,
object_construct('postcode', 'TY5 7NN', 'first_line', '67 Southway Road'),
array_construct('Writting','Tennis','Baking');

select * from my_variant_table;
/* output:
NAME	       | ADDRESS	                                                          | HOBBIES
"Alina Nowak"  | {   "first_line": "67 Southway Road",   "postcode": "TY5 7NN" }	  | ["Writting",   "Tennis",   "Baking"]
*/

/* Dot notation 
address:first_line
It also can be used for nested fields eg. src:employee.name
*/ 
select address:first_line, t.* from my_variant_table t;

/* Bracket Notation
eg. SRC['employee']['name']
- Column name is case insensitive
- key names are case sensitive
*/
select address['postcode'], t.* from my_variant_table t; 

/* Repeating Element
SELECT SRC:skills [0] FROM EMPLOYEES;
*/
select hobbies[0], t.* from my_variant_table t;
/*output:
HOBBIES[0]	 | NAME	             | ADDRESS	                                                          | HOBBIES
"Writting"	 | "Alina Nowak"     | 	{   "first_line": "67 Southway Road",   "postcode": "TY5 7NN" }	  | ["Writting",   "Tennis",   "Baking" ]
*/
