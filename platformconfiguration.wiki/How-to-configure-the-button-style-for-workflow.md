Created by Rob Worthington on Jul 03, 2018. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+configure+the+button+style+for+workflow) on 2018-12-17.

***

Any button in the workflow may be configured to display using a normal or prominent style.  As per the screenshot below, the normal style is in white and the prominent style in red.

![How to configure the button style for workflow](https://github.com/kwantu/platformconfiguration/blob/master/How%20to%20configure%20the%20button%20style%20for%20workflow.png)

A new style tag is used to select the styling - **`"style": "prominent"`**

The options that can be used here are `"prominent"` or `"normal"`

Following is an example showing how this is placed in the workflow configuration.

### Code example  

```javascript
                            "transition": [
                                {
                                    "name": {
                                        "i18n": {
                                            "pt": "enviar",
                                            "en": "Submit",
                                            "_id": ""
                                        },
                                        "style": "prominent"
                                    },
                                    "transitionAction": {
                                        "goToStepId": {
                                            "stepId": "sendToAffadavit",
                                            "type": ""
                                        }
                                    },
                                    "_id": "captureFormSubmit"
                                }
                            ],
```
The tag must be placed immediately after the array in which the button name is defined.

