[back](https://github.com/kwantu/platformconfiguration/wiki/Support-and-Maintenance-Services-and-Procedures)

## Rest service call to use
This service can be used to create a new community programmatically. The following is a post rest service:
```http
This is a POST rest service. The data block to be attached is an xml block described below.

https://<Exist hostname>/exist/rest/db/kwantu-resource/importAPICollection/import.xq?TYPE=COMMUNITY_WORKFLOW

where:
<Exist hostname> = Hostname and port if applicable where the exist service is running on.
for example: 

https://kwantu.support/exist/rest/db/kwantu-resource/importAPICollection/import.xq?TYPE=COMMUNITY_WORKFLOW

```

## Data block to use in the rest service call

```xml
<apiImport>
    <authentication username="xxxxxx" password="*******">
        <apiRequest communityId="29000" 
                    applicationId="1023" 
                    idUUID="<provide a uuid here for the community if you have one else leave empty>"
                    dateTime="2018-03-20T19:41:33.435+02:00" 
                    validDate="2018-03-20+02:00"
                    processConfigId="profileRegistration" 
                    subProcessConfigId="spProfileRegistration">
            <sdos>
                <sdo seq="1" setId="appProfile" title="yyyyy">
                    <appProfile>
                        <Name>yyyyy</Name>
                        <refNo>yyyyy</refNo>
                        <description>yyyyy</description>
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
                            <fileData>...Insert here the base64encoded string for the community logo...                            </fileData>
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
**sdo.appProfile.Name** : Name of the community. <br>
**sdo.appProfile.refNo** : Reference number for the community. <br>
**sdo.appProfile.description** : Description for the community. <br>
