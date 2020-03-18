When a user adds a new instance workflow these are displayed on a page.  This page his two tabs called 'Available offline' and 'Search'.  The offline tab shows instances that have been marked for offline access.  The search tab is only available when connected to the server and will search on the list of instances.

The offline tab will display the name used for the sub process instance.  The search tab will display the name used for the data object title.  In cases where the workflow process includes more than one data object, it will display the title field for the first data object specified.

As such it is important to manage the names displayed in a consistent manner.  There are several factors to consider:

First, if it makes sense to prompt the user to enter a title for the sub process instance when they instantiate the workflow
Second, if it makes sense to update the name to reflect the workflow state

# Prompting the user to enter a sub process instance label

In this scenario when the user instantiates the workflow they will be prompted to enter a name for the sub process instance.  The following should be added to the workflow process:

- Show title in workflow - this sets the workflow title with the term entered by the user
- Add "setWorkflowLabelInTitle": true in step one of workflow - this sets the data object title with the same term

There is a known issue with this scenario where the label will not display on the offline tab when the workflow is at the draft step.

# Setting a default title

In this scenario the user is not prompted to enter a title when the workflow is instantiated.  In this case we can set a default title in the first step of the workflow.  This will be displayed up until the user saves the form and advances the workflow.

In the example below the first workflow action sets the title for the sub process instance and the second for the data object.  In this example a constant value of 'Draft outcome' is set.

```
{
                                        "_id": "spTitle",
                                        "_seq": 2,
                                        "description": {
                                            "i18n": {
                                                "_id": "",
                                                "en": "test"
                                            }
                                        },
                                        "method": {
                                            "subProcessInstance": {
                                                "setTitle": {
                                                    "calculated": {
                                                        "elements": [
                                                            {
                                                                "constantValue": {
                                                                    "value": "Draft outcome"
                                                                }
                                                            }
                                                        ],
                                                        "separator": " "
                                                    }
                                                }
                                            }
                                        }
                                    },
                                    {
                                        "_seq": 3,
                                        "method": {
                                            "indicator": {
                                                "setWrapperElement": {
                                                    "path": "title",
                                                    "data": {
                                                        "calculated": {
                                                            "separator": " ",
                                                            "elements": [
                                                                {
                                                                    "constantValue": {
                                                                        "value": "Draft outcome"
                                                                    }
                                                                }
                                                            ]
                                                        }
                                                    },
                                                    "indicatorSetId": "SWOutcome"
                                                },
                                                "indicatorSetId": "SWOutcome"
                                            }
                                        },
                                        "_id": "appTitleForListing",
                                        "description": {
                                            "i18n": {
                                                "en": "test",
                                                "_id": "uuid"
                                            }
                                        }
                                    }
```
Please refer to [this example](https://github.com/kwantu/platformconfiguration/wiki/How-to-set-the-title-for-a-workflow-sub-process-instance) for other parameters that you can use when setting the title.  These include fields from the data object.

3 Updating the title when the workflow has transitioned to the approval step

In this scenario the user has now saved the form and transitioned to the next step in the workflow.  This allows us to read fields from the form data model, which we can now use to set a more meaningful title.

In the following example a combination of fields are being combined with the separator specified in the order in which the fields are specified.  This example includes a value that explains which stage in the workflow has been reached.

```,
                                    {
                                        "_id": "spTitle",
                                        "_seq": 2,
                                        "description": {
                                            "i18n": {
                                                "_id": "",
                                                "en": "test"
                                            }
                                        },
                                        "method": {
                                            "subProcessInstance": {
                                                "setTitle": {
                                                    "calculated": {
                                                        "elements": [
                                                            {
                                                                "elementProperty": {
                                                                    "indicatorSetId": "TACInfectionControl",
                                                                    "elementId": "outcomeTitle"
                                                                }
                                                            },
                                                            {
                                                                "elementProperty": {
                                                                    "indicatorSetId": "TACInfectionControl",
                                                                    "elementId": "whenDidThisHappen"
                                                                }
                                                            },
                                                            {
                                                                "constantValue": {
                                                                    "value": "(Pending approval)"
                                                                }
                                                            }
                                                        ],
                                                        "separator": " / "
                                                    }
                                                }
                                            }
                                        }
                                    },
                                    {
                                        "_seq": 3,
                                        "method": {
                                            "indicator": {
                                                "setWrapperElement": {
                                                    "path": "title",
                                                    "data": {
                                                        "calculated": {
                                                            "separator": " / ",
                                                            "elements": [
                                                                {
                                                                    "elementProperty": {
                                                                        "indicatorSetId": "TACInfectionControl",
                                                                        "elementId": "outcomeTitle"
                                                                    }
                                                                },
                                                                {
                                                                    "elementProperty": {
                                                                        "indicatorSetId": "TACInfectionControl",
                                                                        "elementId": "whenDidThisHappen"
                                                                    }
                                                                },
                                                                {
                                                                    "constantValue": {
                                                                        "value": "(Pending approval)"
                                                                    }
                                                                }
                                                            ]
                                                        }
                                                    },
                                                    "indicatorSetId": "TACInfectionControl"
                                                },
                                                "indicatorSetId": "TACInfectionControl"
                                            }
                                        },
                                        "_id": "appTitleForListing",
                                        "description": {
                                            "i18n": {
                                                "en": "test",
                                                "_id": "uuid"
                                            }
                                        }
                                    }
```

# Updating the title field when a workflow is completed

In this final example, the workflow has now completed and a new value is appended to clarify this.
```
,
                                    {
                                        "_id": "spTitle",
                                        "_seq": 2,
                                        "description": {
                                            "i18n": {
                                                "_id": "",
                                                "en": "test"
                                            }
                                        },
                                        "method": {
                                            "subProcessInstance": {
                                                "setTitle": {
                                                    "calculated": {
                                                        "elements": [
                                                            {
                                                                "elementProperty": {
                                                                    "indicatorSetId": "TACInfectionControl",
                                                                    "elementId": "outcomeTitle"
                                                                }
                                                            },
                                                            {
                                                                "elementProperty": {
                                                                    "indicatorSetId": "TACInfectionControl",
                                                                    "elementId": "whenDidThisHappen"
                                                                }
                                                            },
                                                            {
                                                                "constantValue": {
                                                                    "value": "(Approved)"
                                                                }
                                                            }
                                                        ],
                                                        "separator": " / "
                                                    }
                                                }
                                            }
                                        }
                                    },
                                    {
                                        "_seq": 3,
                                        "method": {
                                            "indicator": {
                                                "setWrapperElement": {
                                                    "path": "title",
                                                    "data": {
                                                        "calculated": {
                                                            "separator": " / ",
                                                            "elements": [
                                                                {
                                                                    "elementProperty": {
                                                                        "indicatorSetId": "TACInfectionControl",
                                                                        "elementId": "outcomeTitle"
                                                                    }
                                                                },
                                                                {
                                                                    "elementProperty": {
                                                                        "indicatorSetId": "TACInfectionControl",
                                                                        "elementId": "whenDidThisHappen"
                                                                    }
                                                                },
                                                                {
                                                                    "constantValue": {
                                                                        "value": "(Approved)"
                                                                    }
                                                                }
                                                            ]
                                                        }
                                                    },
                                                    "indicatorSetId": "TACInfectionControl"
                                                },
                                                "indicatorSetId": "TACInfectionControl"
                                            }
                                        },
                                        "_id": "appTitleForListing",
                                        "description": {
                                            "i18n": {
                                                "en": "test",
                                                "_id": "uuid"
                                            }
                                        }
                                    }
```
