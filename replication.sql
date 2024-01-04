/* Replication
Replication is a feature in Snowflake which enables replicating databases between Snowflake accounts
within an organization.

A database is selected to serve as the primary database from which secondary databases
can be created in other accounts:

alter database db_1
enable replication to accounts org1.account2;

When a primary database is replicated a snapshot of it's database objects and data are 
transferred to the secondary database:

create database db_1_replica
as replica of org_1.account1.db_1;
*/
