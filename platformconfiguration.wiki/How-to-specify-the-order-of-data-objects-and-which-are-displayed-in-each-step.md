Created by Rob Worthington on Jan 28, 2018. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+specify+the+order+of+data+objects+and+which+are+displayed+in+each+step) on 2018-12-17.

***

This example shows the code from the step section.  This **`"show"`** defines whether the data object is visible in that step or not.

### Code example 1.
```javascript
                                                {
                                                    "setId": "TACTraining",
                                                    "show": false,
                                                    "views": [
                                                        {
                                                            "label": {
                                                                "i18n": {
                                                                    "_id": "uuid",
                                                                    "en": "Edit"
                                                                }
                                                            },
                                                            "viewId": "edit"
                                                        }
                                                    ]
                                                }
```
This example shows the code from the sub process section.  In this the **`"seq"`** defines the order in which the data objects are displayed.

### Code example 2.

```javascript
                        {
                            "_id": "TACIssueReview",
                            "initiateData": "history",
                            "name": {
                                "i18n": {
                                    "_id": "uuid",
                                    "en": "Monthly issue review"
                                }
                            },
                            "seq": 0
                        }
