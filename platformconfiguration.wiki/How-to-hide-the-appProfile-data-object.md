Created by Rob Worthington on Oct 11, 2017. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+hide+the+appProfile+data+object) on 2018-12-12.

# How to hide the appProfile Data Object

As per the following example, enter a new block that specifies the `appProfile` DO (data object), but does not reference any role for edit or view.

```JASON
{
            "elements": [
                {
                    "actions": {
                        "view": [
                            "Owner",
                            "Authoriser",
                            "Capturer"
                        ]
                    },
                    "page": "Registry"
                },
                {
                    "actions": {
                        "edit": [
                        ],
                        "view": [
                            "All"
                        ]
                    },
                    "indicator": "*"
                },
                {
                    "actions": {
                        "edit": [],
                        "view": []
                    },
                    "indicator": "appProfile"
                }
            ],
            "module": "Indicator"
        },
```