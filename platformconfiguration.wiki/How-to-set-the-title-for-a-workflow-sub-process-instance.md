# Introduction

When a workflow sub process instance is instantiated it must be given a title.  There are two options for how this title is set:

* The user is prompted to enter a title when the workflow is started
* The workflow can set a default title, which can then be updated

In cases where a default title is set, the workflow may then update that title based on a value entered in a data object.  This enables the workflow title to be set based on a value (or values) entered in a data object.

![Workflow sub process instance title](https://github.com/kwantu/platformconfiguration/blob/master/Workflow%20sub%20process%20instance%20title.png)

## Prompting the user to enter a title for the workflow

Each workflow process has an instanceTitle block where the behaviour for instantiation is defined.  Please see the example below:

```javascript
"instanceTitle": {
    "message": {
        "i18n": {
            "pt": "Digite o nome do perfil do distrito",
            "en": "Please enter the name for the district profile",
            "_id": "uuid"
        }
    },
    "_label": "Title",
    "_show": false
},
```

This example has the following parameters.

| Parameter        | Explanation           | Possible values  |
| ------------- |:-------------:| -----:|
| message      | A message shown to the user prompting them to enter a name for the workflow.  This may be entered in one or more languages. | "en": "Prompt text for user goes here" |
| _show     | Determines if the prompt to enter a title is shown or not.      | true or false |

## Configuring how the title is updated

You may also use workflow to update the title based on a variable in a data object in the workflow.  This enables you to update a default title with a more meaningful one once the user has completed the workflow.

The following code example is added as a pre or post action in a workflow step.  This step must be after the step in which the user enters the values in a data object that will be used to set the title.  The action must also be after the data is authorised using the _formAuthoriseAction_.

```javascript	
{
    "_id": "spTitle",
    "_seq": 2,
    "description": {
        "i18n": {
            "_id": "",
            "en": "test"
        }
    },
    "method": {
        "subProcessInstance": {
            "setTitle": {
                "calculated": {
                    "elements": [
                        {
                            "elementProperty": {
                                "elementId": "Farms",
                                "indicatorSetId": "drldrlandacquisitionform"
                            }
                        },
                        {
                            "constantValue": {
                                "value": "ID"
                            }
                        },
                        {
                            "elementWrapper": {
                                "elementId": "category.term",
                                "indicatorSetId": "drldrlandacquisitionform"
                            }
                        },
                        {
                            "currentDate": {
                                "today": ""
                            }
                        },
                        {
                            "randomDigits": {
                                "digits": 5
                            }
                        },
                        {
                            "profileObjectElement": {
                                "elementId": "Name",
                                "indicatorSetId": "appProfile"
                            }
                        },
                        {
                            "profileObjectWrapper": {
                                "indicatorSetId": "appProfile",
                                "wrapperElementId": "source"
                            }
                        }
                    ],
                    "separator": "-"
                }
            }
        }
    }
}
```

The example above shows a range of options you may use.  These include:

* elementProperty - Any property of a data object within that workflow subprocess
* constantValue - Any constant/fixed value that you specify
* elementWrapper - Any value that needs to be fetched from the data object envelope
* currentDate - Current date
* randomDigits - Any random digit. You can configure the length of the digits used.
* profileObjectElement - Any element value from the profile data object for example use profile name in any other subprocess title
* profileObjectWrapper - Any wrapper value from profile data object

The example above includes all potential options.  Include only those you wish to use.  The "separator" tag is used to denote the separator between different options.  The order in which you define them is the order in which they are displayed.

The table below explains which parameters are available.

| Parameter        | Explanation           | Possible values  |
| ------------- |:-------------:| -----:|
| elementId      | The field in a data object that contains the value you wish to use. | Any element ID from a data object |
| indicatorSetId | The data object that contains the value you wish to use. | Any data object ID |
| value | A fixed value specified by you | Any string |
| currentDate | The current date | today |
| digits | A number between one and ten digits | Number |
| randomDigits | Any random digit. You can configure the length of the digits used |  |
| wrapperElementId | The appProfile data object is only used in workflows associated with profile creation.  In this example you can reference any field in the envelope | See this page for options |
| profileObjectWrapper | The appProfile data object is only used in workflows associated with profile creation.  In this example you can reference any field in the data model | See this page for options |