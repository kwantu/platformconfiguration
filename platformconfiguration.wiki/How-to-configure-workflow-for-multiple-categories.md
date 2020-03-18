Created by Rob Worthington on Oct 02, 2017. Copied from Kwantu [Wiki]() on 2018-12-17.

***

There are two additional configurations to allow any application have multiple categories.
First in Workflow configuration adjacent to existing **`"type"`** ("instance/adoption/subprofile") attribute, a new attribute introduced as **`"category"`** which can define one identifier for sub profile category like location/node etc.
Secondly, there is one small addition in application configuration as well in **`"profileSettings"`** -- > **`"subprofiles"`** section. 

**Inside `subprofile` section we can now have list of supported categories as per the following example:**

```javascript
            "categories": [
                {
                    "id": "node",
                    "label": {
                        "en": "Nodes"
                    },
                    "setId": "node"
                },
                {
                    "create": {
                        "profileLevel": true,
                        "subprofileLevel": true,
                        "label": {
                            "en": "Add Location..."
                        }
                    },
                    "id": "location",
                    "label": {
                        "en": "Locations"
                    },
                    "setId": "Locality"
                }
            ]
```

In above example, we are supporting two categories in given application one is node and other is location. Apart of multi language labels primary `setId` is defined here.

And then there is one optional section **"create"** which will give a link to add more of that kind from left side menu with given multi-language label.

Two attributes inside the **"create"** section are the same as: `profileLevel` and it means that you can add more of that kind as child to a profile (like add more locations), and `subprofileLevel` indicates whether you are allowed to add a location inside of a location; or if you want to provide for interactive hierarchical creation.

