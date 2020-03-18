[back to EPWP page ...](https://github.com/kwantu/platformconfiguration/wiki/EPWP_Setup)

## Starting and stopping the database service
1. Log in as sys user and start sqlplus. Go to the server as root, and sudo su oracle. In the oracle user home directory there is a `startSQLplus.sh` script that will initate the process.

```bash
export ORACLE_HOME=/u01/app/oracle/product/11.2.0/dbhome_1
export PATH=${PATH}:${ORACLE_HOME}/bin
export ORACLE_SID=orcl
sqlplus / as sysdba
```
* To find the oracle home directory
```
ps -ef | grep ORACLE_HOME
/u01/app/oracle/product/11.2.0/dbhome_1 
``` 
* To check if the ORACLE_SID is set
echo ${ORACLE_SID}

* To Change to the oracle user
sudo su oracle

* To Start SQLplus
```bash
./start.sh
```

## Check and start the listener
```bash
find . -name lsnrctl
/u01/app/oracle/product/11.2.0/dbhome_1/bin/lsnrctl
# add to the path
export PATH=$PATH:/u01/app/oracle/product/11.2.0/dbhome_1/bin
# find the status
lsnrctl status

LSNRCTL for Linux: Version 11.2.0.1.0 - Production on 12-MAY-2019 20:31:51

Copyright (c) 1991, 2009, Oracle.  All rights reserved.

Connecting to (DESCRIPTION=(ADDRESS=(PROTOCOL=IPC)(KEY=EXTPROC1521)))
STATUS of the LISTENER
------------------------
Alias                     LISTENER
Version                   TNSLSNR for Linux: Version 11.2.0.1.0 - Production
Start Date                08-MAY-2019 03:23:06
Uptime                    4 days 17 hr. 8 min. 45 sec
Trace Level               off
Security                  ON: Local OS Authentication
SNMP                      OFF
Listener Parameter File   /u01/app/oracle/product/11.2.0/dbhome_1/network/admin/listener.ora
Listener Log File         /u01/app/oracle/diag/tnslsnr/dpwepwporacle01/listener/alert/log.xml
Listening Endpoints Summary...
  (DESCRIPTION=(ADDRESS=(PROTOCOL=ipc)(KEY=EXTPROC1521)))
  (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=10.155.78.99)(PORT=1521)))
The listener supports no services
The command completed successfully

# Start the listener
lsnrctl start
```
## Shut oracle down
```bash
shutdown immediate;
# OR
shutdown abort;
```

## Start the Oracle database
1. In Archivelog mode <br>
Start the SQLplus
```bash
./start.sh

SQL> startup mount
# ORACLE instance started.
SQL> alter database archivelog;
# Database altered.
SQL> alter database noarchivelog;

SQL> alter database open;
Database altered.
```

## Now create the databases and user accounts
1. EPWP3 - The database and user (epwp3) that deals with the collector and assembling data
2. EPWP_RWH - The database and user (epwp_rwh) that deals with the reporting warehouse aspects
3. [EPWP4](https://github.com/kwantu/platformconfiguration/wiki/Oracle_Scripts_epwp4) - The database and user (epwp4) that will deal with the new collector data for Version2

## Create the virtual directory so that it can load the xml files.
1. First make sure that the directory is on the server
```bash
mkdir /usr/local/data/xmldata
chown oracle /usr/local/data/xmldata
```
2. Then register the directory in oracle
```sql
CREATE OR REPLACE DIRECTORY XMLSRCCLOBDIR AS '/usr/local/data/xmldata';
GRANT ALL ON DIRECTORY XMLSRCCLOBDIR TO epwp3;
COMMIT;
```