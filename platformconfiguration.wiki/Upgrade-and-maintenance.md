

Worker object logs - /exist/rest/db/kwantu-resource/api/webhook/logs.html

Configuration links and URL

1. Delete a profile

Delete a profile using a rest call:

<hostname:port>/exist/rest /db/kwantu-resource/api/rest/deleteProfile.xq?profileId=xxxxxxx&communityId=yyyyyyy

2. Upload community Logo

https://couchp01.kwantu.net/exist/rest/db/test/uploadImage.html

http://kwantu.me:8080/exist/rest/db/test/uploadImage.html

3. Delete a sub process instance

/exist/rest/db/kwantu-resource/api/rest/deleteSubprocess.xq?spuuid=<xxxxxxx>&communityId=<xxxxx>


4. Find the status of a change feed queue
In the  kwantu_configs bucket, find the pointer for the current queue by looking at the following file format: System_Settings_<CCCCCCCC>_<xxxx>
Where CCCCCCCC is the community Id and <xxxx> is the jobid that we are looking for. 
The details for the jobId can be found in the System_Settings document in the kwantu_configs database.

/kwantu_apps_<CCCCCCCC>/_changes?timeout=180000&style=all_docs&filter=_view&view=unique Constraint%2FuniqueConstraint&since=###########&limit=20

    {
      "jobId": "1002",
      "interval": 30000,
      "type": "uniqueConstraint",
      "active": true,
      "limit": 10,
      "bucket": "kwantu_apps"
    },
    {
      "jobId": "1003",
      "interval": 30000,
      "type": "navigation",
      "active": true,
      "limit": 5,
      "bucket": "kwantu_apps"
    },
    {
      "jobId": "1004",
      "interval": 60000,
      "type": "userRole",
      "active": true,
      "limit": 10,
      "bucket": "kwantu_apps"
    },
    {
      "jobId": "1005",
      "interval": 10000,
      "type": "workflowInstanceSubProcess",
      "active": true,
      "limit": 50,
      "bucket": "kwantu_apps"
    },
    {
      "jobId": "1006",
      "interval": 30000,
      "type": "attachmentRequest",
      "active": true,
      "limit": 2,
      "bucket": "kwantu_apps"
    },
    {
      "jobId": "1007",
      "interval": 30000,
      "type": "sendWorker",
      "active": true,
      "limit": 2,
      "bucket": "kwantu_apps"
    },
    {
      "jobId": "1008",
      "interval": 60000,
      "type": "deleteProfile",
      "active": true,
      "limit": 5,
      "bucket": "kwantu_apps"
    },
    {
      "jobId": "1010",
      "interval": 60000,
      "type": "notification",
      "active": true,
      "limit": 10,
      "bucket": "kwantu_apps"
    },
    {
      "jobId": "1011",
      "interval": 30000,
      "type": "sdoReport",
      "active": true,
      "limit": 2,
      "bucket": "kwantu_apps"
    },
    {
      "jobId": "1012",
      "interval": 30000,
      "type": "executeReport",
      "active": true,
      "limit": 2,
      "bucket": "kwantu_apps"
    },
    {
      "jobId": "1018",
      "interval": 30000,
      "type": "notificationWorker",
      "active": true,
      "limit": 10,
      "bucket": "kwantu_notifications"
    }
 


5. Data Registry Services

5.1 Workflow to create a profile

/exist/rest/db/kwantu-resource/importAPICollection/import.xq?TYPE=PROFILE_WORKFLOW


5.2 Workflow to create a process

/exist/rest/db/kwantu-resource/importAPICollection/import.xq?TYPE=PROCESS_WORKFLOW


5.3 Workflow to create a community

/exist/rest/db/kwantu-resource/importAPICollection/import.xq?TYPE=COMMUNITY_WORKFLOW


<apiImport>
    <authentication username="XXX" password="">
        <apiRequest applicationId="1023" communityId="29000" 
            dateTime="2018-03-20T19:41:33.435+02:00" validDate="2018-03-20+02:00"
            processConfigId="profileRegistration" subProcessConfigId="spProfileRegistration">
            <sdos>
                <sdo seq="1" setId="appProfile" title="VP2">
                    <appProfile>
                        <Name>Violetpath3</Name>
                        <refNo>AV</refNo>
                        <description>This is appProfile SDO</description>
                    </appProfile>
                </sdo>
                <sdo seq="2" setId="Community" title="VP2">
                    <Community>
                        <upload>
                            <fileData></fileData>
                            <fileName>logo.png</fileName>
                            <mime>image/png</mime>
                            <uuid>4af3363a-25bc-11e8-b467-0ed5f89f718f</uuid>
                        </upload>
                        <typeOfDepartment>
                            <code>1</code>
                            <label>abc</label>
                        </typeOfDepartment>
                        <communityID></communityID>
                        <MunicipalityName>
                            <code>111</code>
                            <label>234</label>
                        </MunicipalityName>
                        <ContactName>9999</ContactName>
                        <phone>9911692111</phone>
                        <communityName>HCom</communityName>
                        <address>BBK</address>
                        <DefaultLanguage>
                            <code>en</code>
                            <label>English</label>
                        </DefaultLanguage>
                        <DistrictName>
                            <code>bbk</code>
                            <label>BARABANKI</label>
                        </DistrictName>
                        <ProvinceName>
                            <code>LKO</code>
                            <label>LUCKNOW</label>
                        </ProvinceName>
                        <email>hasan.abbas@violetpath.in</email>
                        <description>test bbbk 1 234 6676</description>
                    </Community>
                    <uploads>
                        <upload seq="1">
                            <fileData>...
