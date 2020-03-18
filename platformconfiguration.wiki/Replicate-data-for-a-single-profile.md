[back...](https://github.com/kwantu/platformconfiguration/wiki/Platform-support-and-maintenance-tools)
# Replicate data for a single profile
If we want to select only the data from a single profile to be replicated, we can use this rest function to get a full list of document ids that should be replicated.
```rest
<hostname>/exist/rest/db/kwantu-resource/api/rest/getProfileManifest.xq?communityId=<communityId>&profileId=<profileId>&mode=full

<hostname> is the host name of the exist server with the port if necessary
<communityId> is the uuid of the community in which the current profile to replicate is
<profileid> is the uuid of the profile that needs to be replicated
.....
Example
.....
https://kwantu.support/exist/rest/db/kwantu-resource/api/rest/getProfileManifest.xq?communityId=051a4973-d2fa-475d-ef66-e80b27c576f0&profileId=4412126e-a685-434c-89a6-284b836dd9e8&mode=full

```