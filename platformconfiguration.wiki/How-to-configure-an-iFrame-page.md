You can add an iFrame at the app, profile or subprofile level in any app.  The following code provides an example.  This is added at the root level in the [application configuration file](https://github.com/kwantu/platformconfiguration/wiki/Application-configuration-file).

```
"externalPages":[
{
"label":{
"en": "Dashboard",
},
"type": "instance",
"url": "EnterURLhere"
}
]
```
You may repeat this to add an iFrame page at each of the three levels.  However, only one iFrame page may be shown at each level.

| Parameter        | Explanation           | Values  |
| :------------- |:-------------| :-----|
| label | Enter the page name in one or more languages. | Any string |
| type | Specify if the page displays at the app, profile or sub profile level | adoption, instance or sub profile |
| url | The URL which you wish to display in the iFrame | Any valid, public URL|