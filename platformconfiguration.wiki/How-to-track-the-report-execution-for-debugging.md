Created by Willem van der Westhuizen, last modified on Apr 22, 2018. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+track+the+report+execution+for+debugging) on 2018-12-13.

The report execution generates a set of intermediate files that can be used to debug a specific report. The key requirement is to find the correct report SDO to work from. Here are the steps to follow.

### (1) Find the `profileId` of the report that has been created, when configuring the report.
This is a basic first step to find the data you need to debug the report.  To start you need the URL for the report profile. You get this by clicking on the report profile, and go to the url. It is shaded yellow in the example below.

![Kwantu SDO report screenshot](https://github.com/kwantu/platformconfiguration/blob/master/How%20to%20track%20the%20report%20execution%20for%20debugging%201.png)

### (2) Use the `profileId` object, to find the UUID of the  of the report that has been created, when configuring the report.

```
http://<hostname><port>/kwantu_apps_<communityId>/<profileId>
```
where:
* `<hostname>` is kwantu.support / kwantu.me / kwantu.biz / kwantu.org depending on the server you are working on
* `<port>` is :6984 but in most cases it is opptional, because nginx will redirect
* `<communityId>` is the communityId for the community you are working in
* `<profileId>` is the profileId for the report
``` 
http://kwantu.me:6984/kwantu_apps_051a4973-d2fa-475d-ef66-e80b27c576f0/175cd946-4153-49dd-8804-b84809d122f7
```

Please note that you will need a login Id to access the couchdb database on the server you are looking into.
This returns the `appProfile` SDO for the report profile. Use the links section to find the report configuration SDO that was created.

In that document, find the UUID of the SDOreport: "uuid". In the example above it is:

`SDOReportCreation-93592dbe-0078-4444-d8dc-08a91747bb02`

This is the ID for the DO used to create the report and is the key file you need to investigate other areas.

### (3). Checking the report definition
If you want to check the Report definition, use the following URL:
```
https://<hostname><port>/kwantu_apps_<communityId>/<UUID of the report creation SDO>
```
where 
* `<hostname>` is kwantu.support / kwantu.me / kwantu.biz / kwantu.org depending on the server you are working on
* `<port>` is :6984 but in most cases it is opptional, because nginx will redirect
* `<communityId>` is the communityId for the community you are working in
* `<UUID of the report creation SDO>` is the UUID for the report creation `SDO: SDOReportCreation-93592dbe-0078-4444-d8dc-08a91747bb02`

```
https://kwantu.me:6984/kwantu_apps_051a4973-d2fa-475d-ef66-e80b27c576f0/SDOReportCreation-93592dbe-0078-4444-d8dc-08a91747bb0
```
This confirms how the report was defined and allows you to see if any mistakes were made.

### (4). Checking the report configuration
When submitted, the webhook generates a `reportConfig` file that can be accessed with the following URL
```
https://<hostname><port>/kwantu_configs/<UUID of the report creation SDO>
```
where:
* `<hostname>` is kwantu.support / kwantu.me / kwantu.biz / kwantu.org depending on the server you are working on
* `<port>` is :6984 but in most cases it is opptional, because nginx will redirect
* `<UUID of the report creation SDO>` is the UUID for the report creation SDO: SDOReportCreation-93592dbe-0078-4444-d8dc-08a91747bb02
```
https://kwantu.me:6984/kwantu_configs/SDOReportCreation-93592dbe-0078-4444-d8dc-08a91747bb0
```
This is the file that will be executed, when the report runs.  It is useful to see the structure of the report config.
This shows you how different views were joined and is useful to see if any mistakes were made.  It shows more information than the report definition.

### (5). Check to see if the report contains data. This allows you to view the cached reports.
Click on the Datasource url in the report definition workflow. (See the image above). This will execute the data source query in a new browser window.

If the report has data, it will be returned with this URL.

### (6). Finding the intermediate files to track and debug the report
When the report executes, it saves some intermediate files in the following location:
```
https://<host>/exist/rest/db/cache
https://kantu.me/exist/rest/db/cache
```
Edit this link to put the view ID after it

To find those files, the UUID of the `SDOreport` configuration file must be used. Here is a screen shot of these files for the current report:


![SDOreport configuration file screen shot for the current report](https://github.com/kwantu/platformconfiguration/blob/master/SDOreport%20configuration%20file%20screen%20shot%20for%20the%20current%20report.png)


The file SDOreport-a5f8ad32-d62d-46b5-bc09-121743fdbe1f.json contains the final result set that will be fed into the report. In this example, it is empty, so there was an error. The actual result is shown below.
```javascript
{
  "result" : {
    "docs" : [ ]
  }
}
```

Note the `"result"."docs" : [ ]` array is empty, meaning that no records were returned.

To delve deeper, we can identify the Views that contribute to this query. There are two primary views,and two union views in this case.

The result set of each of those can be seen in the relevant files.

### Primary View 1
The first view from the image above is the file below.

`SDOreport-a5f8ad32-d62d-46b5-bc09-121743fdbe1f-ViewConfig-7e38353b-9b15-4567-93c5-92a16f99464a-1.json`

If you open it, you can see the data results returned. Here is a small screenshot thereof. The first part is the actual query that runs against the Couchdb database. Then the results section contains the results. They can be inspected here.

![actual query that runs against the Couchdb database](https://github.com/kwantu/platformconfiguration/blob/master/actual%20query%20that%20runs%20against%20the%20Couchdb%20database.png)

### Primary View 2
 `SDOreport-a5f8ad32-d62d-46b5-bc09-121743fdbe1f-ViewConfig-b916d9e0-9efd-475f-c543-472368fd40ae-1.json`
The second primary view causes the error in this case. The full result is returned below as follows:
```javascript
{
  "query" : {
    "fields" : [ "_id", "title", "meta-data", "model.approved.seq", "model.approved.status", "model.approved.data.project.projectName", "model.approved.data.project.officialResponsible.label", "model.approved.data.project.startDate", "model.approved.data.project.expectedCompletionDateDate" ],
    "limit" : 5000,
    "selector" : {
      "meta-data.communityId" : "b3a29735-5ced-48d3-b9f3-c6b2f38d0e6c",
      "model.approved.seq" : {
        "$gt" : 0
      },
      "meta-data.applicationId" : "a07dc803-e64c-4e9f-d2fd-7ba1d39ec756",
      "category.term" : "project"
    }
  },
  "result" : {
    "docs" : [ ]
  }
}
```

In this case, the problem was an incorrect `"category.term" : "project"` in the primary view.

View the intermediate union view results
This can be seen in the following files:
```
SDOreport-a5f8ad32-d62d-46b5-bc09-121743fdbe1fViewConfig-7e38353b-9b15-4567-93c5-92a16f99464a-union.json

SDOreport-a5f8ad32-d62d-46b5-bc09-121743fdbe1fViewConfig-b916d9e0-9efd-475f-c543-472368fd40ae-union.json
```






