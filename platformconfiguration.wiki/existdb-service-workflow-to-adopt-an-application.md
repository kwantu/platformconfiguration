## Rest service call to use

This service can be used to create a new community programmatically. The following is a post rest service:
```http
This is a POST rest service. The data block to be attached is an xml block described below.

https://<Exist hostname>/exist/rest/db/kwantu-resource/importAPICollection/import.xq?TYPE=ADOPTION_WORKFLOW

where:
<Exist hostname> = Hostname and port if applicable where the exist service is running on.
for example: 

https://kwantu.support/exist/rest/db/kwantu-resource/importAPICollection/import.xq?TYPE=ADOPTION_WORKFLOW

```

## Data block to use in the rest service call

```xml

<apiImport>
    <authentication username="xxxxxx" password="*******">
        <apiRequest profileId="<<uuid of the application profile>>"
            communityId="29000"
            applicationId="1024"
            dateTime="<<dateTime>>" validDate="<<validDate>>"
            processConfigId="newInstanceProcess" subProcessConfigId="spnewInstanceProcess">
            <sdos>
                <sdo seq="1" setId="Adoption" title="abc aaa">
                    <Adoption>
                        <applicationID>{uuid of the application profile}</applicationID>
                        <applicationName>{Name of the application}</applicationName>
                        <community>
                            <code>{uuid of the Community}</code>
                            <label>{name of the community}</label>
                        </community>
                        <version>
                            <code>{version of the app being adopted}</code>
                            <label>{version of the app being adopted}</label>
                        </version>
                    </Adoption>
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

**appProfile data object** <br>

**sdo.title** : Name of the community. <br>
**sdo.Adoption.applicationID** : UUID of the application profile. <br>
**sdo.Adoption.applicationName** : Name of the application. <br>
**sdo.Adoption.community.code** : uuid for the community that is adopting. <br>
**sdo.Adoption.community.label** : namefor the community that is adopting. <br>
**sdo.Adoption.version.code** : number for the version of the app that is being adopted. <br>
**sdo.Adoption.version.label** : number for the version of the app that is being adopted. <br>