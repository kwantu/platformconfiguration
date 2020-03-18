This page describes the abstract concept of the "application screen layout" of the Kwantu platform "SDO view model" of an [app](https://github.com/kwantu/platformconfiguration/wiki/App). (SDO = DO _data object_). Refer to the [Glossary of terms, dictionary and terminology](https://github.com/kwantu/platformconfiguration/wiki/Glossary-of-terms,-dictionary-and-terminology)

There are multiple views of a data object. Each of these views is crafted to appear in the most effective way from the point of view of the user. The vew model consists of elements which can contain one or more fields of different types. The workflow dictates which data object and which views on the data object are required in the app and how a user may move from one element to another in a "set of elements" of a view. This model represents the capabilities that are available on the platform to configure an app.

In the picture below, we see a basic Teal area with the words "_Community stuff_" surrounding a set of rectangles. This implies that the app does not exist in a vacuum, but rather as part of other stuff like [communities](https://github.com/kwantu/platformconfiguration/wiki/Community).  To get to an app,   a user must first have a valid user name and password on a server and navigate to the community of which they are a member and select the app they wish to run. This is an outer layer, part of the anatomy of an app and it all happens in the teal section of the app window.


**The following diagram conveys a picture of the Kwantu platform app model.** 

### Fig. 1

![Application model](https://github.com/kwantu/platformconfiguration/blob/master/Application%20SDO%20view%20model%20Fig%201.jpg) 


This picture represents what the app user will see on their (Web or Mobile) device screen. The model consists of a **`panelSet`**, which is a **set of `elements`** containing one, or in the case of a table, many **fields**. Each cell in a table is a field.  The "_set of `elements`_" can consist of a large number of "_fields_", but in this simplistic model example, the app contains four(4) _`elements`_ which represent the four basic "_types of fields_". We will refer to them as **Elements** in the following pictures for the sake clarity.

This "_DO view model_" picture will be extended progressively with further detail describing the components of this picture.  Each new picture shows how the model is described by entries in a few configuration files. The pictures help to identify the names of each capability of the app model. The "_types of fields_" which are the components of the app model are defined in a DO configuration file. **Note:** The configuration files must first be transformed into the actual "app run-time files" before the app can actually be run.

### Fig. 2

![Application model Set of Elements.jpg](https://github.com/kwantu/platformconfiguration/blob/master/Application%20SDO%20view%20model%20Fig%202.jpg)

In the picture above, there are red arrows pointing at **Element fields**.  These are the **set of elements** that will make up the app, listed as follows:

| [Fig. 2 Element](https://github.com/kwantu/platformconfiguration/wiki/Kwantu-platform-app-model/_edit#fig-2) | Element type name | Element type in Configuration | Element field description|
|-------------------:|-------------------:|:--------------------:|:-------------------------|
| Element Field 1 | Pick list | [`elSelect`](https://github.com/kwantu/platformconfiguration/wiki/elSelect) | When this field is activated by the user clicking on it, a "_drop down box_" or "_pick list_" appears and the user is able to select items from the pick list as needed. <br> The user is unable to capture anything that is not in the "_Pick List_". <br> The contents may originate from either a **`Taxonomy`** or a **`Search`**|
| Element Field 2 | Radio button | [`elField`](https://github.com/kwantu/platformconfiguration/wiki/elField) | When this field is activated by the user clicking on it, the button that has been depressed by the user is dark, while any other options remain light.|
| Element Field 3 | Table | [`elRepeat`](https://github.com/kwantu/platformconfiguration/wiki/elRepeat) | A repeat field is a table. <br> The table may have a **table heading**. <br> A table footer. <br> and multiple **rows** and **columns**. <br> Each column may have a **column heading* <br> In the table footer, each column may have a **column footer** |
| Element Field 4 | Text or number | [`elField`](https://github.com/kwantu/platformconfiguration/wiki/elField) | Some thing that the user has to capture. It s usually constrained in some way, like being numeric or text in nature|

Refer to the list of [Widgets](https://github.com/kwantu/platformconfiguration/wiki/Data-object-configuration-file#widgets) in the [Data object configuration file](https://github.com/kwantu/platformconfiguration/wiki/Data-object-configuration-file) page.



