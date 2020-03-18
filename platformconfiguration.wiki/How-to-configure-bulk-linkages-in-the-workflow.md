Created by Rob Worthington, last modified on Jul 06, 2018. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+configure+bulk+linkages+in+the+workflow) on 2018-12-13.

## Introduction
This article explains how to configure the workflow to link a data object.  It interacts with three data objects:

|Type|Function|Example|
|----|--------|-------|
|Link source	|This is the object that is being linked. It must have a field that is a unique identifier.	|Participant, Farm or Facility|
|ID	|This object allows the user to paste in a list of unique identifiers for the link source data object|	
|Link destination	|This object has a repeat structure that is populated by the service with data from the link source object instances	|Monthly progress|

Note.  When configuring bulk linking for the first time, you must also create the search index used.  If you are using the same source data object then this is not necessary.

## Guidance
The configuration is split into the following three sections:

### 1. Indicators

In this section we specify the set IDs of the data objects that will be used:
* sdoListUUID - this is the link destination.  This data object will be used to populate a repeat with data from the link source
* sdoBulkLinkUUID - this is the ID.  This data object will receive a list of IDs that are used to link

### 2. Fixed

In this section we specify parameters used by the linking service.  These are:

|Parameter|Explanation|Example|
|----|--------|-------|
|**DEPRECATED**: "masterfileCommunityId":	|**DEPRECATED**: UUID of the community in which you are working	 |"962dd628-36b5-4a41-b959-a6e8827b6a7e"|
|"masterfileRegistryAppId":	|UUID of the app that holds the data object that you are linking too	|"7c2772b3-838e-45c5-a5c2-ee9495239585"|
|"sdoSetId": 	|The link source set ID	|"drParticipant"|
|"sdoSearchPath": 	|The path for the link source in which the unique identifier is found	|"model.pending.data.drParticipant.IDnumber"|
|"participant:links":	|"TODO"|
|"sdoListSetId":	|The link destination set ID	|"EPWPActiveParticipants"|
|"sdoBulkLinkSetId": 	|The link ID set ID	|"EPWPLinkParticipantsInBulk"|
|"sdoElement": 	|The element ID in the link ID data object	|"model.pending.data.EPWPLinkParticipantsInBulk.IDnumbers"|
|"sdoSuccessElement": 	|The element ID of the field where the success message will be set	|"model.pending.data.EPWPLinkParticipantsInBulk.IDNumbersSuccessfullyLinked"|
|"sdoErrorElement": 	|The element ID of the field where the error message will be set	|"model.pending.data.EPWPLinkParticipantsInBulk.IDNumbersNotLinked"|
|"mustMoveToCurrent":	|true|
"sdoListCSV": 	|The element ID where the CSV file must be set	|"model.pending.data.EPWPActiveParticipants.linkParticipantCSVDownload"|
|"sdoListRepeatDataRow":	|The ID of the repeat in the link destination that will be populated with linked data	|"model.pending.data.EPWPActiveParticipants.monthlyActiveParticipantsRepeat.participantsDef.participants"|

### 3. Data fields

This section is used to specify which elements from the link source are used to populate which rows in the link destination

**Code example**
The following example shows a new `serverAction` code block.  This is placed in the workflow config-file, in the step in which the bulk linking takes place.  It is placed above the step `preActions`.

Code example

