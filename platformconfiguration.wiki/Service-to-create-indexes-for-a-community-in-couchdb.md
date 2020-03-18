## Create indexes for a community in couchdb <br>

This service creates all the indexes needed for a community, or recreates them. <br>
Note that you can pass the value of **'all'** for the communityId. In this case it will create indexes for all the communities on the server. <br>

```http
https://<hostname>/exist/rest/db/kwantu-resource/api/rest/createIndex?communityId=<communityId>&delete=<deleteOrcreate>

where:
<hostname> is the server that existdb is running on for the particular installation: eg. kwantu.me for production
<communityId> is the uuid of the community for which indexes are to be created, or 'all' for all communities on the server. It defaults to all if the communityId parameter is omitted.
<deleteOrcreate> is true if you only want to delete communities, or false if you want to create indexes. It defaults to false if the delete parameter is omitted.

for example:
https://kwantu.me/exist/rest/db/kwantu-resource/api/rest/createIndex?communityId=10000&delete=false
```