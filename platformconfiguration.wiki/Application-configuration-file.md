Created by Rob Worthington, last modified on Sep 17, 2018 copied from Kwantu Wiki on 2018-12-10.
 
There is a JSON [code example below](https://github.com/kwantu/platformconfiguration/wiki/Application-configuration-file/_edit#code-example). In order to understand it, it's worth knowing that `JSON` files contain `JSON objects` nested inside of `JSON objects` in an inverted hierarchical tree structure. The order in which `JSON objects` at the same nested level appear does not matter.

***

## Configuring an application

This page describes an app configuration file contents and how the contents configures an app.  The application config file defines attributes for each application. There are 16 JSON objects in the root of the configuration file. This page has grouped them into the following main sections:
* [General attributes which define the app uniquely](https://github.com/kwantu/platformconfiguration/wiki/Application-configuration-file#general-attributes)
* [Indicators which reference "data objects" in the Data Object Registry](https://github.com/kwantu/platformconfiguration/wiki/Application-configuration-file#list-of-data-objects)
* [Roles that users may have when using the app](https://github.com/kwantu/platformconfiguration/wiki/Application-configuration-file#roles-that-users-may-have-when-using-the-app)
* [Permissions which provide fine grained control over the user interface and the functionality available to each role](https://github.com/kwantu/platformconfiguration/wiki/Application-configuration-file#permissions-provide-fine-grained-control-over-access)
* [Apex, Profile and sub-profile level settings, which define: how profiles and sub-profiles are created, and the framework for the work flow at each of these levels, which defines the navigation within the app, and between these levels in the app](https://github.com/kwantu/platformconfiguration/wiki/Application-configuration-file#profile-settings-for-apex-profile-and-sub-profile-level-settings).

### General attributes

| # | Attribute | Description and effect in the app|
|--:| --------- | -------------------------------- |
|1.0| `_id` | The application ID is a unique identity assigned to the app. The app id is created in the **root community** when the developer creates an instance of a **new** app. Unit the app to do this is complete, it must be done manually by editing the root community profile. Example from code below: <br> `"_id": "applicationConfig_c5d4b0b9-2fc3-4259-96a5-95c8fb232f88:1",` |
|2.0| `_rev` | The application channel, which is used to tag any other config files associated with this app. In our example file below we see the entry: <br> `"_rev": "9-2560beb98c5b9575c6f93e7a60a2e9f8",`.|
|3.0| `migrationId` | It is always unique and changes every time a config file is released into production.  the migration Id is available immediately when the migration is done and it must be copied into the local version of the config file from the REST Services client. An example from the code below looks like this: <br> `"migrationId": "77d1885b-ac0b-440e-8754-5266a0071b83",`|
|4.0| `name` | This is a name for the app displayed in the app. An example from the code below looks like this: <br> `"name": "DESTEA Project Tracking",` |
|5.0| `applicationId` | This is a unique identifier of the app. An example from the code below looks like this: <br> `"applicationId": "fa8644f6-0aef-415c-9e84-1cd4902447e3",`
|6.0| `profileCreationLabel` | This is a label which will be displayed in the app on the button to create an new instance of a data object. An example from the code below looks like this:  <br> `"profileCreationLabel": "add new",` |
|7.0| `subscription` | An example from the code below looks like this: <br> `"subscription": "community"` |


### List of data objects
| # | Attribute | Description and effect in the app|
|--:| --------- | -------------------------------- |
|8.0| `indicators` | see as follows |

The application config file lists the indicators from the Data Object Registry that will be used in this app. In the app config file, the tag `indicators` is an array of data object references. Each "data object reference" in the array is a JSON object with 5 tags:
* setId : This is the unique reference to the data object in the Data Object Registry
* version : The data object version number that is included in this app
* cardinality: This may have the value of "single" or "multiple". If the data object cardinality is "single", then that data object may only be instantiated once per ("profile" or "sub-profile category") instance. This effect is that if the workflow edits the data object repeatedly, then only a single data object will result. If the data object cardinality is "multiple" then each new new workflow that updates the data object will create a new instance of that data object.
* name : This is a descriptive name for the data object, as as it will be known in this particular app. It may vary from app to app.
* desc : A description of the data object for reference purposes in the context of this particular app.

**Code example 1:**
```javascript
    "indicators": [
        {
            "name": "App Profile",
            "cardinality": "single",
            "desc": "App Profile",
            "version": "1",
            "setId": "appProfile"
        },
        {
            "name": "Course modules config",
            "cardinality": "multiple",
            "desc": "Course modules config",
            "version": "1",
            "setId": "NTIPConfigCourseModules"
        }
]
```
### Roles that users may have when using the app
| # | Attribute | Description and effect in the app|
|--:| --------- | -------------------------------- |
|16.0| `roles` | See below as follows |

Roles refers to the roles used in an app and levels of access of each role. They are the roles of the "community" that has adopted the app. The roles JSON object is an array of any number of JSON objects, each with 3 JSON objects nested inside of it:
* name : The name of the role which is a natural language string of characters.
* type : The role type, which can be "adoption" or <rob>.
* id : The role identifier which must be unique in this file, like "Projectcreator".

This is just a list of key-value pairs.

Code example 2:
```javascript
    "roles": [
        {
            "name": "Knowledge manager",
            "type": "adoption",
            "id": "Projectcreator"
        },
        {
            "name": "Capturer",
            "type": "instance",
            "id": "Capturer"
        },
        {
            "name": "National Administrator",
            "type": "adoption",
            "id": "Administrator"
        }
    ]
```

### Permissions provide fine grained control over access
| # | Attribute | Description and effect in the app|
|--:| --------- | -------------------------------- |
|9.0| `permissions` | See below |

Permissions for the app consist of one or more `modules`.  Inside of the `modules` JSON object, all the required "User Interface widgets" needed in the app are linked with permissions that determine which role can perform specific functionality. The following collapsed code reveals the structure:

**Code structure illustration A:**
```javascript
"permissions": {
    "module": "moduledescription",
        "elements": [{
            "widget": "widgetdescription",
            "actions": {
                "add": [
                     "Projectcreator",
                     "Administrator",
                      ... ,
                     "Role-N",
                 ],
                 "view": [
                      "*"
                 ],
                 "delete": [
                     "Projectcreator",
                     "Administrator",
                      ... ,
                     "Role-N",
                 ]
            }
        },{...}...],
    "module": "description" {...},
    "module": "description" {...},
     ... ,
    "module": "description" {...}]
}
```
Notice in the `view` action above that the list of roles are represented by **"*"** which means "all roles".

The `permissions` JSON object contains the following possible list of `module` JSON objects:

**Available modules**
Each `module` is nested inside of the `permissions` JSON object and is paired with an 'array JSON object' called `elements`. The 7 possible modules are as follows:
* `"module": "Profile",`
* `"module": "Application",`
* `"module": "System",`
* `"module": "Workflow",`
* `"module": "Indicator",`
* `"module": "Linkages",`
* `"module": "Subprofile",` <br> **Note** that the list above is the complete list of possible modules. <rob> ?

**elements** <br> 
A list of **user interface widgets** . The `elements` JSON array object occurs once inside each `module` JSON object. The `elements` JSON array object is an array  between square brackets `[{...},{...},...]`.  Nested inside of the `elements` JSON array object are the list of **user interface widget**s. Widget array entries appear inside of curly braces like `{...},` and consist of pairs of JSON objects, as follows: 
1. A simple JSON object, for example: `"list": "Instances"` identifying the **user interface Widget** to be instantiated; and 
1. Another JSON object called `"actions": {...}`, defining what the Widget can do, as can be seen in Code example 4 below.  
Notice that this pair of JSON objects is not in any specific order, nor do they need to be, though sticking to a convention makes it easier to read, understand, debug and maintain.

The **UI Widget** JSON object has an appropriate user defined  `"description"` in quotes and it may only be one of the following list of possible widgets:
* **page**           is a ... <rob> ... and does ...
* **process**        is a ... <rob> ... and does ...
* **box**            is a ... <rob> ... and does ...
* **indicator**      is a ... <rob> ... and does ...
* **menu**           is a ... <rob> ... and does ...
* **list**           is a ... <rob> ... and does ...
* **...**            is a ... <rob> ... and does ...

The  `"actions": {...}` JSON object is mandatory for each pair forming the array element. The name of the module determines what must be inside the `"actions": {...}` JSON object. For this reason the convention is to precede the `"actions": {` with the widget entry, which for example looks like this `"list": "Instances"`.

Users are assigned roles that govern what permissions are granted in the actions JSON object.  The purpose of this section is to specify which of the following list of possible `"actions"` will be included for each widget.  The absence of any implies that, the missing "verbs" are not available in the widget:
* `"add": [...]`
* `"view": [...]`
* `"delete": [...]`
* `"modify": [...]` <rob> ?
Notice that each of the `"actions"` is followed immediately by a JSON array of **user roles**, which indicates which roles may perform the action.  A user who does not have the role may not perform the action and therefore will not even see the widget on the screen. See code example 3 and Code example 4 as follows:

**Code example 3:**
```javascript
[
    "Projectcreator",
    "Administrator"
]
```

**Code example 4:**
```javascript
    "permissions": [
        {
            "module": "Profile",
            "elements": [
                {
                    "page": "ProfileDetails",
                    "actions": {
                        "add": [
                            "Projectcreator",
                            "Administrator"
                        ],
                        "view": [
                            "*"
                        ],
                        "delete": [
                            "Projectcreator",
                            "Administrator"
                        ]
                    }
                },
                {
                    "list": "Instances",
                    "actions": {
                        "add": [
                            "Projectcreator",
                            "Administrator"
                        ],
                        "view": [
                            "*"
                        ],
                        "delete": [
                            "Administrator",
                            "Projectcreator"
                        ]
                    }
                },
                {
                    "box": "GeneralDetails",
                    "actions": {
                        "view": [
                            "*"
                        ]
                    }
                },
                {
                    "box": "MemberDetails",
                    "actions": {
                        "add": [
                            "Administrator",
                            "Projectcreator",
                            "Capturer"
                        ],
                        "view": [
                            "*"
                        ],
                        "delete": [
                            "Administrator",
                            "Projectcreator",
                            "Capturer"
                        ]
                    }
                },
                {
                    "box": "Instruction",
                    "actions": {
                        "add": [
                            "Projectcreator"
                        ],
                        "view": [
                            "Projectauthoriser",
                            "Authoriser",
                            "Capturer",
                            "Projectcreator",
                            "Monitor"
                        ]
                    }
                },
                {
                    "box": "Linkages",
                    "actions": {
                        "view": [
                            "Projectauthoriser",
                            "Authoriser",
                            "Capturer",
                            "Projectcreator",
                            "Monitor"
                        ]
                    }
                }
            ]
        },
        {
            "module": "Application",
            "elements": [
                {
                    "box": "MemberDetails",
                    "actions": {
                        "add": [
                            "Administrator",
                            "Projectcreator"
                        ],
                        "view": [
                            "Projectcreator",
                            "Projectauthoriser",
                            "Administrator",
                            "Monitor"
                        ],
                        "delete": [
                            "Administrator",
                            "Projectcreator"
                        ]
                    }
                }
            ]
        },
        {
            "module": "System",
            "elements": [
                {
                    "actions": {
                        "view": [
                        ]
                    },
                    "menu": "Settings"
                },
                {
                    "actions": {
                        "view": [
                        ]
                    },
                    "menu": "CommunityRoles"
                }
            ]
        },
        {
            "module": "Workflow",
            "elements": [
                {
                    "page": "WorkflowDetails",
                    "actions": {
                        "view": [
                            "*"
                        ]
                    }
                },
                {
                    "process": "KMcreateUserlist",
                    "actions": {
                        "add": [
                            "Owner",
                            "Projectcreator",
                            "Administrator"
                        ],
                        "view": [
                            "*"
                        ],
                        "edit": [
                            "Projectcreator"
                        ]
                    }
                },
                {
                    "process": "spProfileRegistration",
                    "actions": {
                        "add": [
                            "Owner",
                            "Projectcreator",
                            "Administrator"
                        ],
                        "view": [
                            "*"
                        ],
                        "edit": [
                        ]
                    }
                },
                {
                    "process": "spDocCategory",
                    "actions": {
                        "add": [
                            "Capturer",
                            "Projectcreator"
                        ],
                        "view": [
                            "*"
                        ],
                        "edit": [
                            "Projectcreator",
                            "Capturer"
                        ],
                        "delete": [
                            "Projectcreator"
                        ]
                    }
                },
                {
                    "box": "reassign",
                    "actions": {
                        "view": [
                            "Administrator",
                            "Projectcreator"
                        ]
                    }
                }
            ]
        },
        {
            "module": "Indicator",
            "elements": [
                {
                    "page": "Registry",
                    "actions": {
                        "view": [
                            "*"
                        ]
                    }
                },
                {
                    "indicator": "*",
                    "actions": {
                        "add": [
                        ],
                        "view": [
                            "*"
                        ],
                        "edit": [
                        ]
                    }
                },
                {
                    "indicator": "appProfile",
                    "actions": {
                        "view": [
                        ],
                        "edit": [
                        ]
                    }
                }
            ]
        },
        {
            "module": "Linkages",
            "elements": [
                {
                    "page": "ProfileLinkages",
                    "actions": {
                        "view": [
                            "*"
                        ]
                    }
                },
                {
                    "box": "Linkages",
                    "actions": {
                        "add": [
                            "Owner",
                            "Authoriser",
                            "Capturer",
                            "Projectcreator",
                            "Projectauthoriser",
                            "Monitor"
                        ],
                        "view": [
                            "*"
                        ]
                    }
                }
            ]
        }
    ],
```

### Profile Settings for Apex, Profile and sub-profile level settings
| # | Attribute | Description and effect in the app|
|--:| --------- | -------------------------------- |
|10.0| `profileSettings` | see below as follows |

**_Key Concept for apps_** There are three(3) "_levels_" at which "profiles" can exist, which are listed in descending order of superiority from top to bottom as follows:
1. community level;
2. individual level; and
3. sub-profile level.

Profile Settings is a JSON object which contains 5 JSON objects to manage the application navigation as in the example below.

**Code structure illustration B:**
```javascript
"profileSettings": {
    "apex": {...},
    "profile": {...},
    "subprofiles": {...},
    "listWorkflows": [{...},{...}...],
    "tab":[{...},{...}...]
}
```
**Apex**<br>
When a community adopts an existing app, the system (automatically and by default) creates a "community level" **adoption profile**, which is the "root level" and at a higher level than the level of **individual profiles** in the app. An example would be a workflow to manage a "global list of items" that apply to the application as a whole. The 'apex' therefore refers to the 'top level' of the application within a community. If any 'apex level work flows' or 'apex level sub-profile categories' are required, they are specified in the apex tag. (**Note**, if `apex level sub-profile categories` are defined, then `apex level workflows` cannot be defined directly.)
 
The apex setting has two possible tags:
* available: true or false. If true, then the apex level in app is exposed to the user; and
* subprofiles: true or false. If true, then the apex level in app is exposed through sub-profile categories, else via work flows

**Profile**<br>
Profiles are the basic containers for work flow and data object instances in an app. They are created by users in the process of using an app, according to the specifications given in the `profile` tag. The profile JSON object has a number of attributes that manage the profile creation interface. 
* profileCreationLabel :  This JSON object ... <rob>
* createProfile: true, or false,
* defaultTitle: false, or true
* style: "prominent" or "standard",
* okLabel: `{ "en": "OK" }`, This is natural language to be displayed asking the user if they are happy to proceed with their input. It consists of a two character language identifier and the text to be displayed and there can be an entry for every language between the brackets separated by commas.
* cancelLabel: `{ "en": "Cancel" }`,  This is natural language to be displayed asking the user if they are happy to proceed with their input. It consists of a two character language identifier and the text to be displayed and there can be an entry for every language between the brackets separated by commas.

Adoption profiles exist in the `apex` level. An example from the code below looks like this:  <br> `"profile": {` 
* `subprofiles` : A subprofile is a category of possibilities, like for example: _a locality category with a list of locations in it_. A profile category can have its own workflows associated with it. Inside the subprofile category is a workflow category, which is a single workflow which forms the third layer of depth in the hierarchy of profile; subprofile and workflow-category. An example from the code below looks like this:  <br> `"subprofiles": {` <br> <br> subprofiles have 2 objects nested within them. They are: <br> `"available": true` <br> `"categories": [`
* `categories` : Categories is a JSON array of five(5) JSON objects, surrounded by `[` `]` square brackets inside of the `subprofile` JSON object. Those objects are as follows: <br> `"label": {...}` _A natural language button lable_ <br> `"okLabel": {` _a natural language button instruction_ <br> `"cancelLabel": {...}` _A natural language button description_ <br> `"subprofileLevel": true,` _Indicates whether this `category` is at the sub profile level or not_ <br> `"profileLevel": true` _Indicates whether this `category` is at the profile level or not_ <br> An example from the code below looks like this: <br>  `"categories": [...]`
* `tab` : A `tab` is a JSON array of single JSON objects, each containing the following three JSON objects: <br> `"default"` which can be `true` or `false`<br> `"label`" which has a JSON object called `"i18n"` and language entries for each language of the user community <br> `"id"` which is a unique word in the config file. <br> See example as follows: 

**Code example 5:**
```javascript
    "profileSettings": {
      "listWorkflows": [
            {
                "label": "Assessments",
                "processId": "KnowledgeModuleUnitWF",
                "subprocessId": "spKnowledgeModuleUnitWF",
                "type": "subprofile",
                "category": "Modules"
            }
        ],
     "apex": {
            "available": true,
            "subprofiles": true
        },
        "profile": {
            "profileCreationLabel": "Add knowledge management profile",
            "createProfile": true
        },
        "subprofiles": {
            "available": true,
            "categories": [
                {
                    "label": {
                        "en": "Add a new knowledge management profile"
                    },
                    "id": "profileRegistration",
                    "create": {
                        "maskLabel": {
                            "en": "Please add knowledge management profile"
                        },
                        "createProfile": true,
                        "label": {
                            "en": "Add knowledge management profile"
                        },
                        "okLabel": {
                            "en": "OK"
                        },
                        "cancelLabel": {
                            "en": "Cancel"
                        },
                        "subprofileLevel": true,
                        "profileLevel": true
                    },
                    "setId": "appProfile"
                },
                {
                    "label": {
                        "en": "Create user list"
                    },
                    "type": "adoption",
                    "id": "KMcreateUserlist",
                    "create": {
                        "maskLabel": {
                            "en": "Please create a user distribution list"
                        },
                        "createProfile": true,
                        "label": {
                            "en": "Add a distribution list"
                        },
                        "okLabel": {
                            "en": "OK"
                        },
                        "cancelLabel": {
                            "en": "Cancel"
                        },
                        "subprofileLevel": true,
                        "profileLevel": true
                    },
                    "setId": "SDOuserList"
                }
            ]
        },
        "tab": [
            {
                "default": true,
                "label": {
                    "i18n": {
                        "en": "Roles"
                    }
                },
                "id": "details"
            },
            {
                "default": false,
                "label": {
                    "i18n": {
                        "en": "Workflow"
                    }
                },
                "id": "processes"
            },
            {
                "default": false,
                "label": {
                    "i18n": {
                        "en": "Data"
                    }
                },
                "id": "data"
            },
            {
                "default": true,
                "label": {
                    "i18n": {
                        "en": "Instances"
                    }
                },
                "id": "instances"
            }
        ]
    },
```
### Types of pages under the "Tab" list

| # | Tab id | Description and effect in the app|
|--:| --------- | -------------------------------- |
|1| `details` | [Profile details page](https://github.com/kwantu/platformconfiguration/wiki/How-to-set-an-app-specific-name-for-the-profile-details-page) |
|2| `processes` | [Profile processes or workflow page](https://github.com/kwantu/platformconfiguration/wiki/How-to-set-an-app-specific-name-for-the-processes-page) |
|3| `data` | [Profile data page](https://github.com/kwantu/platformconfiguration/wiki/How-to-set-an-app-specific-name-for-the-profile-data-page) |
|4| `instances` | [Search page](https://github.com/kwantu/platformconfiguration/wiki/How-to-set-an-app-specific-name-for-the-profile-search-page) |



[How to set a different name for the search page for an app](https://github.com/kwantu/platformconfiguration/wiki/appConfig/How-to-set-an-app-specific-name-for-the-profile-search-page)


| # | Attribute | Description and effect in the app|
|--:| --------- | -------------------------------- |
|11.0| `childApps` | Other apps which will be linked to this one. The parent app links to the child apps via a JSON array of `app id`s, like the one at the top of this list numbered _1.0_, all listed beneath each other and comma separated.|
|12.0| `taxonomies` | These are the `taxonomies` used in the app, their IDs and UUIDs, linked via a comma separated JSON array. |
|13.0| `channels` | The revision number, which is used to differentiate this file from any other version of this file. An example from the code below looks like this: <br>  `    "channels": [` <br> `        "config_a_fa8644f6-0aef-415c-9e84-1cd4902447e3"` <br> `    ],`|
|14.0| `version` | The version of this app, which increments every time new functionality is completed and is ready to be released. An example from the code below looks like this: <br>  `"version": "2",` |
|15.0| `languages` | Languages in which the app is available. An example looks like this: <br>  `"languages": [ <rob> ],` |

***

# How to questions

* [How to automatically start the workflow when the user clicks the profile creation button](https://github.com/kwantu/platformconfiguration/wiki/How-to-automatically-start-the-workflow-when-the-user-clicks-the-profile-creation-button)

* [How to update the adoption profile title](https://github.com/kwantu/platformconfiguration/wiki/How-to-update-the-adoption-profile-title)

* [How to configure the name of the "profile search" page](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-the-name-of-the-profile-search-page)