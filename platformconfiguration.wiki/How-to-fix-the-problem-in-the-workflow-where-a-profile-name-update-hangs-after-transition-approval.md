Created by Rob Worthington on Sep 18, 2017. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+fix+problem+where+workflow+to+update+a+profile+name+hangs+when+you+make+approve+transition) on 2018-12-17.

Page renamed from: _How to fix problem where workflow to update a profile name hangs when you make approve transition_

***

This problem is caused by an action in the first step of the workflow to update the profile name and details.  In the example below, remove the following line:


**`"setWorkflowLabelInField": "appProfile.Name"`**

from the code sequence below:
```javascript
                                    {
                                        "_id": "form.create",
                                        "_seq": 1,
                                        "description": {
                                            "i18n": {
                                                "_id": "uuid",
                                                "en": "test",
                                                "pt": "teste"
                                            }
                                        },
                                        "method": {
                                            "form": {
                                                "create": "indicatorConfig"
                                            }
                                        },
                                        "setWorkflowLabelInField": "appProfile.Name"
                                    }
```