An app is a profile with a collection of data objects, workflows, taxonomies and reports that relate to one specific business process.  It is defined by the following configuration files:

* application configuration file
* workflow configuration file

When a community adopts an application it also creates an application adoption configuration file.

# Overview of an app

Same needed for community...

# Creating an app

Apps are created using the application app.  This is adopted by and available in the root community on the server. 
 Note that new apps should be created on your staging server.  Once configured they can then be replicated to the production server.

To create a new app follow these steps:

1. Open the root community
2. Open the application app
3. Click 'Create app' on the apps page
4. Enter a name, description and contact information for the app, then save the form.  Note that this form also shows the UUID for the app
5. Wait for the server process to complete
6. The app profile is created and the application configuration file

# Configuring an app

Your new app initially consists only of a profile and an [app configuration file](https://github.com/kwantu/platformconfiguration/wiki/Application-configuration-file) and a [workflow configuration file](https://github.com/kwantu/platformconfiguration/wiki/Workflow-configuration-file).  For the app to meet your requirements it must be further configured.

Your app functions as a container in which you can assemble the following components.  These may be (and ideally are) re-used across different apps.

## Versions

All apps are versioned.  This starts with version 1 and increments to 2 and on as you release a new version.  All the configuration files associated with the app may also be versioned.

## Data objects

Your app can reference multiple data objects.  These may be unique to your app or shared with other apps.  Sharing data objects across apps allows for data interoperability.  The data objects used by an app are referenced in the application configuration file and also in the workflow configuration file.

[More on data objects](https://github.com/kwantu/platformconfiguration/wiki/Data-Objects)

## Taxonomies

## Lists appearing in the dashboard tab
[See how to add a list to the dashboard tab](https://github.com/kwantu/platformconfiguration/wiki/Configuration-Apps-Lists)

## Workflow

## Permissions

## Roles

## Pages

Apps are created with a core set of [pages](https://github.com/kwantu/platformconfiguration/wiki/App-pages).  These may be hidden from users with page level permissions.  There are also optional pages that may be added to your app.  [Learn more about pages](https://github.com/kwantu/platformconfiguration/wiki/App-pages)

## Languages