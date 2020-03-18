[back](https://github.com/kwantu/platformconfiguration/wiki/Workflow-Configuration-of-Server-side-actions)

# Service to import records from an uploaded xlsx file to a repeat.
Note that the first record of the excel file is used to show the field names for the columns. Then those are matched to the fields in the repeat. If any of the fields are incorrect, the upload will fail and and error returned with a proper message.
The following parameters are used:

```js
"serverAction": [
    {
        "_seq": 1,
        "method": {
            "worker": {
                "create": {
                    "channel": "follow",
                    "action": "genericXlsxImport",
                    "indicators": [
                        {
                            "label": "sourceIndicatorUUID",
                            "setId": "source setid",
                            "context": "subProcess",
                            "uploadElementId" : "xxxx"
                        },
                        {
                            "label": "destinationIndicatorUUID",
                            "setId": "destinationid",
                            "context": "subProcess",
                            "targetRepeatPath": "Path to repeat data"
                        }
                    ],
                    "fixed": [
                        {
                            "freeFormat": "false"
                        },
                        {
                            "useFirstRowAsColumnMappings": "true"
                        },
                        {
                            "limit": "1"
                        }
                    ],
                      "mappings": [
                        {
                            "col_01": "some path"
                        },
                        {
                           "col_02": "some path"
                        },
                        {
                            "col_03": "some path"
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
]
```