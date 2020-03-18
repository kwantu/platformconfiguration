[back](https://github.com/kwantu/platformconfiguration/wiki/EPWP_Scheduled_processes_and_their_location)

## Re-process all participants checks at DHA
This scheduler calls the following service 
```bash
/Script/homeaffairs/epwpHomeAffairs.sh
------------------
curl --noproxy "*" -u admin:admin "http://localhost:8080/exist/rest/db/kwantu-resource/homeAffairs/processHomeAffairs.xq" > /Script/homeaffairs//epwpHomeAffairs.log
echo "done"
```
This service used to run on mySQL, but has been moved to Oracle to deal with all participants, including those from V2.
