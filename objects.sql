/* Object 
Represent collections of key-value pairs.
*/
use role sysadmin;
use database testdb;
use schema public;

create table my_object_table (
name varchar,
address object
);

insert into my_object_table
select 'Alina Nowak', object_construct('postcode','TY5 7NN','first_line','67 Southway Road');

select * from my_object_table;
/* output:
NAME	       | ADDRESS
Alina Nowak	   | {   "first_line": "67 Southway Road",   "postcode": "TY5 7NN" }
*/

select name, address['postcode'] from my_object_table;
/* output:
NAME	       |   ADDRESS['POSTCODE']
Alina Nowak	   |   "TY5 7NN"
*/
