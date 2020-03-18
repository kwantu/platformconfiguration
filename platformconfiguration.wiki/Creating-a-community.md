See also https://docs.google.com/document/d/1aM47Md9esnVoY9qosGp2jXhg3Osrf200R1XGvY4DTjA/edit

Use the following service to create a new community.  This will create the community profile and community configuration file.

| Parameter        | Explanation           | Values  |
| :------------- |:-------------| :-----|
| username | The username for accessing the staging server |  |
| password | The password for accessing the staging server | |
| applicationId |  | A UUID |
| communityId | The UUID of the root community on the server | A UUID |
| title | The title you wish to use for the community profile | A string |
| Name | The name you wish to use for the community profile| A string |
| refNo | The reference you wish to use for the community profile| A string |
| description | The description you wish to use for the community profile | A string |

```XML
<apiImport>
    <authentication username=""XXX"" password=""XXX"">
        <apiRequest applicationId=""XXX"" communityId=""XXX"" 
            dateTime=""2018-03-20T19:41:33.435+02:00"" validDate=""2018-03-20+02:00""
            processConfigId=""profileRegistration"" subProcessConfigId=""spProfileRegistration"">
            <sdos>
                <sdo seq=""1"" setId=""appProfile"" title=""XXX"">
                    <appProfile>
                        <Name>XXX</Name>
                        <refNo>XXX</refNo>
                        <description>XXX</description>
                    </appProfile>
                </sdo>
                <sdo seq=""2"" setId=""Community"" title=""XXX"">
                    <Community>
                        <upload>
                            <fileData></fileData>
                            <fileName>logo.png</fileName>
                            <mime>image/png</mime>
                            <uuid>XXX</uuid>
                        </upload>
                        <typeOfDepartment>
                            <code>1</code>
                            <label>abc</label>
                        </typeOfDepartment>
                        <communityID></communityID>
                        <MunicipalityName>
                            <code>XXX</code>
                            <label>XXX</label>
                        </MunicipalityName>
                        <ContactName>XXX</ContactName>
                        <phone>XXX</phone>
                        <communityName>XXX</communityName>
                        <address>XXX</address>
                        <DefaultLanguage>
                            <code>en</code>
                            <label>English</label>
                        </DefaultLanguage>
                        <DistrictName>
                            <code>XXX</code>
                            <label>XXX</label>
                        </DistrictName>
                        <ProvinceName>
                            <code>XXX</code>
                            <label>XXX</label>
                        </ProvinceName>
                        <email>XXX</email>
                        <description>XXX</description>
                    </Community>
                </sdo>
            </sdos>
        </apiRequest>
    </authentication>
</apiImport>
```