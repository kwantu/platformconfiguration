Created by Rob Worthington, last modified on Aug 27, 2018. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+configure+conditional+transitions) on 2018-12-13.

Workflow transitions can be conditional based on values in a data object.  This allows you to show or hide different transitions depending on the choice.

|Variable|Example|Meaning|
|--------|-------|-------|
|operator|==|This will execute the transition if the value selected is equal to the data in the DO. You could also use != to execute a transition if it is not equal to|
|elementPath|doAcceptIssueForAction.code|The path for the element from which the conditionality will be read|
|context|subProcess|The context|
|setId|SDOIssue|The SDO|
|datatype|string|The data type|
|data|1|The value in the element|

Following is a code example:
```javascript
{
    "name": {
        "i18n": {
            "en": "Accept issue",
            "_id": "uuid"
        },
        "style": "prominent"
    },
    "transitionAction": {
        "goToStepId": {
            "stepId": "serverAction",
            "type": ""
        }
    },
    "_id": "moveToNextStep",
    "default": true,
    "condition": {
        "operator": "==",
        "subject": {
            "indicator": {
                "elementPath": "doAcceptIssueForAction.code",
                "modelScope": "pending",
                "context": "subProcess",
                "setId": "SDOIssue"
            }
        },
        "value": {
            "data": {
                "value": {
                    "datatype": "string",
                    "data": "1"
                }
            }
        }
    }
}
```