The data object envelope includes a set of core fields that are always available.  This ensures interoperability between data objects.

| Field        | Description           |
| ------------- |:-------------|
| "_id": "" | Globally unique identifier.  Also referred to as the set id |
| "title": "" | Title for DO instance |
| "summary": "" | Summary of SDO data instance |
| "created": "" | Date created |
| "updated": "" | Date updated |
| "author": {"userId": "", "name": ""}, | Name and unique identifier for user that created the DO instance |
| "contributors": [{"userId": "", "name": ""}], | Name and unique identifier for user that last updated the DO data instance.  Names of users that updated it before this person are retained in the sequences |
| "category": {"term": "", "label": "" | Name for the DO definition type |
| "profileId": "" | The UUID of the profile in which the DO instance is saved |
| "communityId": "" | The UUID of the community in which the DO instance is saved |
| "applicationId": "" | The UUID of the app in which the DO instance is saved |
| "indicatorId": "" | The UUID of the data object instance |
| "setId": "" | The set ID of the DO |
| "attachments": "" | Links to attached files |
| "links": "" | Links to other DOs |
| "tags": "" | Tags |
| "gps": "" | GPS coordinates |
| "version": "" | The DO version |
| "status": "" | The DO may have a status of active or inactive |
| "processes": [{ "id": "", "status": "" | The DO data instance may form part of a workflow.  This field designates the workflow ID and status |