Created by Rob Worthington, last modified on Oct 31, 2017. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+check+and+update+the+data+dictionary) on 2018-12-13.

When configuring a view for a report you must select the following:

* App
* Data object
* Field

This data dictionary is generated by the Data Registry when you first adopt an app into a community.  If you make manual changes to the apps, data objects or fields after this, you may need to manually update this data dictionary.  You can do this by:

### 1. Check the list of apps in a community

Modify the following URL to use the UUID for your community:

[http://kwantu8.kwantu.net:8001/kwantu_taxonomies/Application_Community_ed8e6a18-e581-4104-902d-a6e9377776b1](http://kwantu8.kwantu.net:8001/kwantu_taxonomies/Application_Community_ed8e6a18-e581-4104-902d-a6e9377776b1)

This will display the following results:

```JavaScript
{
    "_id": "Application_Community_ed8e6a18-e581-4104-902d-a6e9377776b1",
    "_rev": "14-b488f87a8f6a84bf324b314af16cfac9",
    "channels": [
        "config_c_ed8e6a18-e581-4104-902d-a6e9377776b1"
    ],
    "data": {
        "items": {
            "item": [
                {
                    "code": "407b6ee2-c682-41e0-a165-e7d9bc566a31:1",
                    "label": {
                        "en": "Performance"
                    }
                },
                {
                    "code": "3b76d7c9-8ace-4f63-d8cc-7bbc655d5898:1",
                    "label": {
                        "en": "Test DR App"
                    }
                },
                {
                    "code": "1d28c58d-194c-464a-edcd-9c546b08b5aa:1",
                    "label": {
                        "en": "Performance"
                    }
                }
            ]
        }
    }
}
```

Update this file to reference the UUID for any new apps.  The label is used only in reporting.

### 2. Check the list of data objects for each app
Modify the following URL to use the UUID for your app:

http://kwantu8.kwantu.net:8001/kwantu_taxonomies/Indicator_Application_3b76d7c9-8ace-4f63-d8cc-7bbc655d5898:1

This will return the following result:
```javaScript
{
    "_id": "Indicator_Application_3b76d7c9-8ace-4f63-d8cc-7bbc655d5898:1",
    "_rev": "10-b3fe7ab627a344a5d61cf489a89222ac",
    "channels": [
        "config_a_3b76d7c9-8ace-4f63-d8cc-7bbc655d5898"
    ],
    "data": {
        "items": {
            "item": [
                {
                    "code": "appProfile:V1.0",
                    "label": {
                        "en": "Profile"
                    }
                },
                {
                    "code": " drldrlandacquisitionform:1",
                    "label": {
                        "en": " drldrlandacquisitionform"
                    }
                },
                {
                    "code": "DRDLRProjectCompletion:1",
                    "label": {
                        "en": "DRDLRProjectCompletion"
                    }
                },
                {
                    "code": "DRDLRProjectSurveillanceBeneficiaries:1",
                    "label": {
                        "en": "DRDLRProjectSurveillanceBeneficiaries"
                    }
                },
                {
                    "code": "DRDLRProjectSurveillanceChallenges:1",
                    "label": {
                        "en": "DRDLRProjectSurveillanceChallenges"
                    }
                },
                {
                    "code": "DRDLRProjectSurveillanceGeneralDetails:1",
                    "label": {
                        "en": "DRDLRProjectSurveillanceGeneralDetails"
                    }
                },
                {
                    "code": "DRDLRProjectSurveillanceIncomeGeneration:1",
                    "label": {
                        "en": "DRDLRProjectSurveillanceIncomeGeneration"
                    }
                },
                {
                    "code": "DRDLRProjectSurveillanceInfrastructureDevelopment:1",
                    "label": {
                        "en": "DRDLRProjectSurveillanceInfrastructureDevelopment"
                    }
                },
                {
                    "code": "DRDLRProjectSurveillancePhotographs:1",
                    "label": {
                        "en": "DRDLRProjectSurveillancePhotographs"
                    }
                },
                {
                    "code": "DRDLRProjectSurveillanceProductivity:1",
                    "label": {
                        "en": "DRDLRProjectSurveillanceProductivity"
                    }
                },
                {
                    "code": "DRDLRProjectSurveillanceRecommendations:1",
                    "label": {
                        "en": "DRDLRProjectSurveillanceRecommendations"
                    }
                },
                {
                    "code": "DRDLRProjectSurveillanceAccessToMarkets:1",
                    "label": {
                        "en": "DRDLR_ProjectSurveillanceAccessToMarkets"
                    }
                },
                {
                    "code": "drdlrBusinessPlan:1",
                    "label": {
                        "en": "drdlrBusinessPlan"
                    }
                },
                {
                    "code": "drdlrProjectDetailsRADP:1",
                    "label": {
                        "en": "drdlrProjectDetailsRADP"
                    }
                },
                {
                    "code": "drdlrTitleDeeds:1",
                    "label": {
                        "en": "drdlrTitleDeeds"
                    }
                },
                {
                    "code": "drdlrfarm:1",
                    "label": {
                        "en": "drdlrfarm"
                    }
                },
                {
                    "code": "drdlrserviceProvider:1",
                    "label": {
                        "en": "drdlrserviceProvider"
                    }
                },
                {
                    "code": "drldrProgramme:1",
                    "label": {
                        "en": "drldrProgramme"
                    }
                }
            ]
        }
    }
}
```
Modify this to add in any new SDOs or remove deprecated ones.  For the code field use the set ID and the version.

### 3. Check the list of fields in an SDO
Modify the following URL to use the set ID for your SDO:

[http://kwantu8.kwantu.net:8001/kwantu_taxonomies/Field_Indicator_SDOparticipant:1](http://kwantu8.kwantu.net:8001/kwantu_taxonomies/Field_Indicator_SDOparticipant:1)

This returns the following result:
```javaScript
{
    "_id": "Field_Indicator_SDOparticipant:1",
    "_rev": "91-bc0b30aa1a5f34389e11815b15a5e0fb",
    "channels": [
        "taxonomy",
        "indicator_a_656ec4ee-3ae7-4a29-8b88-45940600ba2a",
        "indicator_a_1024",
        "indicator_a_528e4561-9578-4e72-d543-f6125b45801c",
        "indicator_a_test",
        "indicator_a_4d879437-e57c-4677-c8b7-e3a1bc39d1d8"
    ],
    "data": {
        "items": {
            "item": [
                {
                    "code": "_title",
                    "index": "false",
                    "label": {
                        "en": "Document title"
                    }
                },
                {
                    "code": "_id",
                    "index": "false",
                    "label": {
                        "en": "Document id"
                    }
                },
                {
                    "code": "_setId",
                    "index": "false",
                    "label": {
                        "en": "Document category"
                    }
                },
                {
                    "code": "_profileId",
                    "index": "false",
                    "label": {
                        "en": "Profile UUID"
                    }
                },
                {
                    "code": "_communityId",
                    "index": "false",
                    "label": {
                        "en": "Community Id"
                    }
                },
                {
                    "code": "_applicationId",
                    "index": "false",
                    "label": {
                        "en": "Application Id"
                    }
                },
                {
                    "code": "_subprofileId",
                    "index": "false",
                    "label": {
                        "en": "Subprofile Id"
                    }
                },
                {
                    "code": "_seq",
                    "index": "false",
                    "label": {
                        "en": "Meta sequence"
                    }
                },
                {
                    "code": "_status",
                    "index": "false",
                    "label": {
                        "en": "Entry status"
                    }
                },
                {
                    "code": "IDnumber",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "ID number"
                    }
                },
                {
                    "code": "surname",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Surname"
                    }
                },
                {
                    "code": "initial",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Initials"
                    }
                },
                {
                    "code": "firstName",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "First name"
                    }
                },
                {
                    "code": "dateOfBirth",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Date of birth"
                    }
                },
                {
                    "code": "gender",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Gender"
                    }
                },
                {
                    "code": "isDisable.code",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Is the person disabled? - code"
                    }
                },
                {
                    "code": "isDisable.label",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Is the person disabled? - label"
                    }
                },
                {
                    "code": "race.code",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Race - code"
                    }
                },
                {
                    "code": "race.label",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Race - label"
                    }
                },
                {
                    "code": "governmentGrant.code",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Government grant - code"
                    }
                },
                {
                    "code": "governmentGrant.label",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Government grant - label"
                    }
                },
                {
                    "code": "employmentpast5Year.code",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Employed in past 5 Years? - code"
                    }
                },
                {
                    "code": "employmentpast5Year.label",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Employed in past 5 Years? - label"
                    }
                },
                {
                    "code": "firstLanguage.code",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "First language - code"
                    }
                },
                {
                    "code": "firstLanguage.label",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "First language - label"
                    }
                },
                {
                    "code": "otherLanguage1.code",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Other language 1 - code"
                    }
                },
                {
                    "code": "otherLanguage1.label",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Other language 1 - label"
                    }
                },
                {
                    "code": "otherLanguage2.code",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Other language 2 - code"
                    }
                },
                {
                    "code": "otherLanguage2.label",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Other language 2 - label"
                    }
                },
                {
                    "code": "highestLevelEducation.code",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Highest level of education - code"
                    }
                },
                {
                    "code": "highestLevelEducation.label",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Highest level of education - label"
                    }
                },
                {
                    "code": "province.code",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Province - code"
                    }
                },
                {
                    "code": "province.label",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Province - label"
                    }
                },
                {
                    "code": "district.code",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "District - code"
                    }
                },
                {
                    "code": "district.label",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "District - label"
                    }
                },
                {
                    "code": "municipality.code",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Municipality / village - code"
                    }
                },
                {
                    "code": "municipality.label",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Municipality / village - label"
                    }
                },
                {
                    "code": "wardName.code",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Ward name / number - code"
                    }
                },
                {
                    "code": "wardName.label",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Ward name / number - label"
                    }
                },
                {
                    "code": "address",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Address"
                    }
                },
                {
                    "code": "cellNumber",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Cellphone number"
                    }
                },
                {
                    "code": "email",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Email Address"
                    }
                },
                {
                    "code": "nationality.code",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Nationality - code"
                    }
                },
                {
                    "code": "nationality.label",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Nationality - label"
                    }
                },
                {
                    "code": "numberOfpeopleHoushold",
                    "datatype": "integer",
                    "index": "false",
                    "label": {
                        "en": "Number of people in household"
                    }
                },
                {
                    "code": "numberOfdependent",
                    "datatype": "integer",
                    "index": "false",
                    "label": {
                        "en": "Number of dependants in household"
                    }
                },
                {
                    "code": "numberOfChildren",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "Number of children attending school"
                    }
                },
                {
                    "code": "uploadPhoto.fileData",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "- fileData"
                    }
                },
                {
                    "code": "uploadPhoto.mime",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "- mime"
                    }
                },
                {
                    "code": "uploadPhoto.isChanged",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "- isChanged"
                    }
                },
                {
                    "code": "uploadPhoto.uuid",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "- uuid"
                    }
                },
                {
                    "code": "uploadPhoto.fileName",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "- fileName"
                    }
                },
                {
                    "code": "uploadDocument.fileData",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "- fileData"
                    }
                },
                {
                    "code": "uploadDocument.mime",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "- mime"
                    }
                },
                {
                    "code": "uploadDocument.isChanged",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "- isChanged"
                    }
                },
                {
                    "code": "uploadDocument.uuid",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "- uuid"
                    }
                },
                {
                    "code": "uploadDocument.fileName",
                    "datatype": "string",
                    "index": "false",
                    "label": {
                        "en": "- fileName"
                    }
                }
            ]
        }
    }
}
```
Update the contents to ensure that each element is included in the file.

Remember to push these changes to production.

