[back](https://github.com/kwantu/platformconfiguration/wiki/Application-configuration-file)
# Configure the label and page name for the 'Profile search'

In the 
To specify an app specific name for the profile search, add the following to the 'tabs' array in the app config where you replace 'Units' with your app name for that page.
```json
            {
                "default": true,
                "label": {
                    "i18n": {
                        "en": "Units"
                    }
                },
                "id": "instances"
            }

```