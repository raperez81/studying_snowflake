/*
Casting Semi-structured Data

SELECT src:employee.name, src:joined_on, src: employee.age, src:is_manager, src:base_location FROM EMPLOYEE;

SRC:EMPLOYEE.NAME   | SRC:JOINED_ON | SRC:EMPLOYEE.AGE  | SRC:IS MANAGER | SRC:BASE LOCATION
"Aiko Tanaka"       | "2019-01-01"  | 42                | true           | null

Double colon
SELECT src: employee.joined_on::DATE
FROM EMPLOYEE;

SRC:JOINED_ON::DATE
2019-01-01

TO_<datatype>()
SELECT TO_DATE(src: employee.joined_on)
FROM EMPLOYEE;

TO_DATE(SRC:JOINED_ON)
2019-01-01

AS_<datatype>()
SELECT AS_VARCHAR(src: employee.name)
FROM EMPLOYEE;

AS_VARCHAR(SRC:EMPLOYEE.NAME)
Aiko Tanaka
*/
