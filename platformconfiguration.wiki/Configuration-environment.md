There are several tools that we recommend you use as part of your configuration environment.

# Version control system

If you plan to configure as a team, we recommend you use a distributed version control system like Github.  This helps manage version control of configuration files and provide a central file structure that you work from.

# XML and JSON editors

Data object configuration files are written in XML.  All other configuration files are in JSON.  Both use schemas to validate.  We recommend you use an editor that can validate your configuration files against the relevant schema and integrate with your version control system.

For XML we recommend Oxygen.  For JSON we recommend Microsoft Visual Code Studio.

# API tool

The configuration files are hosted on your staging server.  They can be accessed via an authenticated GET request and updated with a PUT request.

For Google Chrome we recommend using Restlet and for Firefox Rester.

# Staging and Production servers

We recommend that you operate separate servers for staging and production environments.  In all cases configuration changes should be made to and tested on the staging environment.  API calls are used to push all or some of a configuration to the production server as part of a configuration release.

[This article](https://github.com/kwantu/platformconfiguration/wiki/Publishing-a-new-community-to-the-production-server) explains how to publish a new community to your production environment.  [This article] explains how to publish configuration changes.