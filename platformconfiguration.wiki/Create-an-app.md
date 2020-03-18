This page describes the files of the environment of an app as a prerequisite to understanding the app config file ([Application configuration file](https://github.com/kwantu/platformconfiguration/wiki/Application-configuration-file)) as a component-page of the [Kwantu platform application development process User Guide](https://github.com/kwantu/platformconfiguration/wiki/Kwantu-platform-application-development-process-User-Guide). This page provides some context for creating the app config file. Lecture from Willem December 2018.

***

The important insight to take with you from this page is that all configurations and instances of configurations are uniquely identified in the Kwantu platform. The two vitally important identifiers mentioned here are the `**UUID**` and the set`**_Id**`. These identifiers are used to link the configuration files and the data instances of SDO (data objects) together in an app. An app is a workflow linked together with SDO (data objects).

The following diagrams explain the context of the app config file and how it is used by the Kwantu platform administrators of a Kwantu platform community when an app is adopted by the community.

###  The 3 top-level databases of the Kwantu platform:

![Kwantu Application Profile system](https://github.com/kwantu/platformconfiguration/blob/master/Kwantu%20Application%20Profile%20system.jpg)
Notice the brown boxes at the top. They represent the 3 top-level databases of the Kwantu platform. 
**They are as follows:**
* The root community
* Taxonomies
* Configs

There is also a brown box at the bottom. This represents the **Community database**.  The [community](https://github.com/kwantu/platformconfiguration/wiki/Community) concept is important. Communities adopt apps.  Therefore apps must first be configured before they can be adopted. The app config file has a taxonomy section and each taxonomy that may be needed by the app is linked to "**taxonomies database**" through the **UUID** of the taxonomy. The **UUID** is a unique identifier of a JSON document in the database, which describes the taxonomy. The "**taxonomy database**" is one of the tree top-level databases and it uses the **UUID** to identify a taxonomy uniquely. Part of the taxonomy-entry in the taxonomy-section in the app config file is another identifier called the "**Set Id**".  The "**Set Id**" is also a unique identifier which links a single taxonomy-entry with an "**SDO data object**" stored in the third system-wide-database called the config database, represented by the third brown rectangle in the picture above. 
<What is the "data registry"> ? <rob>

### Kwantu Application Profile System:

![Kwantu databases](https://github.com/kwantu/platformconfiguration/blob/master/Kwantu%20databases.jpg)

The picture above represents the way in which an application, which is a generic concept, is adopted by a community.   In the adoption process, the app adoption profile is instantiated.   This is actual data that customises any parameterisable aspects of the app, specially designated for the community that is adopting it.  For that reason, the app profile is described in an "**SDO data object**" meta data file, which is stored as an instance of the SDO data object in the third database: (ie. the "**config database**".)

A community is defined as a unique name with a unique identifier in an instance of the community SDO data object.  The **Set ID** is the unique identifier of any SDO in the config database.  All SDOs are stored in the config database and all SDOs are available globally to be used in apps.  In fact an app is simply a list of SDOs linked together with a workflow.   It is the workflow that controls how the SDO views are presented to the user.

The adoption profile is a file in the config database.  There are two "**levels**" of adoption file in the config database, which are the following:
* Apex level; and
* Instance level

See that there is a profile in each level. Inside of each profile is or can be a sub-profile.

Notice that on the left hand side of this diagram there is a brown dividing line. On the left of the line are three brown rectangles arranged vertically on top of each other, followed by a green rectangle beneath, which represent the following 4 things:
1. App configuration
1. Community configuration
1. Adoption
1. Profile

To the left of the app config brown rectangle is another green rectangle labelled Root app configuration profile. 

The purpose of this page is to provide context for the app config file or [Application configuration file](https://github.com/kwantu/platformconfiguration/wiki/Application-configuration-file), which we will explore in more detail on [it's own page](https://github.com/kwantu/platformconfiguration/wiki/Application-configuration-file).

### Configuration process steps

**A process diagram for **creating an app** from Willem the chief architect and concept originator.**

![Willems App Config diagram landscape](https://github.com/kwantu/platformconfiguration/blob/master/Willems%20App%20Config%20diagram%20landscape.jpg)

The steps in this chart represent the recommended sequence required for putting the set of configuration files required to define an app, into the Config DB and are as follows:
1. Define SDOs with Viud. (Configure or else use what is there)
1. Create the app UUID.
1. Create app [Application configuration file](https://github.com/kwantu/platformconfiguration/wiki/Application-configuration-file); mapping: (SDO's; Taxonomies; and Searches).
1. Define Permission and Roles.
1. Define workflow; Create references to: (The SDO; and the views of the SDO)
1. Workflow will use Roles
1. Define notifications, which are the mechanism by which users are informed of an action that is required from them.