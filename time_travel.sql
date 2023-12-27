create database testdb;

create table test_table(Product varchar(100), id numeric);

insert into test_table (Product, id) values ('Mouse', 1);
insert into test_table (Product, id) values ('Keyboard', 2);
insert into test_table (Product, id) values ('Monitor', 3);


update test_table set Product = 'Mouse 1' where id = 1;

select * from test_table at(timestamp => to_timestamp_ltz('2023-12-27 12:30:00'));
select * from test_table before(statement => '01b14550-0504-dfd4-0000-0002c8e35055');



create table test_table2 clone test_table;

select * from test_table2;

SHOW PARAMETERS IN DATABASE;

select current_timestamp;

select localtimestamp;
