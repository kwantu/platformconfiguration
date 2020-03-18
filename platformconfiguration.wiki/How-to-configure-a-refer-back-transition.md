Created by Rob Worthington, last modified on Jul 24, 2018. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+configure+a+refer+back+transition) on 2018-12-13.

"Refer back transitions" are used when the authoriser needs to refer a workflow back to the capturer.  In this case it is important that the authoriser can do this without having to edit the form first.

In this case we can add the following to the transition:

|Code example|
|------------|
|1 `"showAlways": true,`|

Following is an example of this:

Code example:
```javascript
                            "transition": [
                                {
                                    "name": {
                                        "i18n": {
                                            "en": "Approve",
                                            "_id": "uuid"
                                        },
                                        "style": "prominent"
                                    },
                                    "transitionAction": {
                                        "goToStepId": {
                                            "stepId": "completion",
                                            "type": ""
                                        }
                                    },
                                    "_id": "approve"
                                },
                                {
                                    "name": {
                                        "i18n": {
                                            "en": "Refer back",
                                            "_id": "uuid"
                                        }
                                    },
                                    "transitionAction": {
                                        "goToStepId": {
                                            "stepId": "captureForm",
                                            "type": ""
                                        }
                                    },
                                    "showAlways": true,
                                    "_id": "referback"
                                }
                            ],
```
# Caution!
```
Do not use this with "cover page workflow", as
this type of workflow authorises and creates a new sequence. 
This "refer back" will result in a conflict, as it allows the 
workflow refer back, while the DO (data object) does not have 
the updated status.
```

