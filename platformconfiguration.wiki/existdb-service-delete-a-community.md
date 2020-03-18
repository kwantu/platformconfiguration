## eXistdb Service: Delete a Community

_**This service allows the central system administrator to delete one or more communities. Note that this is not reversible. If there are not adequate backups before the procedure is run, and there is a mistake data will be lost!**_<br>
### Steps to execute the service:<br>

**Step 1.** Flag the community as deletable.<br>
The first step is to set the community as deletable in the mySQL **`mobile1_8.community`** table. Do this with the following query to prepare the community with id '51000' for deletion. If this has not been set, then the service will not delete the community.
```sql
UPDATE mobile1_8.community SET accesstype = 'delete' WHERE communityId = '51000';
```

**Step 2.** Run te service as a rest service.<br>
Run the service with the correct communityId parameter passed.<br>
```http
https://<hostname>/exist/rest/db/kwantu-resource/rest-services/removeCommunityFromV18.xql?communityId=<communityId>
where:
<hostname> is the server that existdb is running on for the particular installation: eg. kwantu.support
<communityId> is the uuid of the community to be deleted.
for example:
https://kwantu.support/exist/rest/db/kwantu-resource/rest-services/removeCommunityFromV18.xql?communityId=10000
```
The results of the service that ran correctly are as follows:
```xml
<result community="10000">
    <mySQL>
        <table name="user_roles_map">
            <data isError="false" errorCode="200" errorMessage="OK" count="0"/>
        </table>
        <table name="uniqueindicatorapproved">
            <data isError="false" errorCode="200" errorMessage="OK" count="0"/>
        </table>
        <table name="uniqueindicator">
            <data isError="false" errorCode="200" errorMessage="OK" count="0"/>
        </table>
        <table name="notification">
            <data isError="false" errorCode="200" errorMessage="OK" count="0"/>
        </table>
        <table name="follow">
            <data isError="false" errorCode="200" errorMessage="OK" count="0"/>
        </table>
        <table name="feedprocessor">
            <data isError="false" errorCode="200" errorMessage="OK" count="0"/>
        </table>
        <table name="community">
            <data isError="false" errorCode="200" errorMessage="OK" count="1"/>
        </table>
    </mySQL>
    <couchDB>
        <database name="kwantu_apps__10000">
            <status isError="false" errorCode="OK" message="Rest service called successfully">{"ok":true} </status>
        </database>
        <database name="kwantu_notifications__10000">
            <status isError="false" errorCode="OK" message="Rest service called successfully">{"ok":true} </status>
        </database>
        <database name="kwantu_attachments__10000">
            <status isError="false" errorCode="OK" message="Rest service called successfully">{"ok":true} </status>
        </database>
    </couchDB>
</result>
```
