# Prepare the configuration file

Please refer to this guide for how to prepare the configuration file.  Once completed, this should be saved to the database in the following location on the exist database server that contains the application:

/db/data/10004/workspace/10004-10002/editor/.feed.entry

The name of the file to use is in the format config_V1.0_testWillem.atom.entry. The testWillem is the unique name in the example above.  This file should conform to the schema to ensure that there is nothing wrong with its format.

# Run the transform

The transform is processed using a rest service.  This uses the following default values:

* communityId=00000
* appId=10002
* id=config_V1.0_testWillem (This is the name of the file above without the .atom.entry suffix)
* lang=en

For example:

/exist/rest/db/kwanturesource/collectorServices/serializeIndicatorTemplatesToCouch.xql?communityId=00000&appId=10002&id=config_V1.0_testWillem&lang=en

The results of this can be opened from the exist database directly:

/exist/rest//db/data/00000/workspace/10002/indicator

The various files can be retrieved as follows:

## Config

This is the definition file that was prepared.  You can access this at:

/exist/rest//db/data/00000/workspace/10002/indicator/config/ind_testWillemSDODefinition.xml

Note, that the community, application and data object ID need to be replaced in the URL. Note that in a browser, it is better to use the view source option to get the actual file.

## Data model

This is the data model example file that was prepared.  You can access this at:

/exist/rest//db/data/00000/workspace/10002/indicator/models/dm_testWillemSDO_testWillem.xml.  

Note, that the community, application and data object ID need to be replaced in the URL. Note that in a browser, it is better to use the view source option to get the actual file.

The second is the mapping file that the API uses to transform the XML data into JSON:

/exist/rest//db/data/00000/workspace/10002/indicator/models/dd_testWillemSDO_testWillem.xml.

## Schema

This is the schema file that was prepared.  You can access this at:

/exist/rest//db/data/00000/workspace/10002/indicator/schema/testWillemSDO_testWillem.xsd.

Note, that the community, application and data object ID need to be replaced in the URL. Note that in a browser, it is better to use the view source option to get the actual file.

** KUL templates

These are the template files that were prepared. The first is the edit view:

/exist/rest//db/data/00000/workspace/10002/indicator/views/tmp_testWillemSDO_testWillem_edit.xml 

Note, that the community, application and data object ID need to be replaced in the URL. Note that in a browser, it is better to use the view source option to get the actual file.

The second is the read only view.

/exist/rest//db/data/00000/workspace/10002/indicator/views/tmp_testWillemSDO_testWillem_object.xml 

Note, that the community, application and data object ID need to be replaced in the URL. Note that in a browser, it is better to use the view source option to get the actual file.

With these steps the preparation of the files for the DOs have been complete.
