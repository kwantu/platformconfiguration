The map component may be displayed at app, profile or sub profile level.  It allows you to specify the GPS coordinates or a polygon for a data object.  If configured at the app level, it may be used to specify coordinates for a profile level data object.  If at the profile level for a sub profile level data object.

This is configured in the app config file in the ```"profileSettings":```.

# Parameters

The following parameters are available.

|Parameter|Options|Example|
|:------------- |:-------------|:-----|
|The scope for the map|May be application, profile or subprofile|```"scope": "application"```|
|The type of data collected|May be point (GPS point coordinates) or polygon|```"type": "Point"```|
|The search to return the data objects for which coordinates will be specified|Must be the ID for a search specified in the taxonomy section of the app config file|```"id": "facilityDetails"```|
|The roles that may access it|Must be a role specified in the app config file|```"limitAccessTo": ["Manager"]```|

# Example

Following is an example of the configuration.

```
"maps": [
            {
                "scope": "application",
                "label": {
                    "en": "GPS centre point"
                },
                "limitAccessTo": [
                    "*"
                ],
                "id": "geoEditor",
                "mapLayers": [
                    {
                        "layerId": "facilityDetails",
                        "type": "layerGroup",
                        "limitAccessTo": [
                            "*"
                        ],
                        "editable": {
                            "canEdit": true,
                            "type": "Point",
                            "limitAccessTo": [
                                "*"
                            ]
                        },
                        "source": {
                            "search": {
                                "id": "facilityDetails"
                            },
                            "uuid": "model:code+:geo"
                        },
                        "heading": {
                            "en": "Editor"
                        }
                    },
                    {
                        "editable": {
                            "canEdit": false
                        },
                        "layerId": "history",
                        "type": "control",
                        "limitAccessTo": [
                            "*"
                        ],
                        "source": {
                            "type": "history-control"
                        }
                    }
                ]
            }
        ],
```