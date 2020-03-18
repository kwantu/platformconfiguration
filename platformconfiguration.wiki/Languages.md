All configuration files may be translated into any language with an ISO 639 code.  Each community has a default language.  If the configuration files for the apps adopted by that community include that language, then it will display in that language by default.  If not, it will instead default to whichever language is available.

Communities may also defined additional languages that are available for users to choose between.  In these cases users may switch to their preferred language on the settings page.  Once a user switches their language selection is remembered.

The following code example shows how to define the default language and other available languages in the community configuration file.

```
    "languages": [
        {
            "default": true,
            "code": "en",
            "label": "English"
        },
        {
            "default": false,
            "code": "pt",
            "label": "Portuguese"
        }
    ],
```
The following parameters are available in this code.

| Parameter        | Explanation           | Values  |
| ------------- |:-------------:| -----:|
| default | Specifies which is the default language for the community | true or false |
| code | The ISO 639 code for the language | Any ISO 639 code|
| label | The label shown for the language | Any string |

For information on translating other configuration files, please see this article.