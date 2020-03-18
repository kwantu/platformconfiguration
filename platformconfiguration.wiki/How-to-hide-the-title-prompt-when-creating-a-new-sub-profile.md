When the user adds a new sub profile we have the option to either show a prompt to enter the sub profile name or to set a default value which we update later.

In the following code example we can set two parameters:

| Parameter | Options  | Example  |
|---|---|---|
| "defaultTitle":  | True or False  | "defaultTitle": true  |
| "title": | Any value  | "title": "test"  |


```
"categories": [
                {
                    "label": {
                        "en": "Scorecard cycles"
                    },
                    "id": "scorecard",
                    "create": {
					"defaultTitle": true,
					"title": "test",
                        "auto": {
                            "processId": "Scorecard",
                            "subProcessId": "spScorecard"
                        },
                        "maskLabel": {
                            "en": "Enter the cycle name"
                        },
                        "createProfile": true,
                        "style": "prominent",
                        "label": {
                            "en": "Start new scorecard cycle"
                        },
                        "okLabel": {
                            "en": "OK"
                        },
                        "cancelLabel": {
                            "en": "Cancel"
                        },
                        "subprofileLevel": false,
                        "profileLevel": true
                    },
                    "setId": "CAREplan"
                }
            ]
```