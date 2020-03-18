Created by Rob Worthington, last modified on Sep 06, 2018. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+configure+sub+profile+categories) on 2018-12-17.

***

Sub-profile categories provide a way to group workflow processes together.  As with the screenshot below, a category name is shown for each sub process.  Each category may then be associated with one or more workflow processes.  A workflow process may be associated with only a specific category or shown on all categories (as happens with the performance app).

![How to configure sub profile categories mini](https://github.com/kwantu/platformconfiguration/blob/master/How%20to%20configure%20sub%20profile%20categories%20mini.PNG)[Zoom](https://github.com/kwantu/platformconfiguration/blob/master/How%20to%20configure%20sub%20profile%20categories.png)

Sub-profile categories are configured in the app config and workflow config files.

### 1. App config
Following is an example of the config used in the app config file.  The array may be repeated for additional categories.  The variables associated with each category are as follows:

|Variable|Function|Options|
|--------|--------|-------|
|`Available`	|Is the category shown or not?|`true` <br> `false`|
|`Label`	|This is the label for the sub profile category	Text|
|`Type`	|This defines the level at which the sub profile category is shown. If you choose adoption, then the left navigation will show the sub profile category for the apex (or adoption) profile. If instance, then it will show this within the context of a profile. If `subprofile` it will show it within the context of a `subprofile`|`adoption` <br> `instance` <br> `subprofile`|
|`id`	|This is a unique ID that is used to tie this to the workflow and permissions. Use camelcase	|`camelCase`|
|`maskLabel`	|If you allow creation of new category instances, this is the mask label for the creation	|`Text`|
|`createProfile`	|Determines if you may create an instance of this category or not|`true` <br> `false`|
|`label`	|The prompt for creating a new instance	|`Text`|
|`okLabel`	|The label for the confirmation button	|`Text`|
|`cancelLabel`	|The label for the cancel button	|`Text`|
|`subprofileLevel`	|Determines if you can create a sub profile of a sub profile	|`true` <br> `false`|
|`profileLevel`	|Determines if you can create a sub profile of a profile	|`true` <br> `false`|
|`setId`	|The set ID for the data object associated with the category instance	|A valid _set ID_|

### Example of app config file

```javascript
        "subprofiles": {
            "available": true,
            "categories": [
                {
                    "label": {
                        "en": "Course set up"
                    },
                    "type": "adoption",
                    "id": "indicatorCategories",
                    "create": {
                        "maskLabel": {
                            "en": "Add course folder"
                        },
                        "auto": {
                            "subProcessId": "spProgramme",
                            "processId": "programmes"
                        },
                        "createProfile": true,
                        "label": {
                            "en": "Enter the folder name"
                        },
                        "okLabel": {
                            "en": "OK"
                        },
                        "cancelLabel": {
                            "en": "Cancel"
                        },
                        "subprofileLevel": false,
                        "profileLevel": true // create a sub profile inside a profile
                    },
                    "setId": ""
                }
            ]
        },
```

### 2. Workflow config

Following is an example of the workflow config file.  Each process linked to a specific category must be updated accordingly.


|Variable|Function|Options|
|--------|--------|-------|
|`"type": "subprofile"`	|This specifiies that the process is a subprofile process|`adoption` <br> `instance` <br> `subprofile`|
|`"category": "symposia"`	|Replace `"symposia"` with the ID specified in the app config file	|
