# Introduction
It's important for the developer, using the Kwantu platform, to distinguish between: 
1. entities belonging to the Kwantu platform itself; and 
1. entities of the Apps which are being developed in the Kwantu platform.  

Kwantu platform _configuration metadata_ is a layer of abstraction expressed in the form of config-files, which describe the Application being developed in terms of now-familiar-concepts (like: forms; fields; pick lists; validations; panels; buttons; and similar App-entities) and conform to the DOM (document object model) class of file structures. These config-files will be _transformed_ by an automated process (imagine a compiler) into yet other DOM target files. The DOM target files contain only application entities. For that reason, those familiar with HTML and XML should not be confused when the _actual data_ (inside the metadata of the Kwantu platform config-files) contain words commonly used in the transformed target DOM files containing the entities of the application being developed on the Kwantu platform.  Take a moment to grasp this concept of a _layer_ that _transforms_ into yet another _layer_. 

The target DOM file types, containing the "_application entities_" after the transformation process of the "_Kwantu platform entities_" is complete, are listed as follows:
* **XML** schema files with a [.XSD](https://en.wikipedia.org/wiki/XML_Schema_(W3C)) file extension
* **JSON** lightweight javascript object notation hierarchical data files
* **HTML** files
* **CSS** (cascading style sheet) files

**The following is a list of entities of the Kwantu platform and their descriptions:**

# App
An App is an instance of the Kwantu platform applied to a real-world problem in order to record and process relevant data from that real-world problem.  It is what users think of as "their business system". The App is everything that the users see and interact with while using their computerised business system. An App is defined in the App-[config-file](https://github.com/kwantu/platformconfiguration/wiki/Entity-list#config-file).  In this file are all the following features of the App:
* Forms
* Data-objects (SDOs)
* Searches
* Taxonomies

Apps are **adopted **by communities to create a suite of solutions that solve their real-world problems.  Conversely, when communities create new Apps, or new Versions of existing Apps, then other members of the root-community may adopt those new (Apps and Versions).

# Community
A community is a group of users who all have similar real-world problems and the solutions to their problems will likely be very similar or even identical.  For that reason, a community is likely to adopt the same Apps.  A community always belongs to a [Root-community](https://github.com/kwantu/platformconfiguration/wiki/Entity-list#root-community). [More](https://github.com/kwantu/platformconfiguration/wiki/Community)

# Config-file
A config-file is a configuration file of the Kwantu platform. There are two kinds of config-file, both containing hierarchical data: 
1. **XML** (eXtensible Markup Language); and 
1. **JASON** (Java Script Object Notation.

The config-file is the mechanism by which the Kwantu platform provides control over the functionality offered by the Apps that are developed on the platform. By design these files contain a structured declarative language, which consists of structurally organised key-value pairs. The structures possible within these files are simultaneously elaborate and simple, allowing almost anyone with the aptitude to grasp hierarchical document models, to adopt and adapt existing Apps and also to develop new Apps. The following is a list of config-files used in the Kwantu platform:
* App-config-file
* Community-config-file
* Adoption-config-file

# Data-Objects
Data-objects are the meta-data mechanism by which the Kwantu platform maps and persists instances of data, ensuring that once data has been captured, it will be available in the future for maintenance and processing.  The data instances of data-objects are processed into information through [searches](https://github.com/kwantu/platformconfiguration/wiki/Kwantu-modules-terminology#search), queries, reports and dashboards.  The data-object is also referred to as an SDO (self-aware data object). It is tightly associated with the definition of the [forms](https://github.com/kwantu/platformconfiguration/wiki/Kwantu-modules-terminology#forms) of the App, such that a change in the form will provide a corresponding change in the data-object, keeping both the form and data structurally in-sync and conformant with the same data-type and validation constraints, thus ensuring data integrity. 
[More](https://github.com/kwantu/platformconfiguration/wiki/Data-Objects)

# Form
A form is a screen which contains input fields which can be completed by a user. The forms are specified in the app-config file.  The fields in the form are grouped under the `<element>` tag and are labelled as `<elField>` tags. [More..](https://github.com/kwantu/platformconfiguration/wiki/Kwantu-modules-terminology#forms)

# Profile
There is a set of data-objects which are known as core-data-objects.  A profile is a set of data that relates to and characterises a core-data-object.  The following is a list of core-data-objects:
* App-profile;
* Community-profile; and
* User-profile.

# Role
Users have roles.  A user has responsibilities and accountabilities which determine what they can and cannot do in the Apps.  This is the user's role.  The role governs the permissions required by specific functional features of the [App](https://github.com/kwantu/platformconfiguration/wiki/Entity-list#app)that is being developed in the Kwantu platform.  The roles and permissions in the Kwantu platform are specified in a specific type of config-file called the App-config-file (not to be confused with the App-profile which is a Data-object).

# Root-Community
Root-communities and their sibling Communities all exist on a single server infrastructure.  A Root-community is a single [community](https://github.com/kwantu/platformconfiguration/wiki/Entity-list#community) on a server, on which other communities are served.  It exists to provide a mechanism for separate communities to contribute data to a single centre, in a standardised way and for consolidation into an aggregated form.  Conversely, the communities can inherit data  and they can adopt Apps from the Root-community.  For server infrastructures to scale, the Root-community server should be a virtual server consisting of multiple physical servers.

# Search
[Searches](https://github.com/kwantu/platformconfiguration/wiki/Kwantu-modules-terminology#search) are a user-interface feature (also commonly known as a pick-list) in which the pickable items in the list originate in an existing (data-object or SDO). Searches are also specified in the APP-config-file along with the [forms](https://github.com/kwantu/platformconfiguration/wiki/Kwantu-modules-terminology#forms) and the data-objects themselves.

# Server
A server may be virtual or physical computer with an identity on the network, offering services to clients that communicate using a protocol. The network my be local only or a combination of local and wide area networking.  Services themselves can consume other services in order to provide their services.  This fits into the client-server model of application architecture.

# Taxonomy
Taxonomies and Searches are a user-interface feature (aka. pick-lists, drop-down-boxes, pop-up-lists, etc.) in which the pickable items in the list originate inside the App-config-file. [Searches](https://github.com/kwantu/platformconfiguration/wiki/Kwantu-modules-terminology#search) are also specified in the App-config-file along with the [forms](https://github.com/kwantu/platformconfiguration/wiki/Kwantu-modules-terminology#forms) and linked to the data-objects in the App-config-file.  As the name suggests, taxonomies are fundamentally hierarchical in nature and can vary in the number levels they contain, from one single level, to many.

# User
A user is a person with: a role in a [community](https://github.com/kwantu/platformconfiguration/wiki/Entity-list#community) which has adopted an [App](https://github.com/kwantu/platformconfiguration/wiki/Entity-list#app); and who fulfils one or more of the roles defined in the App in order to accomplish record keeping of the changes that take place in the real-world problem space that the App is designed to track, measure and control.
