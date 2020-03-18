Created by Rob Worthington, last modified on Aug 24, 2018. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+configure+an+XLSX+import) on 2018-12-13.

The import service allows you to import data into a [repeat](https://github.com/kwantu/platformconfiguration/wiki/elRepeat) from an XLSX file.  The service will validate the data received from Excel, ensuring that it complies with the data type of the field in the repeat.  The service may also be used to import data outside of the repeat data model.  In this case it will create new columns in the repeat matching the data in the Excel file.

**The example code below has the following variables:**

|Parameter|Example|Meaning|
|---------|-------|-------|
|sourceIndicatorUUID|IJRmediaImportprintdata|The data object in which the Excel file is attached|
|destinationIndicatorUUID|IJRmediaImportprintdata|The data object into which the Excel data is imported
|asterfileCommunityId|be0a85ee-2841-4e91-92a0-6d82aa8cbd2a|The UUID of the community in which the import will take place|
|masterfileRegistryAppId|52b51579-dfe8-4002-d164-cdd16d60e167|The UUID of the app in which the import will take place|
|uploadElementId|Fileupload|The element ID of the field to which the Excel file will be uploaded|
|targetRepeatPath|MediaOutletRepeat.MediaOutletRepeatDef.MediaOutletsData|The path for the repeat structure that will be populated by the imported data|
|sourceIndicatorSetId|IJRmediaImportprintdata|The data object in which the Excel file is attached|
|destinationIndicatorSetId|IJRmediaImportprintdata|The data object into which the Excel data is imported|
|freeFormat|false|May be true or false. If true then all fields in the Excel file will be used to create new fields in the Data Object. If false then fields in Excel must match those in the repeat.|
|destinationIndicatorSetVersion|1|The version of the Data Object into which the Excel data is imported|

Code example:
```javaScript
{
    "_seq": 1,
    "method": {
        "worker": {
            "create": {
                "channel": "follow",
                "action": "xlsxImport",
                "indicators": [
                    {
                        "label": "sourceIndicatorUUID",
                        "setId": "IJRmediaImportprintdata",
                        "context": "subProcess"
                    },
                    {
                        "label": "destinationIndicatorUUID",
                        "setId": "IJRmediaImportprintdata",
                        "context": "subProcess"
                    }
                ],
                "fixed": [
                    {
                        "masterfileCommunityId": "be0a85ee-2841-4e91-92a0-6d82aa8cbd2a"
                    },
                    {
                        "masterfileRegistryAppId": "52b51579-dfe8-4002-d164-cdd16d60e167"
                    },
                    {
                        "uploadElementId": "Fileupload"
                    },
                    {
                        "targetRepeatPath": "MediaOutletRepeat.MediaOutletRepeatDef.MediaOutletsData"
                    },
                    {
                        "sourceIndicatorSetId": "IJRmediaImportprintdata"
                    },
                    {
                        "destinationIndicatorSetId": "IJRmediaImportprintdata"
                    },
                    {
                        "freeFormat": "false"
                    },
                    {
                        "destinationIndicatorSetVersion": "1"
                    }
                ]
            }
        }
    },
    "_id": "sendworker",
    "description": {
        "i18n": {
            "en": "test",
            "_id": "uuid"
        }
    }
}
```
