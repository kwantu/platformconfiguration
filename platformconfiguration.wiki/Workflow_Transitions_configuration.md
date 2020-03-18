[back to workflow configuration](https://github.com/kwantu/platformconfiguration/wiki/Workflow)

# Configuring workflow transitions

```json
"transition": [
    {
        "name": {
            "i18n": {
                "en": "Refer back",
                "_id": "uuid"
            }
        },
        "transitionAction": {
            "goToStepId": {
                "stepId": "captureFormBulkUplaod",
                "type": ""
            }
        },
        "_id": "toReferBackOnError",
        "showAlways": true
    },
    {
        "default":true,
        "name": {
            "style": "prominent",
            "i18n": {
                "en": "Proceed to review",
                "_id": "uuid"
            }
        },
        "transitionAction": {
            "goToStepId": {
                "stepId": "authoriseForm",
                "type": ""
            }
        },
        "_id": "toAuthoriseForm",
        "condition": {
            "operator": "==",
            "subject": {
                "subProcess": {
                    "elementPath": "spStatus"
                }
            },
            "value": {
                "data": {
                    "value": {
                        "datatype": "string",
                        "data": "success"
                    }
                }
            }
        }
    }
],
```
## Special attributes
1. Make the transition button show in red
```json
"name": {
            "style": "prominent",
         ...
}
```
2. Make the transition happen automatically, specify the following attribute in the transition object
```json
"default": true
```  
2. Make the transition available even if the workflow has not been submitted. This is primarily for referring back without saving and should be used with caution.
```json
"showAlways": true
```  


## Conditional transitions
1. Example based on the value of a field in one of the SDOs in the current context
```json
"condition": {
    "operator": "==",
    "subject": {
        "indicator": {
            "elementPath": "UploadYesNo",
            "modelScope": "pending",
            "context": "subProcess",
            "setId": "EPWPMonthlyAttendanceBulkUpload"
        }
    },
    "value": {
        "data": {
            "value": {
                "datatype": "string",
                "data": "No"
            }
        }
    }
```
2. Example based on the value of an element in the workflow transition
```json
"condition": {
    "operator": "==",
    "subject": {
        "subProcess": {
            "elementPath": "spStatus"
         }
    },
    "value": {
        "data": {
            "value": {
                 "datatype": "string",
                 "data": "success"
            }
        }
    }
}
```