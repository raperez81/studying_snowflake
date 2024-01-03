/* File Formats */

/* Set on a named stage */
create stage my_stage
file_format = (type = 'csv' skip_header = 1);

/* Explicitly declared file format (independent object) */
create file format my_csv_ff
type = 'csv'
skip_header = 1)
*/