```javascript
                                    "serverAction": [
                                        {
                                            "_seq": 1,
                                            "method": {
                                                "worker": {
                                                    "create": {
                                                        "channel": "follow",
                                                        "action": "linkSDO",
                                                        "indicators": [
                                                            {
                                                                "label": "sdoListUUID",
                                                                "setId": "EPWPActiveParticipants",
                                                                "context": "subProcess"
                                                            },
                                                            {
                                                                "label": "sdoBulkLinkUUID",
                                                                "setId": "EPWPLinkParticipantsInBulk",
                                                                "context": "subProcess"
                                                            }
                                                        ],
                                                        "fixed": [
                                                            {
                                                                "masterfileCommunityId": "962dd628-36b5-4a41-b959-a6e8827b6a7e"
                                                            },
                                                            {
                                                                "masterfileRegistryAppId": "7c2772b3-838e-45c5-a5c2-ee9495239585"
                                                            },
                                                            {
                                                                "sdoSetId": "drParticipant"
                                                            },
                                                            {
                                                                "sdoSearchPath": "model.pending.data.drParticipant.IDnumber"
                                                            },
                                                            {
                                                                "participant:links": "TODO"
                                                            },
                                                            {
                                                                "sdoListSetId": "EPWPActiveParticipants"
                                                            },
                                                            {
                                                                "sdoBulkLinkSetId": "EPWPLinkParticipantsInBulk"
                                                            },
                                                            {
                                                                "sdoElement": "model.pending.data.EPWPLinkParticipantsInBulk.IDnumbers"
                                                            },
                                                            {
                                                                "sdoSuccessElement": "model.pending.data.EPWPLinkParticipantsInBulk.IDNumbersSuccessfullyLinked"
                                                            },
                                                            {
                                                                "sdoErrorElement": "model.pending.data.EPWPLinkParticipantsInBulk.IDNumbersNotLinked"
                                                            },
                                                            {
                                                                "mustMoveToCurrent": true
                                                            },
                                                            {
                                                                "sdoListCSV": "model.pending.data.EPWPActiveParticipants.linkParticipantCSVDownload"
                                                            },
                                                            {
                                                                "sdoListRepeatDataRow": "model.pending.data.EPWPActiveParticipants.monthlyActiveParticipantsRepeat.participantsDef.participants"
                                                            }
                                                        ],
                                                        "dataFields": [
                                                            {
                                                                "label": "sdoUUID",
                                                                "source": "_id",
                                                                "target": "model.pending.data.EPWPActiveParticipants.monthlyActiveParticipantsRepeat.participantsDef.participants.participantUUID"
                                                            },
                                                            {
                                                                "label": "sdoLocalUUID",
                                                                "source": "_id",
                                                                "target": "model.pending.data.EPWPActiveParticipants.monthlyActiveParticipantsRepeat.participantsDef.participants.localParticipantUUID"
                                                            },
                                                            {
                                                                "label": "firstName",
                                                                "source": "model.pending.data.drParticipant.firstName",
                                                                "target": "model.pending.data.EPWPActiveParticipants.monthlyActiveParticipantsRepeat.participantsDef.participants.firstName"
                                                            },
                                                            {
                                                                "label": "lastName",
                                                                "source": "model.pending.data.drParticipant.lastName",
                                                                "target": "model.pending.data.EPWPActiveParticipants.monthlyActiveParticipantsRepeat.participantsDef.participants.lastName"
                                                            },
                                                            {
                                                                "label": "IDnumber",
                                                                "source": "model.pending.data.drParticipant.IDnumber",
                                                                "target": "model.pending.data.EPWPActiveParticipants.monthlyActiveParticipantsRepeat.participantsDef.participants.IDnumber"
                                                            },
                                                            {
                                                                "label": "DateOfBirth",
                                                                "source": "model.pending.data.drParticipant.dateOfBirth",
                                                                "target": "model.pending.data.EPWPActiveParticipants.monthlyActiveParticipantsRepeat.participantsDef.participants.DateOfBirth"
                                                            },
                                                            {
                                                                "label": "Gender",
                                                                "source": "model.pending.data.drParticipant.gender",
                                                                "target": "model.pending.data.EPWPActiveParticipants.monthlyActiveParticipantsRepeat.participantsDef.participants.Gender"
                                                            }
                                                        ]
                                                    }
                                                }
                                            },
                                            "_id": "linkSDO",
                                            "description": {
                                                "i18n": {
                                                    "en": "Function to generically link SDO",
                                                    "_id": "uuid"
                                                }
                                            }
                                        }
                                    ],
```

