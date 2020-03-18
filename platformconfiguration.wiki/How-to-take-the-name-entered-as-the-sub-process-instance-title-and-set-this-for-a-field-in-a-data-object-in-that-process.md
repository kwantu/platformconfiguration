Created by Rob Worthington on Sep 29, 2017. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+take+the+name+entered+as+the+sub+process+instance+title+and+set+this+for+a+field+in+a+data+object+in+that+process) on 2018-12-17.

***

**Title** at the time of profile creation and **title** in `subprocess` creation are same 

```javascript
                                    {
                                        "_id": "form.create",
                                        "_seq": 1,
                                        "description": {
                                            "i18n": {
                                                "_id": "",
                                                "en": "test",
                                                "pt": "teste"
                                            }
                                        },
                                        "method": {
                                            "form": {
                                                "create": "fromDefinition"
                                            }
                                        },
                                        "setDraft": true,
                                        "setWorkflowLabelInField": "appProfile.Name",
                                        "setWorkflowLabelInTitle": true
                                    }
```
In the first step first action of this subprocess use `setWorkflowLabelInField` property to set supplied label in indicators field. Replace `appProfile` to indicator set id.

