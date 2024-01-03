use role sysadmin;
use database films_db;
use schema films_schema;

/* View films.csv file content*/
select $1, $2, $3 from @films_stage/films.csv (file_format=>'CSV_FILE_FORMAT');

create table films (
id string,
title string,
release_date date
);

select * from films;

-- error
copy into films from @films_stage/films.csv;

copy into films from @films_stage/films.csv
file_format = (type='csv' skip_header=1);

/*
Load transformations

copy into my_table from (
    select
      to_double(t.$1)
    , t.$2
    , t.$3
    , to_timestamp(t.$4)
    from @my_int_stage t);
*/

/* Validation mode
- RETURN_N_ROWS
- RETURN_ERRORS
- RETURN_ALL_ERRORS

COPY INTO MY_TABLE
FROM @MY_INT_STAGE;
VALIDATION_MODE = 'RETURN_ERRORS';
*/
select * from table(validate(films));
-- Load history (last 14 days)
select * from films_db.information_schema.load_history;

