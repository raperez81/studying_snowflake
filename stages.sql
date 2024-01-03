/*
STAGES
User Stage
ls @~;

Table Stage
ls@%my_table;

Named Stage
ls @my_stage;


PUT
MacOS / Linux
put file:///folder/my_data.csv @my_int_stage;
put file:///folder/my_data.csv @˜;
put file:///folder/my_data.csv @%my_table;

Windows
put file://c:\\folder\\my_data.csv @my_int_stage;
*/

/*
Internal Stages
list contents of user stage (contains worksheet data)
*/

ls @~;
list @~;

/* list contents of table stage */
ls @%films_sysadmin;
ls @%test_table3;

/* Create internal named stage*/
create stage films_stage;

ls @films_stage;

show tables;
