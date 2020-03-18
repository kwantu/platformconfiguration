# Introduction

**NOTE!** An _indicator_; an _SDO_; a _DO_; a _data object_ and a _Set Id_ all refer to the same thing: <br> a **Data object**. 

Data objects are a way of defining (planning or monitoring) data in a standardised and re-usable way. DOs differ from other approaches to developing data standards in four key ways:

| Difference        | Explanation |
| ------------- |:-------------|
| [Interoperable](https://github.com/kwantu/platformconfiguration/wiki/Interoperable-data-objects) | DOs are defined using a domain specific language, which ensures that data for different types of DOs are defined in the same way.  This means that different DOs related to different types of M&E or planning data will be defined in the same way.|
| [Rich business context](https://github.com/kwantu/platformconfiguration/wiki/Rich-business-context) | The context of the data is critical to understand the quality of the data and it’s relationships with other data.  DOs are designed to understand the full context related to the data, making it ‘self-aware’. |
| [Standard data envelope](https://github.com/kwantu/platformconfiguration/wiki/Standard-data-envelope) | Each SDO includes a standard data envelope.  This provides metadata to assist with exception and status reporting. |
| Offline first architecture | DOs store data in JSON files, which can be synchronised between a client device and a server. This approach enables data to be collected offline and synchronised as and when Internet is available |

The  data object (DO) paradigm is analogous to the [metadata](https://en.wikipedia.org/wiki/Metadata) of a table in an [RDBMS](https://en.wikipedia.org/wiki/Relational_database_management_system). The DO "_definition meta data_" is stored in a "_configuration_" file. The DO metadata instance files are in turn stored in the database along with their actual data.  This is analogous to a data-model and its data inside of an RDBMS.  The DO is defined by metadata in a "_configuration file_". Unlike a data-model in a RDBMS, the DO is not relational, it is [hierarchical](https://en.wikipedia.org/wiki/Hierarchy). The "_DO configuration files_" themselves are hierarchical too. Developing apps on the Kwantu platform involves editing "_configuration files_". Configuration files "_tranformed_" into the various app files used in the execution of the app.

The picture below illustrates a logical hierarchy of three layers of subordinate "_nodes_" to the apex "_node_":

![Hierarchy Logical 1.jpeg](https://github.com/kwantu/platformconfiguration/blob/master/Hierarchy%20Logical%201.jpeg)

A hierarchy can be pictured as a pyramid of layers stacked on top of each other, or as in the screenshot below as a collapsible _inverted tree_. 

![Hierarchy Config file.PNG](https://github.com/kwantu/platformconfiguration/blob/master/Hierarchy%20Config%20file.PNG)

The picture above is a screenshot of an example DO configuration file as seen in XMLnotepad. It presents the hierarchy in the classic two(2) panel "_Norton Utilities user interface layout_" in which the hierarchy is represented as a "_collapsible tree_" in the left panel and details of the "_nodes_" are displayed  in the right hand panel.

 The [metadata](https://en.wikipedia.org/wiki/Metadata) of the DO is also stored in the database, (just like the metadata of a set of tables in a data-model of an RDBMS). Instances of data then conform to the metadata of the DO and are stored in the database. In this regard, (tables in data-models and DOs) are very similar. The difference is that a hierarchical data structure does not need to be joined, while the tables of the relational data-model do... and that makes a **big** difference to scaleability of applications using them.

[Data objects contain fields](https://github.com/kwantu/platformconfiguration/wiki/Fields-in-Data-Objects)

# Creating data objects

Each DO is defined using an [XML configuration file](https://github.com/kwantu/platformconfiguration/wiki/Data-object-configuration-file).  This document describes the rules, data models, schemas, language, dependencies and references of the DO.  It also has a generic description of the view, edit and list models.  

# Transforming data objects

Once a data object configuration file has been created, it is then [transformed](https://github.com/kwantu/platformconfiguration/wiki/Transforming-data-object-configuration-files) to create the following files:

* Data model (JSON)
* View model (JavaScript)
* View (HTML and CSS)

Configuration files are transformed by making a call to the [transformer service](https://github.com/kwantu/platformconfiguration/wiki/Transforming-data-object-configuration-files).  This saves the data and view models into the config bucket on the server.  More on transforming data objects.

# Referencing data objects

Once transformed, data objects must then be referenced in the app configuration file for the app (or apps) in which they will be used.  They must also be referenced in the workflow configuration file for the sub process and step(s) in which they will be accessed.

# Data object instances

As the workflow is instantiated, a new instance of the data object (or data objects) in that workflow processes are created.  The data associated with that data object instance is saved in the data object instance file.  As other users interact with the data object through subsequent workflow steps, additional sequences of the same data object instance are created.

# Updating and versioning data objects

Once you have created a data object and started using it to store data, you may need to make changes.  Data objects may be versioned as you make updates.  This separates the data entered by version to avoid inconsistencies.

# How to guides

* [How to configure searches in data objects](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-searches-in-data-objects)
* [How to validate a field as a URL](https://github.com/kwantu/platformconfiguration/wiki/How-to-validate-a-field-as-a-URL)
* [How to calculate the total values for a column](http://w.kwantu.net/display/CON/How+to+calculate+the+total+for+values+in+a+column)
* [How to validate a field as a South African ID number](https://github.com/kwantu/platformconfiguration/wiki/How-to-validate-a-field-as-a-South-African-ID-number)
* [How to configure the file upload and photo widget](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-the-file-upload-and-photo-widget)
* [How to validate that the end date is after the start date](https://github.com/kwantu/platformconfiguration/wiki/How-to-validate-that-the-end-date-is-after-the-start-date)
* [How to validate that one number is less than another number](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-a-form-with-validate,-save-as-draft-and-save)
* [How to configure a form with validate, save as draft and save](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-a-form-with-validate,-save-as-draft-and-save)
* [How to validate South African bank account numbers](https://github.com/kwantu/platformconfiguration/wiki/How-to-validate-South-African-bank-account-numbers)
* [How to configure a repeat with zero rows](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-a-repeat-with-zero-rows)
* [How to push a single data object to production](https://github.com/kwantu/platformconfiguration/wiki/How-to-push-a-single-data-object-to-production)
* [How to configure a form without an accordion](https://github.com/kwantu/platformconfiguration/wiki/How-to-configure-a-form-without-an-accordion)
* [How to follow naming conventions for element IDs](https://github.com/kwantu/platformconfiguration/wiki/How-to-follow-naming-conventions-for-element-IDs)
* [How to set text pattern when defining a field widget](https://github.com/kwantu/platformconfiguration/wiki/SDO-How-to-define-text-patter-for-fields)
