A community has it's own set of users, apps and data.  The community administrator may create accounts for new users or grant permissions for users on other communities to also access their community.  They may adopt apps from the app registry into their community.  Once released, users on the community may use the app to create and use data.

Each community has it's own database that contains all data created by apps adopted on the community.  Communities may have one or more roles and may specify the languages available to users.  The community may also reference taxonomies that are then available to all apps using the community.

# Creating a community

Please refer to [this article](https://github.com/kwantu/platformconfiguration/wiki/Creating-a-community) on creating communities.

# Managing a community

The following sections cover different aspects of managing a community.

## Defining community roles

One or more roles can be defined at the community level.  These can be mapped to roles at the app level.  See [this article](https://github.com/kwantu/platformconfiguration/wiki/Community-roles) for details.

## Setting community permissions

Permissions may be defined at the community level.  See [this article](https://github.com/kwantu/platformconfiguration/wiki/Community-permissions) for more details.

## Setting community languages

Each community may provide a user interface in multiple languages.  At least one language must be set as the default.  For the user interface to render in other languages, the apps and their configuration files must be translated into the language.  See [this article](https://github.com/kwantu/platformconfiguration/wiki/Languages) for more details.

## Referencing community taxonomies

Communities may reference core taxonomies that you wish to share across all apps.  This is useful for referencing common taxonomies (such as location taxonomies) that are common to all apps.  See [this article](https://github.com/kwantu/platformconfiguration/wiki/Taxonomies) for more information on taxonomies.

## Managing users

User management is done via the user interface for the community.  You can access this area by logging into your community and opening the settings page.  The user management section is visible only to users with a role that have been [assigned permission](https://github.com/kwantu/platformconfiguration/wiki/Community-permissions) to view this area.

User accounts are created on the root community for your server.  This enables users to use one account to access more than one community.  Users with existing accounts are given access to your community by allocating them the community member role.  View [this article](https://github.com/kwantu/platformconfiguration/wiki/User-management) for more on user management.

## Adding a logo

Each community may include a logo.  This is displayed in the top right corner.  To add or update a logo you can use the following URL:
```
/exist/rest/db/test/uploadImage.html
```
This will prompt you with a page in which you must enter the UIID of your community and attach the file for your logo.  Currently only PNG files are supported.

## Setting the centre point for maps

In cases where a map is embedded in a form in an app, you may wish to define a specific default centre point for the map.  These are the coordinates that will load when the user opens the form to specify a location.

The following configuration is added at the root level in the community configuration file.

```
"mapDefaults": {
        "Lat": -33.918861,
        "Lng": 18.4233,
        "Zoom": 14
    },
```

The zoom should be between 6 and 16

# Adopting Apps

Your community may adopt one or more apps.  Each app extends the functionality of your community and typically cover different business processes or programme processes.

## Core Apps

Kwantu have created the following core apps, which are available for all communities to use.

### Reports

The reports app enables you to access and use data from any of your apps.  It enables you to create views that extract data for any data object in any app.  These may be combined to create comprehensive reports.  These may be requested and downloaded as Excel or PDF files.  Reports also generate JSON data feed URLs, which you can use to push data into other databases.

[More on the Reports app](https://github.com/kwantu/platformconfiguration/wiki/Reports-app)

## Adopting other Apps

Placeholder for guidance
