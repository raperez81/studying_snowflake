/* Array */
use role sysadmin;
use database testdb;
use schema public;

create table my_array_table (
name varchar,
hobbies array
);

insert into my_array_table
select 'Alina Nowak', array_construct('Writing', 'Tennis', 'Baking');

select * from my_array_table;
/* output:
name        |   hobbies
Alina Nowak	|   [   "Writing",   "Tennis",   "Baking" ]
*/

select name, hobbies[0] from my_array_table;
/*
NAME	       |   HOBBIES[0]
Alina Nowak	   |   "Writing"
*/
