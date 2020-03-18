This action instantiates the data objects in the workflow sub process instance. If you have more than one data object in subprocess then all are instantiated.

Following is an example of the code for this action:

```
{
    "_id": "form.create",
    "_seq": 1,
    "description": {
        "i18n": {
            "_id": "uuid",
            "en": "Description of action"
        }
    },
    "method": {
        "form": {
            "create": "indicatorConfig"
        }
    },
    "setDraft": true,
    "setWorkflowLabelInField": "appProfile.Name",
    "setWorkflowLabelInTitle": true
}
```
This includes the following parameters.

| Parameter        | Explanation           | Options  |
| ------------- |:-------------:| -----:|
| method | The main option used is indicatorConfig . The other options are only used in the performance app. | indicatorConfig, performanceKey, performancePeriod or auditKey |
| setDraft | New instances of a data object are set to a draft status. | true or false |
| setWorkflowLabelInField | Takes the title given for the workflow sub process instance and uses it to set a value in a field | Data object set ID and element ID |
| setWorkflowLabelInTitle | Takes the title given for the workflow sub process instance and uses it to set the title of a data object instance | true or false |

# Schema

```
"create": {
    "description": "Performance elements to be removed with refactoring. For each indicator do the following: 1. If you have dato object uuid, then it will not create a new object, but use the uuid. If you don't have a data object uuid. Then it will look into the appConfig - cardinality. If cardinality = 1, then it will look into the registry for a data object of that type. If finds, it uses and returns to the subprocess. If not find then creates and returns the uuid and updates registry. Then it takes the sequence and increments the sequence, and returns the sequence for storing in the subprocess instance where indicator period type=adhoc. It does one more check for adhoc, validDate must be greater than last. If the periodType = periodic, then it applies a further rule that the valid date must be exactly the same as the previous valid date plus the period type. If the type is cover-page--- then it will never increment the sequence, and will always create uuid. This will then call the default data initialisation function to access the definition file and instantiate the data itself.",
    "type": "string",
    "enum": [
        "indicatorConfig",
        "performanceKey",
        "performancePeriod",
        "auditKey"
    ]
}
```