Created by Rob Worthington, last modified on Aug 11, 2017. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+set+the+title+for+a+sub+process+instance) on 2018-12-17.

***

### Introduction
When you create a sub process instance it must be given a title.  You can either configure the process such that the title is assigned by a user, on creation of the instance.  Or you can configure it such that a default title is assigned.  It is also possible to set a workflow action that will update the sub process instance title based on one or more fields in a data object in the workflow.  This allows you to set a default title initially, but then update this once the workflow is completed with something more meaningful.

![How to set the title for a sub process instance](https://github.com/kwantu/platformconfiguration/blob/master/How%20to%20set%20the%20title%20for%20a%20sub%20process%20instance.png)

**Screenshot - The sub process instance title here is set to Bloemfontein**

### Configuring how the initial title is set

The following part of the workflow is used to set the initial title.  Key variables to note are:

* **`"_show"`** - True means the user is prompted to enter a title, False means they are not
* **`"en": "Project location"`** - In this example the default title set will be 'Project location'.  You may add translations for other languages

```javascript
"instanceTitle": {
    "_label": "Title",
    "_show": false,
    "message": {
        "i18n": {
            "_id": "uuid",
            "en": "Project location"
        }
    }
},
```

### Configuring how the title is updated
You may also use workflow to update the title based on a variable in a data object in the workflow.  This enables you to update a default title with a more meaningful one once the user has completed the workflow.

**Action to set sub process instance title:**

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
The example above shows a range of parameters you may use.  These include:

* `elementProperty` - Any property of a indicator within that subprocess
* `constantValue` - Any constant/fixed value
* `elementWrapper` - Any value that needs to be fetched from the indicator wrapper
* `currentDate` - Current date
* `randomDigit`s - Any random digit. You can configure the length of the digits used.
* `profileObjectElement` - Any element value from the profile indicator for example use profile name in any other subprocess title
* `profileObjectWrapper` - Any wrapper value from profile indicator
The separator element at the end is used to specify how multiple parameters will be separated.

Make sure to add this action after the authorise action as these actions will operate on the approved element fields, which will not be populated until the data object is approved.

You may also add this action to any of the postactions in any of the user assigned steps in the workflow.



