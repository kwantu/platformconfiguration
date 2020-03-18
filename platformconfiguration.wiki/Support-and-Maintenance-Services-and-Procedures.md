## Setting up, removing and managing communities


| Number | Service | Description |
|------- |----------------------|--------------------------------------|
| 1 | [Delete a community](https://github.com/kwantu/platformconfiguration/wiki/existdb-service-delete-a-community) | This service allows the system administrator to specify communities to be deleted, and then deletes all the MySQL records and Couchdb databases related to that community.|
| 2 | [Migrate a new community to production](https://github.com/kwantu/platformconfiguration/wiki/Publishing-a-new-community-to-the-production-server) | This page specifies the steps needed to migrate a new community to the production server|
| 3 | [Create the indexes for the community on the couchdb server](https://github.com/kwantu/platformconfiguration/wiki/Service-to-create-indexes-for-a-community-in-couchdb)|Creates or deletes indexes for a community or all communities on a server|
| 4 | [Publish the configuration for a community to a production server from the staging server](https://github.com/kwantu/platformconfiguration/wiki/Service-to-publish-configuration-for-a-community-to-the-production-server)|This is the build process to publish the full configuration for all applications from the staging server to a production server|
| 5 | [Service to move process from one to another sub-profile instance](https://github.com/kwantu/platformconfiguration/wiki/Service-to-move-instance-to-new-subprofile-category) | This service allows to move a sub-process to a new sub-profile category.|
| 6 | [Service to move process from sub-profile instance to root level](https://github.com/kwantu/platformconfiguration/wiki/Service-to-move-instance-from-subprofile-to-root) | This service allows to move a sub-process to the root of a profile from a sub-profile category.|
| 7 | [Service to update the title of an SDO so that the search can pick it up](https://github.com/kwantu/platformconfiguration/wiki/Service-to-update-the-title-of-a-profile) | This service allows to update the title of an SDO.|

## Workflow API Services to run work flows and manage data registry

| Number | Service | Description |
|------- |----------------------|--------------------------------------|
| 1 | [Workflow to create a community](https://github.com/kwantu/platformconfiguration/wiki/existdb-service-workflow-to-create-a-community) | This service allows the system administrator to execute a work flow that will create a community.|
| 2 | [Workflow to create a profile in a community](https://github.com/kwantu/platformconfiguration/wiki/existdb-service-workflow-to-create-a-profile) | This service allows the system administrator to execute a work flow that will create a profile including populating data objects.|
| 3 | [Workflow to create a process in a profile](https://github.com/kwantu/platformconfiguration/wiki/existdb-service-workflow-to-create-a-process-within-a-profile) | This service allows the system administrator to execute a work flow that will create a create a workflow process including populating data objects.|
| 4 | [Workflow to adopt an application into a community](https://github.com/kwantu/platformconfiguration/wiki/existdb-service-workflow-to-adopt-an-application) | This service allows the system administrator to execute a work flow that will adopt an application into a community.|
| 5 | [Workflow to create a sub-profile instance for a profile](https://github.com/kwantu/platformconfiguration/wiki/Service-to-publish-configuration-for-a-community-to-the-production-server) | This service allows the system administrator to execute a work flow that will create a community.|

## Report related services to manage reports and views

| Number | Service | Description |
|------- |----------------------|--------------------------------------|
| 1 | [Clear the views](https://github.com/kwantu/platformconfiguration/wiki/reports-procedure-to-remove-all-autocreated-views) | This service allows the to remove all the autocreated views so that duplicates can be cleared.|

## Managing Couchdb
### Set the revision limits for a document
```bash
curl --noproxy "*" -u Administrator:@@@@@@@ http://10.155.78.79:8003/kwantu_configs/_revs_limit
curl --noproxy "*" -u Administrator:@@@@@@@ -X PUT -d "10" http://10.155.78.79:8003/kwantu_configs/_revs_limit
```

## Managing Redis and transactions
### Making sure that redis is runnig and transactions are active on the server
```http
https://kwantu.support/redis/test
```

### clearing out all old transactions data
To clear redis older data... please do following
```bash
sudo su -
redis-cli
flushall
```
then delete all the documents in kwantu_transactions couchdb except any design document