Insert here the base64encoded string
...
                            </fileData>
                            <fileName>logo.png</fileName>
                            <mime>image/png</mime>
                            <uuid>4af3363a-25bc-11e8-b467-0ed5f89f718f</uuid>
                        </upload>
                    </uploads>
                </sdo>
            </sdos>
        </apiRequest>
    </authentication>
</apiImport>

5.4 Workflow to adopt an application

/exist/rest/db/kwantu-resource/importAPICollection/import.xq?TYPE=ADOPTION_WORKFLOW

<apiImport>
    <authentication username="XXX" password="XXX">
        <apiRequest profileId="07519593-8f49-4a02-ace7-844726e13bf9"
            communityId="29000"
            applicationId="1024"
            dateTime="2018-03-20T19:41:33.435+02:00" validDate="2018-03-20+02:00"
            processConfigId="newInstanceProcess" subProcessConfigId="spnewInstanceProcess">
            <sdos>
                <sdo seq="1" setId="Adoption" title="abc aaa">
                    <Adoption>
                        <applicationID>07519593-8f49-4a02-ace7-844726e13bf9</applicationID>
                        <applicationName>Project tracking</applicationName>
                        <community>
                            <code>71024dcb-58df-4491-adf7-0934e5acf153</code>
                            <label>Avengers</label>
                        </community>
                        <version>
                            <code>1</code>
                            <label>1</label>
                        </version>
                    </Adoption>
                </sdo>
            </sdos>
        </apiRequest>
    </authentication>
</apiImport>


5.5 Workflow to create sub-profile instance

/exist/rest/db/kwantu-resource/importAPICollection/import.xq?TYPE=SUBPROFILE_WORKFLOW

<apiImport>
    <authentication username="XXX" password="XXX">
        <apiRequest communityId="962dd628-36b5-4a41-b959-a6e8827b6a7e" 
            profileId="36df7d56-566b-4137-e44b-a266669835fa" 
            parentProfileId="36df7d56-566b-4137-e44b-a266669835fa" 
            subprofileTitle=""
            subProcessFileUUID="specify a UUID or leave blank"
            applicationId="ea0ffbdb-fd6e-46bf-b691-8b4d57b7f4c3"
            dateTime="2018-03-20T19:41:33.435+02:00" validDate="2018-03-20+02:00"
            processConfigId="localities" subProcessConfigId="spLocalities">
            <sdos>
                <sdo seq="1" setId="EPWPLocality" title="abc aaa">
                    <EPWPLocality>
                        <degreesDecimalMinutesLatitude/>
                        <street>teststreet1</street>
                        <spatialselector>
                            <code>01</code>
                            <label>test</label>
                        </spatialselector>
                        <inputLongitude>35</inputLongitude>
                        <degreesDecimalLongitude>43</degreesDecimalLongitude>
                        <suburb>testsuburb</suburb>
                        <IsDisabled>No</IsDisabled>
                        <subplace>
                            <code>001</code>
                            <label>test</label>
                        </subplace>
                        <degreesMinutesSecondsLongitude>34</degreesMinutesSecondsLongitude>
                        <streetBlock>test</streetBlock>
                        <LocalityNumber>87236472369</LocalityNumber>
                        <SpatialData>test</SpatialData>
                        <address_description>test add</address_description>
                        <degreesMinutesSecondsLatitude>test</degreesMinutesSecondsLatitude>
                        <locationInputSelector>
                            <code>01</code>
                            <label>test</label>
                        </locationInputSelector>
                        <KwantuObjectId>test id</KwantuObjectId>
                        <governmentFacility>
                            <code>02</code>
                            <label>testF</label>
                        </governmentFacility>
                        <degreesDecimalLatitude>343</degreesDecimalLatitude>
                        <inputLatitude>004</inputLatitude>
                        <postalcode>435443</postalcode>
                        <degreesDecimalMinutesLongitude>0091</degreesDecimalMinutesLongitude>
                        <LastUpdateDateTime>908</LastUpdateDateTime>
                        <municipality>
                            <code>001</code>
                            <label>test</label>
                        </municipality>
                        <ward>
                            <code>1</code>
                            <label>Ward1</label>
                        </ward>
                        <locMunicipality>
                            <code>Mun1</code>
                            <label>Mun1</label>
                        </locMunicipality>
                        <LocalityId/>
                        <Title>test title</Title>
                        <locUUID>testlocUUID</locUUID>
                        <description>testdescription</description>
                        <gisDate>test34</gisDate>
                    </EPWPLocality>   
                </sdo>
                <sdo seq="2" setId="EPWPActiveParticipants" title="abc aaa">
                    <EPWPActiveParticipants>
                        <monthlyActiveParticipantsRepeat>
                            <participantsDef>
                                <participants>
                                    <IdNumber>324234</IdNumber>
                                    <profileUUID>sdfwerw3423</profileUUID>
                                    <wageRate>5</wageRate>
                                    <name>testname</name>
                                    <startDate>test</startDate>
                                    <surname>testname</surname>
                                </participants>
                            </participantsDef>
                            <summary>test</summary>
                            <header>test</header>
                        </monthlyActiveParticipantsRepeat>
                        <linkParticipantCSVDownload>
                            <fileData>test</fileData>
                            <fileName>test</fileName>
                            <isChanged>test</isChanged>
                            <mime>tes</mime>
                            <uuid>test</uuid>
                        </linkParticipantCSVDownload>
                    </EPWPActiveParticipants>
                </sdo>
            </sdos>
        </apiRequest>
    </authentication>
