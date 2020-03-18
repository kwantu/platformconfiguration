Created by Rob Worthington, last modified on Nov 02, 2017. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+configure+prerequisites) on 2018-12-17.

Pre-requisites allow us to set rules that prevent users from instantiating a workflow process.  They check the status of other workflow processes against rules that you specify.

The example below includes the following parameters:

|Parameter|Purpose|Example|Options|
|---------|-------|-------|-------|
|id	|A unique ID for the variable	|||
|_seq	|The sequence must be unique and the sequence will determine the order in which the prerequisites execute|||	
|count	|How many of the designated sub-process instances are specified in the rule	||0 to 9999|
|operator	|The operator defines how the count is applied.	||greaterThan <br> lessThan <br> reaterThanEqual <br> lessThanEqual <br> notEqualTo <br> |
|type	|The type refers to the status of the workflow sub process|	|Started <br> Completed <br> InProgress <br>| 
### Examples 

### Block workflow if another process is not complete

In this example below the process and sub-process ID of the process that is not complete is specified.  The count is set to zero and the operator to "greaterThan".  This means that the workflow will not proceed unless there is one or more processes of the specified type that has the status complete.

### Code example 1:
```javascript
                {
                    "_id": "profileCreation",
                    "_seq": 1,
                    "check": {
                        "numberProcessInstances": {
                            "count": 0,
                            "operator": "greaterThan",
                            "processId": "profileRegistration",
                            "subProcessId": "spProfileRegistration",
                            "type": "Complete"
                        }
                    },
                    "message": {
                        "i18n": {
                            "_id": "uuid",
                            "en": "The branch profile registration must be complete"
                        }
                    }
                }
```
### Block workflow is another process is pending

In this example below the process and subprocess ID of the process that is not complete is specified.  The count is set to zero and the operator to "notEqualTo".  This means that the workflow will not proceed unless there is a process of the specified type that has the status InProgress.

### Code example 2:

```javascript
                {
                    "_id": "noConcurrents",
                    "_seq": 3,
                    "check": {
                        "numberProcessInstances": {
                            "count": 0,
                            "operator": "equalTo",
                            "processId": "Supplier",
                            "subProcessId": "spSupplier",
                            "type": "InProgress"
                        }
                    },
                    "message": {
                        "i18n": {
                            "_id": "uuid",
                            "en": "There is already a supplier requisition request being processed.  It must be completed before you can start a new one."
                        }
                    }
                }
```