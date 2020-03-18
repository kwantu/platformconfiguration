[back...](https://github.com/kwantu/platformconfiguration/wiki)
# GIS configuration


```json
"profileSettings": {
        .....
        "maps": [
            {
                "scope": "profile",
                "label": {
                    "en": "Edit Geo Data"
                },
                "limitAccessTo": [
                    "*"
                ],
                "id": "geoEditor",
                "mapLayers": [
                    {
                        "heading": {
                            "en": "Localities"
                        },
                        "editable": {
                            "canEdit": true,
                            "limitAccessTo": [
                                "*"
                            ]
                        },
                        "layerId": "localities",
                        "type": "layerGroup",
                        "limitAccessTo": [
                            "*"
                        ],
                        "source": {
                            "subprofile": {
                                "boundary": {
                                    "variable": {
                                        "subprofileId": "model:subprofileId",
                                        "subProfile": "municipalityGeo"
                                    }
                                },
                                "uuid": "model:subprofileId+:geo",
                                "category": "localities"
                            }
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
        ]
    },