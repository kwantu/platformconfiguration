[back to Oracle page...](https://github.com/kwantu/platformconfiguration/wiki/Oracle_Scripts_Utilities)
# EPWP4 Setup
This database contains the new improved tools for epwp4 and the version 2 setup
## Create the tablespace

```sql
-- This is where the source and the collector db stuff will be located
CREATE TABLESPACE EPWP4 
DATAFILE '/usr/local/data/oracle/epwp4/epwp4_01.dbf'
SIZE 1G
AUTOEXTEND ON
LOGGING ONLINE PERMANENT EXTENT MANAGEMENT LOCAL AUTOALLOCATE FLASHBACK ON ;

CREATE USER EPWP4 IDENTIFIED BY EPWP4 
DEFAULT TABLESPACE EPWP4 TEMPORARY TABLESPACE TEMP ACCOUNT UNLOCK ;

-- EPWP4 IS THE SYSDBA USER THAT WE WILL USE TO MANAGE THE METADATA
GRANT RESOURCE,Connect TO EPWP4 ;
GRANT CREATE MATERIALIZED VIEW, UNLIMITED TABLESPACE, CREATE VIEW, CREATE SYNONYM, CREATE SESSION TO EPWP4 ;
GRANT DBA to EPWP4;
```
