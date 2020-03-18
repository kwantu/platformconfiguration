[back](https://github.com/kwantu/platformconfiguration/wiki/EPWP_Scheduled_processes_and_their_location)
# Process the home affairs background service

## Process V1 Pending Participants at DHA
This scheduler calls the following service 
```bash
/Script/kwantu4/epwp3HomeAffairsPending.sh
---------------
curl -u admin:admin "http://epwpmun.dpw.gov.za/9080/exist/rest/db/homeAffairs/processHomeAffairsForPending.xq" > /Script/kwantu4/epwp3HomeAffairsPending.log
echo "done"
```
This processes all pending participants waiting for approval on Version 1. This runs on MySQL and is unchanged.

## Process an ad hoc list of participants at DHA in batch
This scheduler calls the following service 
```bash
/Script/kwantu4/testAdHocParticipant.sh
----------------------
curl -u admin:admin "http://epwpmun.dpw.gov.za/9080/exist/rest/db/homeAffairs/testAListOfParticipants.xq" >> /Script/kwantu4/testAdHocParticipant.sh.log
echo "done"
```
For this service a list of id numbers are loaded in the V1 mySQL table `dha`.`testparticipantlist` in the RSA_ID column. The result is saved in the table when it runs.
