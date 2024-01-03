/* 
Data Unloading

Copy into
table -> stage
*/
copy into @my_stage
from my_table;

/* Output files can be prefixed by specifying a string at the end of a stage path.*/
copy into @my_stage/result/data_
from (select * from T1)
file_format = my_csv_file_format;

/* COPY INTO <location> includes a PARTITION BY copy option to partition unloaded data into a directory structure.*/
copy into @%t1
from t1
partition by ('date=' || to_varchar(dt))
file_format = my_csv_file_format;

/* COPY INTO <Location> can copy table records directly to external cloud provider's blob storage. */
copy into 's3://mybucket/unloadD/'
from t1
storage integration = my_int
file_format = my_csv_file_format;

/* GET 
GET is the reverse of PUT
*/
get @my_stage file:///tmp/data/;
