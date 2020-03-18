[back to workflow](https://github.com/kwantu/platformconfiguration/wiki/Workflow)

# Link indicators to the workflow.
This process tells the workflow which linked indicators should be made available to the workflow subProcessInstance. The indicator setId must be defined in the appConfig file. The cardinality and other key information regarding the SDO is defined there. This manages the incorporation of the SDO to the current workflow. There are two tags, each which consist of an array of indicator specifications.

## Indicators
Provides a list of indicators with their setId, Name to reference in the workflow and an InitiateData instruction. The data objects in the "indicators" array will be initiated once the workflow starts.

```json
"indicators": [
  {
      "initiateData": "history",
      "name": {
          "i18n": {
              "en": "Monthly attendance bulk upload",
              "_id": "uuid"
          }
      },
      "_id": "EPWPMonthlyAttendanceBulkUpload",
      "seq": 1
  },
  {}]
```

### ReferenceIndicators 

Provides a list of indicators with their setId, Name to reference in the workflow and an InitiateData instruction. The data objects in the "indicators" array will NOT be initiated once the workflow starts, but will be accessible to the workflow process. This would be used where one workflow or server based process provides data that another process needs to use, but cannot update.

```json
"referenceIndicators": [
  {
      "initiateData": "history",
      "name": {
          "i18n": {
              "en": "Active participants per locality",
              "_id": "uuid"
          }
      },
      "_id": "EPWPActiveParticipants",
      "seq": 0
  }
]
```

