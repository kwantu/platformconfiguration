Created by Rob Worthington, last modified on Sep 14, 2018. Copied from the Kwantu [wiki](http://w.kwantu.net/display/CON/Workflow+configuration) to Github 2018-12-10


# Documentation
Hasan has produced two documents to cover the workflow overall: <br>
[one here.](https://docs.google.com/document/d/1GWXEgHGEZeLKmrICv3TwlUCi7_6DGD-6Na2gl5Aj42A/edit#heading=h.8h4ayduc9lco) <br>
[two here.](https://docs.google.com/document/d/1e6ip7aiZYRBFohdMNO8-7nSdm9F644CgiSABXAXpF8c/edit?ts=594b63fb#)

1. Manguang Project config file, that show three example processes. The overall workflow remains the same with minor changes and some additions in functionality but config and code is majorly changed to match the schema in more logical and schema oriented way. Still the basic workflow navigation , assignment, transition is same. You can access the updated schema from 
[Config File Location:](http://kwantu8.kwantu.net:8001/kwantu_configs/1004:1:processDefinition)
2. Workflow2.0 schema file handles the config file creation and validation. You can use Visual studio and associate the schema and validate. 
[Schema Location:](https://github.com/kwantu/workflow/blob/Workflow2.0/schemas/workFlowDefinitionSchema.json) <br> 
[and in the DB...](http://kwantu7.kwantu.net:8180/exist1-4/rest/db/json/workFlowDefinitionSchema.json)

# How to guides

* [How to set the title for a sub process instance](https://github.com/kwantu/platformconfiguration/wiki/How-to-set-the-title-for-a-sub-process-instance)
* [How to configure a periodic workflow](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-a-periodic-workflow)
* [How to set the title for a sub process instance](https://github.com/kwantu/platformconfiguration/wiki/How-to-set-the-title-for-a-sub-process-instance)
* [How to fix problem where workflow to update a profile name hangs when you make approve transition]()
* [How to take the name entered in the profile creation field and set this for a field in a data object used in profile creation](https://github.com/kwantu/platformconfiguration/wiki/How-to-fix-problem-where-workflow-to-update-a-profile-name-hangs-when-you-make-approve-transition)
* [How to take the name entered in the profile creation field and set this as the sub process instance name](https://github.com/kwantu/platformconfiguration/wiki/How-to-take-the-name-entered-in-the-profile-creation-field-and-set-this-as-the-sub-process-instance-name)
* [How to update the profile name based on the atom title field for a data object](https://github.com/kwantu/platformconfiguration/wiki/How-to-update-the-profile-name-based-on-the-atom-title-field-for-a-data-object)
* [How to take the name entered as the sub process instance title and set this for a field in a data object in that process](https://github.com/kwantu/platformconfiguration/wiki/How-to-take-the-name-entered-as-the-sub-process-instance-title-and-set-this-for-a-field-in-a-data-object-in-that-process)
* [How to configure workflow for multiple categories](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-workflow-for-multiple-categories)
* [How to configure notifications](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-notifications)
* [How to use the workflow to set a label in a data object](https://github.com/kwantu/platformconfiguration/wiki/How-to-use-the-workflow-to-set-a-label-in-a-data-object)
* [How to debug profile level workflow](https://github.com/kwantu/platformconfiguration/wiki/How-to-debug-profile-level-workflow)
* [How to configure sub profile categories](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-sub-profile-categories)
* [How to configure an automatic transition](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-an-automatic-transition)
* [How to configure instanceType in the workflow](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-instanceType-in-the-workflow)
* [How to configure prerequisites](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-prerequisites)
* [How to configure user interface messages in the workflow](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-user-interface-messages-in-the-workflow)
* [How to configure overdue notifications](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-overdue-notifications.)
* [How to specify the order of data objects and which are displayed in each step](https://github.com/kwantu/platformconfiguration/wiki/How-to-specify-the-order-of-data-objects-and-which-are-displayed-in-each-step)
* [How to configure the button style for workflow](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-the-button-style-for-workflow)
* [How to configure bulk linkages in the workflow](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-bulk-linkages-in-the-workflow)
* [How to configure a refer back transition](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-a-refer-back-transition)
* [How to use a profile variable to store and set values in a data object](https://github.com/kwantu/platformconfiguration/wiki/How-to-use-a-profile-variable-to-store-and-set-values-in-a-data-object)
* [How to configure an XLSX import](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-an-XLSX-import)
* [How to configure conditional transitions](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-conditional-transitions)
* [How to assign a user a role using the worlflow](https://github.com/kwantu/platformconfiguration/wiki/How-to-assign-a-user-a-role-using-the-worlflow)
* [Workflow actions](https://github.com/kwantu/platformconfiguration/wiki/Workflow-actions)

The following is a list of available and pending workflow actions on the development roadmap.  These are documented in the schema.

| Method | Action | Description | Status | Questions / Comments | Clients needing |
|--------|--------|-------------|--------|----------------------|-----------------|
|Form - list of indicators defined in a sub-process|Create|A bulk action to create the atom objects|Implemented|||
|        | Instantiate | A bulk action to set all sequence numbers for the atom objects | Implemented |||
| Indicator - an indicator set|Create|Creates an instance of an atom object|Implemented|||
|        |Instantiate|Sets the sequence number for an instance of the atom object|Implemented|||
|        |Set value|Sets a specific value in the data model of the indicator set instance.|Implemented|This method must not be allowed to break IS validations|||
|        |Discard|Flag as discarded|Pending||All|
|Profile - an application profile|Set variable|Read a specific value from the data model of an indicator set instance and sets it to the profile variable list|Implemented|||
|        |Set value|Sets a specific value in the data model of the profile instance indicator set.|Implemented|||
|        |Create|Create a profile|Implemented|||
|        |Set status to|Sets a profile level status|Implemented|||
|        |Set status message to|Sets a profile level status message|Implemented|
|Sub-process instance - a sub-process instance|Instantiate|Creates the SP instances and sets the sequence number for an instance of the SP instance|Implemented|||
|        |Authorise|Authorise a SP instance and it's indicator sets|Implemented|||
|        |Close|Close a SP instance|Implemented|||
|        |Set variable|Allows for each SP instance to have it's own variables|Implemented|||
|        |Set status to|Sets a SP instance level status|Implemented|||
|        |Set status message to|Sets a SP instance level status message|Implemented|||
|        |Delete|Delete a SP instance|Pending||All|
|        |Assign to channel|Assign the profile to a user's distribution channel|Pending|||
|        |Set label|Updates the SP instance label (name)|Pending||All|
|Step - a step within a sub-process instance|Set variable|Allows for each step to have it's own variables|Implemented|||
|Community|Create|Creates a new community|Implemented|||
|        |User join|Creates the network link between the user and the community and sets the default roles for that community|Implemented|Request access / roles IS must be defined|||
|        |Release adopted application||Implemented|||
|        |Delete||Pending|||
|Application|Create application definition||Implemented|||
|        |Build application||Implemented|||
|        |Application adoption||Implemented|||
|        |Set user role||Pending|||
|User    |Set variable||Implemented|||
|        |Create user profile||Implemented|||
|        |Delete||Pending|||
|        |Set In-active||Implemented|||
|        |Assign to channel|Assign a profile to a user's distribution channel|Pending|||
|SDO - an indicator set|Built to test|Build to a sandbox on the Data Registry|Implemented|||
|        |Build|Implemented|||
|Taxonomies|Build||Pending|||
|TBD|Set worker action||||
|Check for duplicate||Check server for duplicate based on specific field or fields|||

## Gaps
How can participant ID be checked against list on server?

## Pre-requisites

|Type|Description|Status|
|----|-----------|------|
|Number of process instances|May not start if process X does not have at least Y SP instances|Implemented|
|Variable confirm|Confirm if a specified variable is in place|Implemented|
|Is process visible||Pending|
|`numberProcessInstances`|`"Complete",` <br> `"InProgress",` <br> `"NotStarted",` <br> `"Created",` <br> `"Submitted"`|Implemented

## `numberProcessInstances`
```javascript
"prerequisites": [
    {
        "_id": "regLockedIfComplete",
        "_seq": 1,
        "check": {
            "numberProcessInstances": {
                "count": 0,
                "operator": "equalTo",
                "processId": "profileRegistration",
                "subProcessId": "spProfileRegistration",
                "type": "Completed"
            }
        },
        "message": {
            "i18n": {
                "_id": "",
                "en": "Only one instance of project registration can be created."
            }
        }
    }
],

```

Conditional lock of fields
Set based on calculation that looks for variable.  If variable changes, then fields are locked
[Common workflow errors](http://w.kwantu.net/display/CON/Common+workflow+errors)
