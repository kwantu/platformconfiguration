Created by Rob Worthington on Aug 03, 2017. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+configure+a+periodic+workflow) on 2018-12-13.

## Introduction

Workflow processes may have one of three types.  Adhoc, periodic or cover page.  Periodic workflows are processes that repeat according to a specific frequency.  This may be monthly, quarterly or annually.  Periodic workflows will create a new sequence of both the sub process instance and the data object instance for each period.  This is useful if you need to monitor a project each month.

## Configuring a periodic workflow

Following is an example periodic workflow:

```javaScript
                    "periodType": {
                        "periodic": {
                            "duration": {
                                "periods": 999
                            },
                            "firstDate": {
                                "user": {
                                    "_label": {
                                        "i18n": {
                                            "_id": "XXX",
                                            "en": "First date"
                                        }
                                    },
                                    "_show": true,
                                    "_type": "userSelected",
                                    "default": "today",
                                    "message": {
                                        "i18n": {
                                            "_id": "XXX",
                                            "en": "This is start date of period"
                                        }
                                    }
                                }
                            },
                            "frequency": {
                                "static": "month"
                            }
                        }
                    },
```

To add this replace the 'ad hoc' periodType with the code below.  This code has the following parameters:

| Parameter        | Explanation           | Options  |
| ------------- |:-------------:| -----:|
| Duration | This determines how many periods the workflow may continue for. | Enter a number between 1 and 999 |
| First date | This determines how the valid date for the first period is set.  Currently only one option is available - user defined. | userSelected |
| Frequency | This determines the type of period.  | month, quarter or year |

The duration and frequency are combined to determine how long the workflow will continue for.  Once the number of workflow sequences is equal to the duration the workflow will not allow the user to create a new sequence.

Once you've defined the periodic section you must then set a couple of other parameters.  These are:

```"isEditable": false,```

This value must be set to false.  This will prevent users from editing an existing sequence.

```"initiate": {
"user": {
"create": {
"i18n": {
"_id": "uuid",
"en": "Capture monthly progress"
```

The label for the 'create' action should be set to something meaningful for both initiating the first period and for starting the next period.  The same button will show each time.

```"maxInstances": 999,```

This value must be set to how many periods you defined in the periodic section.  This element determines how many times the button to start a new period will show.  If you set it to 1, then the button will appear only for the first period, after which it wont be visible.
