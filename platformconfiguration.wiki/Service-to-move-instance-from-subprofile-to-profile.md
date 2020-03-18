[back](https://github.com/kwantu/platformconfiguration/wiki/Support-and-Maintenance-Services-and-Procedures)
## Rest service to move instance to from subprofile to profile

```http
https://<hostname>/exist/rest/db/kwantu-resource/_tools/move_process_from_subprofile_to_root.xq?applicationId=<applicationId>&communityId=<communityId>&profileId=<profileId>&indicatorUUID=<indicatorUUID>

where:
<hostname> is the server that existdb is running on for the staging: eg. kwantu9data.kwantu.net for staging
<communityId> is the uuid of the community to be migrated.
<applicationId> is the application Id
<profileId> (proileId , adoptionId in case of apex profiles)
<indicatorUUID> is the UUID of the defining indicator of the subprofile to be moved

for example:
https://kwantu.support/exist/rest/db/kwantu-resource/_tools/move_process_from_subprofile_to_root.xq?applicationId=407b6ee2-c682-41e0-a165-e7d9bc566a31&communityId=75b6528e-f7de-4f84-ab22-8428a20e28a1&profileId=ef8fc5c9-c307-4001-aff6-7d586f9fce62&indicatorUUID=field-098135ec-cc61-4af0-b370-df960066943e
```

