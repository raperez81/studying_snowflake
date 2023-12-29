/* clustering metadata */

use role sysadmin;
use database snowflake_sample_data;
use schema tpcds_sf100tcl;

/* Check cluster_by column to determine if a table has a cluster key(s) */
show tables;
/*
output:
name            cluster_by
call_center     linear( cc_call_center_sk )

*/

/* select system$clustering_information('table','(col1,col3)') */ 
/* identify if current micro partitions are well distributed by the cluster keys*/ 
select system$clustering_information('catalog_sales');
/* output:
{
  "cluster_by_keys": "LINEAR(  cs_sold_date_sk, cs_item_sk  )",
  "total_partition_count": 587268,
  "total_constant_partition_count": 11,
  "average_overlaps": 3.5188,
  "average_depth": 2.7695,
  "partition_depth_histogram": {
    "00000": 0,
    "00001": 8,
    "00002": 135337,
    "00003": 451923,
    "00004": 0,
    "00005": 0,
    "00006": 0,
    "00007": 0,
    "00008": 0,
    "00009": 0,
    "00010": 0,
    "00011": 0,
    "00012": 0,
    "00013": 0,
    "00014": 0,
    "00015": 0,
    "00016": 0
  },
  "clustering_errors": []
}
*/

/* evaluate if the cs_list_price column can be a good candidate to repartition the tabla catalog_sales */
select system$clustering_information('catalog_sales','(cs_list_price)');
/*
output:
{
  "cluster_by_keys": "LINEAR(cs_list_price)",
  "total_partition_count": 587268,
  "total_constant_partition_count": 0,
  "average_overlaps": 587267,
  "average_depth": 587268,
  "partition_depth_histogram": {
    "1048576": 587268,
    "00000": 0,
    "00001": 0,
    "00002": 0,
    "00003": 0,
    "00004": 0,
    "00005": 0,
    "00006": 0,
    "00007": 0,
    "00008": 0,
    "00009": 0,
    "00010": 0,
    "00011": 0,
    "00012": 0,
    "00013": 0,
    "00014": 0,
    "00015": 0,
    "00016": 0
  },
  "clustering_errors": []
}
*/

show tables;

select "name", "database_name", "schema_name", "cluster_by" from table(result_scan(last_query_id()));

/* 
Applying a clustering key 
alter table t1 cluster by (c1, c3); 
alter table t2 cluster by (substring (c2,2,10), month(c1)); 
*/
create table t1(c1 date, c2 string, c3 number)
cluster by (c1, c2);

select * from testdb.public.test_table3;
alter table testdb.public.test_table3 cluster by (id);

