/* Snowpipe */
create pipe my_pipe
auto_ingest = true
as
copy into my_table
from @my_stage
file_format = (type = 'csv');
