[back](https://github.com/kwantu/platformconfiguration/wiki/Support-and-Maintenance-Services-and-Procedures)
## Rest service to update the title of an SDO

_**Note that currently this still requires the path to be inserted into the service. Dynamic path specification will come later**_

```http
https://<hostname>/exist/rest/db/kwantu-resource/_tools/fixSDOtitle.xql?communityId=<communityId>&setId=<setId>&setTitle=<setTitle>&indicatorUUID=<indicatorUUID>$replaceCurrent=<replaceCurrent>&pendingApproved=<pendingApproved>

where:
<hostname> is the server that existdb is running on for the staging: eg. kwantu9data.kwantu.net for staging
<communityId> is the uuid of the community to be migrated.
<setId> is the indicator set ID. Only use for ChristianAidprogrammes/TACBranchMembers/outcomeChristianAid
<setTitle> is the new indicator title. (do not specify setId if setTitle is used)
<indicatorUUID> is the UUID of the SDO whose title it to be updated
<replaceCurrent> is the boolean flag to confirm that if there is some existing value in the title it should be replaced. (Default if the parameter is not specified is 'false'.)
<pendingApproved> indicates if the data must be read from the pending or the approved model. (Default if the parameter is not specified is approved.)


for example:
https://kwantu.me/exist/rest/db/kwantu-resource/_tools/fixSDOtitle.xql?communityId=3af49348-f52f-487c-9666-78a65bd16a96&setId=&setTitle=NewTitle&indicatorUUID=outcomeChristianAid-d3ddb1f7-4a75-4886-854f-c9b63064c8a1
&replaceCurrent=true&pendingApproved=pending
```