</apiImport>


6. Link to display the Worker logs on a server

/exist/rest/db/kwantu-resource/api/webhook/logs.html


7. Reports
7.1 Custom reports available
User list report: 
/exist/rest/db/kwantu-resource/reports/user/userReport.xql?communityId=75b6528e-f7de-4f84-ab22-8428a20e28a1



8. Javascript console functions to use in debugging

8.1 Find a search result in the console

Take the search UUID

finder.find("9624991d-0dc5-41f2-9ee6-549e7886c503")
.then(function(s){console.log(s)})
.catch(function(err){console.log(err)});

8.2 Find the processUUID for an outOfSync error and fix it

1. Place this in the console and run it with the sync error open.

JSON.xpath("processes[string(outOfSync) eq 'true']/subProcesses/uuid",  app.SCOPE.workflow.instance, {});

2. Run the following rest service
/exist/rest/db/test/FixSubProcess.xq?communityId=962dd628-36b5-4a41-b959-a6e8827b6a7e&spuuid=7b550648-e6d1-4152-cb4b-497efadc9178

This should return this result

<fixed type="Out of sync">{"ok":true,"id":"7b550648-e6d1-4152-cb4b-497efadc9178","rev":"3-ee99945cd37a0b62de13611f88350854"}
</fixed>


9. Search configuration

Id = “search_” + uuid in the config file.
Channels are important for sync. Usually it will be “config_a_” plus appId. If the appId is 1024 everybody will get it. 
searchConfig:
Output (default to the example)
Query … this is the key area to modify
Scope
applicationId
communityId
id: (profile/community/application)
Content
Filters: here you can place a filter in the format below. (more detail needed)
Categories. See below an example how to implement
Target … where must it run,. Typically “local”.
ComponentType … leave as below

{
  "_id": "search_ae66263b-49c1-41ca-d038-90175953c287",
  "_rev": "22-c3646f60808e6d2b22b3eb9d75c17f0a",
  "searchConfig": {
    "output": {
      "code": "data",
      "label": "Data extract"
    },
    "query": {
      "scope": {
        "applicationId": "c5d4b0b9-2fc3-4259-96a5-95c8fb232f88",
        "id": "profile"
      },
      "content": {
        "filters": [
          {
            "model": "#ROOT['meta-data'].subprofileId",
            "operator": "equals",
            "value": "#SUBPROFILE_ID"
          }
        ],
        "categories": [
          {
            "basepath": "modulesRepeat.repeatDef.data",
            "id": "NTIPConfigTheorySubjectDetails",
            "applicationId": "c5d4b0b9-2fc3-4259-96a5-95c8fb232f88",
            "emit": [
              {
                "path": "moduleName",
                "name": "label"
              },
              {
                "path": "moduleCode",
                "name": "moduleCode"
              },
              {
                "path": "moduleType.code",
                "name": "moduleTypeCode"
              },
              {
                "path": "moduleType.label",
                "name": "moduleTypeLabel"
              }
            ]
          }
        ]
      }
    },
    "target": "local",
    "componentType": {
      "code": "query",
      "label": "Query"
    }
  },
  "channels": [
    "config_a_c5d4b0b9-2fc3-4259-96a5-95c8fb232f88"
  ]
}



10. URL to download an attachment

/exist/rest/db/kwantu-resource/api/rest/apiGetAttachmentFromCollector.xql?
documentId=performance-1318e19e-dfd4-444e-f3af-7868a7ff10cb&
attachmentId=0e2b2b1f-af6a-4468-984e-0be8a3673ab5&
communityId=75b6528e-f7de-4f84-ab22-8428a20e28a1&
fileName=M221KoppiesReceiptsReportRequestForApprovalByHoD.PDF

