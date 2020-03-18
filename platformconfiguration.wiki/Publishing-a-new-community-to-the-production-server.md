We recommend that you always create new communities on your staging server.  This enables you to complete adoption of apps and other set up tasks without affecting your users.  Once you are ready to publish your community to your production server, follow these steps:

1. Create mysql entry in "communities" table.
```sql
INSERT INTO `community` (
`communityId`, 
`communityName`, 
`description`, 
`accessType`, 
`replicate`, 
`rcordSeq`, 
`webhookSeq`, 
`communityCode`) 
VALUES (
'b9341c47-ce52-4c62-8701-d5a0c7f2ecd4',
'IGC Partner A',
'IGC Partner A',
'1',
'1',
NULL,
NULL,
'829');
```
2. Create entry in "user_roles_map" table for the new community to give access to Kwantu Administrator (user id 38)
```sql
INSERT INTO `user_roles_map` (
`userId`, 
`communityId`, 
`roleId`, 
`status`) 
VALUES(
'38',
'b9341c47-ce52-4c62-8701-d5a0c7f2ecd4',
'1',
'approved');
```
3. Update user_table for user 38 and set buildAccess = 0 (This helps to give correct permissions on the database when user logins first time)
```sql
UPDATE user_ set buildAccess = 0 where userid = 38;
```
4. Create the indexes for the community on the couchdb server. [Run the create index service by passing parameter    communityId=<NEW_COM_ID>](https://github.com/kwantu/platformconfiguration/wiki/Service-to-create-indexes-for-a-community-in-couchdb)
5. Run publishCommunity to push configuration to production server from the staging server containing the initial configuration. [See here for technical details](https://github.com/kwantu/platformconfiguration/wiki/Service-to-publish-configuration-for-a-community-to-the-production-server)