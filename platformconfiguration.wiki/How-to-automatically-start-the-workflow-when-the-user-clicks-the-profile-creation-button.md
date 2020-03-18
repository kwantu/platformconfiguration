Created by Rob Worthington on Jul 03, 2018. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+hide+the+appProfile+data+object) on 2018-12-12.

When creating a new profile there are two options available when the user clicks the profile creation button:

* Text box appears in which user must enter the profile name
* Profile creation form (or workflow) opens automatically

These options are configured by using the tag `"defaultTitle": true` 

This is defined in the app config in the `profile` section as per the following example:

```JASON
"profile": {
            "maskLabel": {
                "en": "Enter farm name"
            },
            "profileCreationLabel": {
                "en": "Add farm"
            },
            "createProfile": true,
            "defaultTitle": true,
            "okLabel": {
                "en": "OK"
            },
            "cancelLabel": {
                "en": "Cancel"
            }
        },
```

If you set the value to true, the form or workflow opens immediately.  If false the user is prompted to enter a title first.

In cases where the value is set to true, a default name for the profile is taken from the workflow configuration:

```JASON
"name": {
             "i18n": {
                 "en": "Farm profile",
                 "_id": "uuid"
             }
         },
```


Be sure to set a name here that will be meaningful and prompt the user to update with a relevant name.

