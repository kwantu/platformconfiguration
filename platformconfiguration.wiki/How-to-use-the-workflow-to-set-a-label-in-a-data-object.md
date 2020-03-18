Created by Rob Worthington on Oct 10, 2017. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+use+the+workflow+to+set+a+label+in+a+data+object) on 2018-12-18.

***

The _workflow_ can be used to set a _value_ in a _field_ on a _data object_.  This may be useful if to set a _label_ for a specific _value_. For example: if a form is shared across different apps, the need may be to use the workflow to enter the app name, so as to make clear which app the form is used in.

To do this, place the following block in the actions for step one of the workflow.

Change the following parameters:
* `datatype` - specify string or integer
* `data` - specify the value you wish to set
* `path` - enter the set ID and then the element ID for the field you wish to populate.  This must be a data object in that workflow process.


Example 1:
```javascript
                                    {
                                        "_id": "getNodeValue",
                                        "_seq": 2,
                                        "description": {
                                            "i18n": {
                                                "_id": "uuid",
                                                "en": "This shows the example of getNodeValue with value fetch function."
                                            }
                                        },
                                        "method": {
                                            "indicator": {
                                                "setValue": {
                                                    "data": {
                                                        "value": {
                                                            "datatype": "string",
                                                            "data": "Endline"
                                                        }
                                                    },
                                                    "path": "kusumaSSRPReportBaselineAndEndline.type"
                                                }
                                            }
                                        }
                                    }
```