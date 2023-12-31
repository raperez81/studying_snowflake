USE ROLE SYSADMIN;
USE DATABASE testdb;

CREATE OR REPLACE TABLE test_table(Product varchar(100), id numeric, price numeric);

INSERT INTO test_table (Product, id, price) VALUES ('Mouse', 1, 30);
INSERT INTO test_table (Product, id, price) VALUES ('Keyboard', 2, 50);
INSERT INTO test_table (Product, id, price) VALUES ('Monitor', 3, 300);


SELECT * FROM testdb.public.test_table;

GRANT SELECT ON TEST_TABLE TO PUBLIC;

CREATE OR REPLACE MASKING POLICY PRODUCT_MASKING AS (VAL STRING) RETURNS STRING ->
    CASE
        WHEN CURRENT_ROLE() IN ('SYSADMIN') THEN VAL
    ELSE '***MASKED***'
        END;

ALTER TABLE TEST_TABLE MODIFY COLUMN PRODUCT SET MASKING POLICY PRODUCT_MASKING;        

USE ROLE PUBLIC;

SELECT * FROM testdb.public.test_table;

ALTER TABLE TEST_TABLE MODIFY COLUMN PRODUCT UNSET MASKING POLICY;    
