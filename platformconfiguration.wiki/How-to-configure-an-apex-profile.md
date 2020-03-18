Created by Rob Worthington on Oct 11, 2017. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+hide+the+appProfile+data+object) on 2018-12-12.

An apex profile (or adoption profile) exists at the app level.  We can use this to separate out workflow that should apply across all profiles.

This is configured in two places:

## 1. App config file

In the following example, you can change the following variables:

* 'Add citation' - label for creation of workflow in apex profile
* "available": true - turns on the apex profile
* "Citations" - Label for profile page

```JASON
"profileCreationLabel": "Add citation",
    "profileSettings": {
        "apex": {
            "available": true,
            "label": {
                "i18n": {
                    "_id": "uuid",
                    "en": "Citations"
                }
            }
        },
        "profile": {
            "createProfile": true,
            "profileCreationLabel": "Add publication"
        },
        "subprofiles": {
            "available": false,
            "label": {
                "i18n": {
                    "_id": "uuid",
                    "en": "English"
                }
            }
        },
        "tab": [
            {
                "default": true,
                "id": "details",
                "label": {
                    "i18n": {
                        "en": "Roles"
                    }
                }
            },
            {
                "default": false,
                "id": "processes",
                "label": {
                    "i18n": {
                        "en": "Publication workflow"
                    }
                }
            },
            {
                "default": false,
                "id": "data",
                "label": {
                    "i18n": {
                        "en": "Data"
                    }
                }
            }
        ]
    },
```

## 2. Workflow config file
In the workflow process (or processes) that should go into the apex, set the type to be _adoption_.

For example:

`"type": "adoption",`

