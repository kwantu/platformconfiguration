[back](https://github.com/kwantu/platformconfiguration/wiki/Support-and-Maintenance-Services-and-Procedures)

## Rest service call to use
This service can be used to create a new workflow instance programmatically. The following is a post rest service:
```http
This is a POST rest service. The data block to be attached is an xml block described below.

https://<Exist hostname>/exist/rest/db/kwantu-resource/importAPICollection/import.xq?TYPE=COMMUNITY_WORKFLOW

where:
<Exist hostname> = Hostname and port if applicable where the exist service is running on.
for example: 

https://kwantu.support/exist/rest/db/kwantu-resource/importAPICollection/import.xq?TYPE=PROCESS_WORKFLOW

```
**Note:** the service will not check if the preconditions for the the workflow has been met. It is the service user's responsibility to do that. 

## Data block to use in the rest service call

```xml
<apiImport>
    <authentication username="xxxxxx" password="*******">
        <apiRequest communityId="29000" 
                    applicationId="1023"
                    profileId="07519593-8f49-4a02-ace7-844726e13bf9"
                    idUUID="<provide a uuid here for the in which the service will run>"
                    dateTime="2018-03-20T19:41:33.435+02:00" 
                    validDate="2018-03-20+02:00"
                    processConfigId="profileRegistration" 
                    subProcessConfigId="spProfileRegistration">
            <sdos>
                <sdo seq="1" setId="appProfile" title="yyyyy">
                    ... the content here depends on the data model and the mapping file used ...
                </sdo>
                <sdo seq="2" setId="Community" title="VP2">
                    ... the content here depends on the data model and the mapping file used ...
                </sdo>
            </sdos>
        </apiRequest>
    </authentication>
</apiImport>
```

The following parameters are important:<br>
### In the <authentication> tag
In this tag the authentication and core process related parameters are specified. The workflow process values should be used as is. The following parameters need to be provided:<br>

**username**="xxxxxx". System administrator user name that has permissions to create a community. <br>
**password**="*******". Password for the user name. <br>
**dateTime**="2018-03-20T19:41:33.435+02:00". The date and time that the process was executed. <br>
**validDate**="2018-03-20+02:00". The valid date for the process. <br>
<br>

### SDO tag

The SDO tag containts the content of the data object that will be used in the workflow. In this case, provide the relevant data for the data objects: <br>

### Specify the mapping file
For each data object in the workflow, there needs to be a mapping file in the following folder: **`/db/kwantu-resource/api/resources`** . This mapping file is used to convert the xml source file to a json destination file. An example is presented below

```xml
<root xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="jsonMapping.xsd">
    <map name="appProfile" xpath="/appProfile">
        <element name="Name" xpath="/appProfile/Name" datatype="string"/>
        <element name="Status" xpath="/appProfile/Status" datatype="string"/>
        <element name="description" xpath="/appProfile/description" datatype="string"/>
        <element name="profileStatus" xpath="/appProfile/profileStatus" datatype="string"/>
        <element name="refNo" xpath="/appProfile/refNo" datatype="string"/>
    </map>
</root>
```