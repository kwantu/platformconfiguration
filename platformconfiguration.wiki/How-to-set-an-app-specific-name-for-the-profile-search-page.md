[back](https://github.com/kwantu/platformconfiguration/wiki/Application-configuration-file)

## Profile search page configuration

The profile search page displays a list of profile instances for an app.  By default it uses the name 'Profile search'.  This article explains how to set a custom name for that page.

In the profileSettings section, find the tab object. Insert an object with the "id":"instances". This deals with the search page.

In the following code example, the "en":"Instances" tag can be replaced with "Projects", "Schools", Participants" or any other term that is relevant to the app's business purpose.  You may also add translations in other languages.

```json
"profileSettings": {
     "tab":[
             {
                "default": true,
                "label": {
                    "i18n": {
                        "en": "Instances"
                    }
                },
                "id": "instances"
            }
```