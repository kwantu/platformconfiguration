[back](https://github.com/kwantu/platformconfiguration/wiki)

# Setting up online help
This page outlines the process to take to configure online help for apps. <br>
<br>
There is an additional page created to build help files for the application. Once you create help file via this tool, default help file with all the sections as per the application will be created. Editing the help file via the tool is still not available, although you can go to CouchDB/kwantu_configs bucket locate the help file and edit it.

```http
https://kwantu.support/exist/rest/db/kwantu-resource/api/rest/buildHelp.xq
```

There are two levels of help implemented as of now. User and Application. The third level of adoption is not implemented as of now and can come later.

## User level help

```
help:user
help:xxxx_applicationIdxxx
```

User section help will cover 7 pages. You can configure more than one help sections for a single page.

1. Favourite
1. Notifications
1. Inbox
1. Network Settings
1. User Settings
1. Logout
1. Global Search

## Application level help

Application help will cover areas depending on application config and the contexts available. For example below are from CA outcome harvesting application

```
profile:default
profile:details
profile:actions
profile:forms
profile:data
profile:subprofilenodes
profile:profileDashboard
profile:roles
profile:profileExternal
profile:settings

profile:subprocess:profileRegistration
profile:subprocess:programmes
profile:subprocess:Projects
profile:subprocess:outcomes
profile:subprocess:promiseData
profile:subprocess:importData

application:instances
application:pending
application:appLevel
application:adoption
application:appRoles

application:listarea:ChartsData
application:listarea:ReportsData

subprofile:profileRegistration:catecgorynodes
subprofile:profileRegistration:list
subprofile:profileRegistration:node
subprofile:profileRegistration:nodeForms
subprofile:profileRegistration:subprofileDashboard
subprofile:profileRegistration:nodeRoles

subprofile:group:Projects
subprofile:group:outcomes
application:group:importData
```
