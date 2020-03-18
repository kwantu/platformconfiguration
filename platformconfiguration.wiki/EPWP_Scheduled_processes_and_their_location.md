[back](https://github.com/kwantu/platformconfiguration/wiki/EPWP_Setup)
# Summary of all the scheduled processes, what they are doing and where they are running

There are two servers from which scheduled processes are running

## Version 1 Couchbase server

### [Collector to process participants](https://github.com/kwantu/platformconfiguration/wiki/EPWP_Scheduled_processes_Collector_to_process_participants)
``` bash
#collector to process participants
#* * * * *  /usr/local/bin/lockrun.sh -m 60 --  /Script/epwp3/participant.sh >/dev/null 2>&1
* * * * * /Script/epwp3/participant.sh >/dev/null 2>&1
* * * * * /Script/epwp3/participantError.sh >/dev/null 2>&1
* * * * * /Script/epwp3/kwantu_whk_scheduler.sh >/dev/null 2>&1
#* * * * * /Script/epwp3/participant_verify.sh >/dev/null 2>&1
```
### [Migration scheduler for EPWP3 V1 reporting](https://github.com/kwantu/platformconfiguration/wiki/EPWP_Scheduled_processes_Migration_scheduler_for_EPWP3_V1_reporting)
``` bash
#from kwantu4
#migration scheduler for EPWP3 reporting
* * * * *  /Script/kwantu4/epwp3mProjects.sh >/dev/null 2>&1
* * * * *  /Script/kwantu4/epwp3pProjects.sh >/dev/null 2>&1
* * * * *  /Script/kwantu4/epwp3nProjects.sh >/dev/null 2>&1
* * * * *  /Script/kwantu4/epwp3pParticipants.sh >/dev/null 2>&1
0 18 * * * /Script/kwantu4/epwp3_flag_allprojects.sh >/dev/null 2>&1
0 * * * *  /Script/kwantu4/epwp3Companies.sh >/dev/null 2>&1
```
### [Process the home affairs background service](https://github.com/kwantu/platformconfiguration/wiki/EPWP_Scheduled_processes_Process_the_home_affairs_background_service)
``` bash
#process the home affairs background service
#moved to V2 oracle server#** * * * *  /Script/kwantu4/epwp3HomeAffairs.sh >/dev/null 2>&1
* * * * *  /Script/kwantu4/epwp3HomeAffairsPending.sh >/dev/null 2>&1
* * * * *  /Script/kwantu4/testAdHocParticipant.sh >/dev/null 2>&1
```

## Version 2 Oracle server

```bash
#clear out the temporary xml files
0 * * * * /Script/clearXMLdataDir.sh  > /dev/null 2>&1

#process the global database changes feed
*/5 * * * * /Script/toOracle/runAllDBprocess.sh > /dev/null 2>&1

#run the etl migrations to oracle and elasticSearch
* * * * * /Script/toOracle/runOracleMigration00.sh > /dev/null 2>&1
* * * * * /Script/toOracle/runOracleMigration01.sh > /dev/null 2>&1
* * * * * /Script/toOracle/runOracleMigration02.sh > /dev/null 2>&1
* * * * * /Script/toOracle/runOracleMigration03.sh > /dev/null 2>&1
* * * * * /Script/toOracle/runOracleMigration04.sh > /dev/null 2>&1
* * * * * /Script/toOracle/runOracleMigration05.sh > /dev/null 2>&1
* * * * * /Script/toOracle/runOracleMigration06.sh > /dev/null 2>&1
* * * * * /Script/toOracle/runOracleMigration07.sh > /dev/null 2>&1
* * * * * /Script/toOracle/runOracleMigration08.sh > /dev/null 2>&1
* * * * * /Script/toOracle/runOracleMigration09.sh > /dev/null 2>&1

#run script to validate participant data
* * * * * /Script/participant/runParticipantVerification.sh  > /dev/null 2>&1
```
### [Home affairs re-verification on oracle](https://github.com/kwantu/platformconfiguration/wiki/EPWP_Scheduled_processes_Home_affairs_re-verification_oracle)
``` bash
#run the home affairs re-migration tests on oracle
* * * * * /Script/homeaffairs/epwpHomeAffairs.sh > /dev/null 2>&1

```