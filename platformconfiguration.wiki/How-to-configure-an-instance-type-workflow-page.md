Apps that have new instance type workflows have a page that shows a list of all of these instances.  By default you can access this page from the relevant workflow.  You may also display this as a page in the profile navigation.

Following is an example of the code.  This is added within the profileSettings area of the [application configuration file](https://github.com/kwantu/platformconfiguration/wiki/Application-configuration-file).

```
"listWorkflows": [
            {
                "label": "Assessments",
                "processId": "KnowledgeModuleUnitWF",
                "subprocessId": "spKnowledgeModuleUnitWF",
                "type": "subprofile",
                "category": "Modules"
            }
        ],
```
The following parameters can be adjusted.

| Parameter        | Explanation           | Values  |
| :------------- |:-------------| :-----|
| label | Enter the page name in one or more languages. | Any string |
| processId | Specify the ID of the workflow process that you wish to display on the page.  Must be a newInstance type workflow | Valid process ID |
| subprocessId | Specify the ID of the workflow sub process that you wish to display on the page.  Must be a newInstance type workflow | Valid sub process ID|
| type | Specify the level at which you wish the page to display.  May be profile or sub profile | instance or subprofile|
| category | If you set the type as 'subprofile' then here specify the category ID for that subprofile.  Otherwise leave blank | A valid subprofile category ID|