create materialized view v1 as select * from test_table2;

select * from v1;

show materialized views;

show materialized views like 'v%';

insert into test_table2 (product, id) values ('Mouse pad',4);

/* Suspend materialized view */
alter materialized view v1 suspend;

insert into test_table2 (product, id) values ('Desk lamp',5);

select * from test_table2;
select * from v1;

/* resume materialized view */ 
alter materialized view v1 resume;

