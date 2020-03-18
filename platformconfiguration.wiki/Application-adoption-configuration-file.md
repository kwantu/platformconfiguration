When a community adopts a new application, an application adoption configuration file is created.  This allows the community owner to override some application parameters.  

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

```
{
    "_id": "adoption:6a83693f-f91d-416f-9231-fd0eb3542bc5",
    "_rev": "1-c395c27e57b57e6a6df440cae234ccd9",
    "permissions": [
    ],
    "communityId": "7d53b075-b49a-4f09-9c7d-9ef870e1ac77",
    "name": {
        "i18n": {
            "en": "Reports"
        }
    },
    "taxonomies": [
        {
            "appConfig": {
                "id": "userSearch",
                "uuid": "userSearch"
            }
        }
    ],
    "channels": [
        "config_c_7d53b075-b49a-4f09-9c7d-9ef870e1ac77"
    ],
    "adoptionProfile": "6a83693f-f91d-416f-9231-fd0eb3542bc5",
    "version": "1",
    "appId": "9a82a215-8a80-40c6-f1ac-7012b65a5556",
    "rolesMap": [
    ],
    “restrictAvailability": true 
}
```