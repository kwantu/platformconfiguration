Created by Rob Worthington on Nov 21, 2017. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+configure+user+interface+messages+in+the+workflow) on 2018-12-17.

***

Messages displayed in the workflow user interface are now configurable.  The following messages may be defined:

|Message|Function|Example|
|-------|--------|-------|
|Assigned	||`"assigned": {` <br> `"i18n": {` <br> `"_id": "",` <br> `"en": "Assigned"` <br> `}` <br> `}`|
|History null state	||`"blankHistoryLabel": {` <br> `"i18n": {` <br> `"_id": "",` <br> `"en": "Currently there is no History Instances Found !"` <br> `}` <br> `}`|
|Capture button	||`"capture": {` <br> `"i18n": {` <br> `"_id": "",` <br> `"en": "Capture"` <br> `}` <br> `},`|
|Completed on	||`"completedOn": {` <br> `"i18n": {` <br> `"_id": "",` <br> `"en": "Completed on"` <br> `}` <br> `},`|
|Data completed	||`"dateCompleted": {` <br> `"i18n": {` <br> `"_id": "",` <br> `"en": "Date completed"` <br> `}` <br> `},`|
|Step message	||`"defaultStepMessage": {` <br> `"i18n": {` <br> `"_id": "",` <br> `"en": "Not started"` <br> `}` <br> `},`|
|Step status	||`"defaultStepStatus": {` <br> `"i18n": {` <br> `"_id": "",` <br> `"en": "Not started"` <br> `}` <br> `},`|
|Due date	||`"dueDate": {` <br> `"i18n": {` <br> `"_id": "",` <br> `"en": "Due on"` <br> `}` <br> `},`|
|Due on	||`"dueOn": {` <br> `"i18n": {` <br> `"_id": "",` <br> `"en": "Due on"` <br> `}` <br> `},`|
|Assigned	||`"newInstanceAssignedSyntax": {` <br> `"i18n": {` <br> `"_id": "",` <br> `"en": "assigned to you"` <br> `}` <br> `},`
|List	||`"newInstanceDetails": {` <br> `"i18n": {` <br> `"_id": "",` <br> `"en": "List"` <br> `}` <br> `},`|
|List syntax	||`"newInstanceListSyntax": {` <br> `"i18n": {` <br> `"_id": "",` <br> `"en": "instances of which "` <br> `}` <br> `},`|
|List syntax 2	||`"newInstancecompetedSyntax": {` <br> `"i18n": {` <br> `"_id": "",` <br> `"en": "are completed"` <br> `}` <br> `},`|
|Sequence	||`"sequence": {` <br> `"i18n": {` <br> `"_id": "",` <br> `"en": "Version"` <br> `}` <br> `},`|
|Started on	||`"startedOn": {` <br> `"i18n": {` <br> `"_id": "",` <br> `"en": "Started on"` <br> `}` <br> `},`|
|Step	||`"step": {` <br> `"i18n": {` <br> `"_id": "",` <br> `"en": "for Step"` <br> `}` <br> `},`|
|Step comment	||`epComment": {`<br> `"i18n": {` <br> `"_id": "",` <br> `"en": "Step comment"` <br> `}` <br> `},`|
|Step history	||`"stepHistory": {` <br> `"i18n": {` <br> `"_id": "",` <br> `"en": "Step history"` <br> `}` <br> `},`|
|Step name	||`"stepName": {` <br> `"i18n": {` <br> `"_id": "",` <br> `"en": "Step name"` <br> `}` <br> `},`|
|Step number	||`"stepNumber": {` <br> `"i18n": {` <br> `"_id": "",` <br> `"en": "Step number"` <br> `}` <br> `},`|
|Sync error	||`"syncError": {` <br> `"i18n": {` <br> `"_id": "",` <br> `"en": "This sub process is out of sync"` <br> `}` <br> `},`|
|View label	||`"view": {` <br> `"i18n": {` <br> `"_id": "",` <br> `"en": "Label to view form goes here"` <br> `}` <br> `},`|

The following config shows where these labels are set in the workflow.  It is situated after the steps and starts with the tag `subprocessLabels`


### Code example
```javascript
        {
            "_id": "newInsProcess2",
            "_seq": 1,
            "help": {
                "i18n": {
                    "_id": "",
                    "en": "NTIPduty new sequence case"
                }
            },
            "name": {
                "i18n": {
                    "_id": "",
                    "en": "New instance case"
                }
            },
            "notifications": {
                "assignment": {
                    "message": {
                        "i18n": {
                            "_id": "en",
                            "en": "\u003cdiv\u003eHi #CURRENT_USER_NAME#,\u003cbr/\u003e A new workflow is assigned to you. Please follow below link to move to subprocess\u003c/div\u003e",
                            "pt": "Workflow is assigned to you. Please follow action."
                        }
                    },
                    "messageType": "action",
                    "notificationAction": {
                        "action": {
                            "goto": "subProcessInstance"
                        },
                        "label": {
                            "i18n": {
                                "_id": "en",
                                "en": "Open subprocess",
                                "pt": "Open subprocess(pt)"
                            }
                        }
                    },
                    "priority": "normal",
                    "title": {
                        "i18n": {
                            "_id": "en",
                            "en": "Workflow acceptance #SUB_PROCESS_NAME# Test",
                            "pt": "Workflow acceptance"
                        }
                    }
                },
                "assignmentAcceptance": {
                    "message": {
                        "i18n": {
                            "_id": "en",
                            "en": "Workflow is available for acceptance. Please follow action.",
                            "pt": "Workflow is available for acceptance. Please follow action."
                        }
                    },
                    "messageType": "action",
                    "notificationAction": {
                        "action": {
                            "goto": "subProcessInstance"
                        },
                        "label": {
                            "i18n": {
                                "_id": "en",
                                "en": "Open subprocess",
                                "pt": "Open subprocess(pt)"
                            }
                        }
                    },
                    "priority": "normal",
                    "title": {
                        "i18n": {
                            "_id": "en",
                            "en": "Workflow acceptance",
                            "pt": "Workflow acceptance"
                        }
                    }
                },
                "reAssignment": {
                    "message": {
                        "i18n": {
                            "_id": "en",
                            "en": "Workflow is reassigned to you  for processing. Please follow action.",
                            "pt": "Workflow is reassigned to you  for processing. Please follow action."
                        }
                    },
                    "messageType": "action",
                    "notificationAction": {
                        "action": {
                            "goto": "subProcessInstance"
                        },
                        "label": {
                            "i18n": {
                                "_id": "en",
                                "en": "Open subprocess",
                                "pt": "Open subprocess(pt)"
                            }
                        }
                    },
                    "priority": "normal",
                    "title": {
                        "i18n": {
                            "_id": "en",
                            "en": "Workflow reassignment",
                            "pt": "Workflow reassignment"
                        }
                    }
                }
            },
            "postActions": [],
            "preActions": [],
            "prerequisites": [],
            "subProcesses": [
                {
                    "_id": "newInsSubProcess2",
                    "_seq": 1,
                    "help": {
                        "i18n": {
                            "_id": "",
                            "en": "Application registration"
                        }
                    },
                    "indicators": [
                        {
                            "_id": "testSDOTwo",
                            "initiateData": "history",
                            "name": {
                                "i18n": {
                                    "_id": "",
                                    "en": "Application profile"
                                }
                            }
                        }
                    ],
                    "initiate": {
                        "name": {
                            "i18n": {
                                "_id": "en",
                                "en": "Application profile"
                            }
                        },
                        "user": {
                            "create": {
                                "i18n": {
                                    "_id": "",
                                    "en": "Application profile"
                                }
                            },
                            "dueDate": {
                                "_label": "Due date",
                                "_show": false,
                                "_type": "autoSelected",
                                "default": {
                                    "_type": "calculated",
                                    "calculated": {
                                        "operator": "add",
                                        "source": "valid",
                                        "value": 10
                                    },
                                    "value": ""
                                },
                                "message": {
                                    "i18n": {
                                        "_id": "",
                                        "en": "Please select a due date i.e. the actual date that the data needs to be captured and authorised by."
                                    }
                                }
                            },
                            "edit": {
                                "i18n": {
                                    "_id": "",
                                    "en": "Reopen"
                                }
                            },
                            "instanceTitle": {
                                "_label": "Title",
                                "_show": false,
                                "message": {
                                    "i18n": {
                                        "_id": "",
                                        "en": "Please enter the name for the Project profile"
                                    }
                                }
                            },
                            "isEditable": true,
                            "maxInstances": 9,
                            "parallelInstances": true,
                            "validDate": {
                                "_label": "Valid date",
                                "_show": false,
                                "_type": "autoSelected",
                                "default": {
                                    "_type": "today",
                                    "value": ""
                                },
                                "message": {
                                    "i18n": {
                                        "_id": "",
                                        "en": "Please select the date on which you collected this data."
                                    }
                                },
                                "vaidation": {
                                    "isFuture": false
                                }
                            }
                        }
                    },
                    "instanceLabel": {
                        "calculated": {
                            "subprocess": "SubprocessName"
                        }
                    },
                    "instanceType": {
                        "newInstance": {
                            "maxInstances": -1,
                            "maxSequences": -1,
                            "mayDelete": true
                        }
                    },
                    "isProfile": false,
                    "name": {
                        "i18n": {
                            "_id": "",
                            "en": "Application profile"
                        }
                    },
                    "periodType": {
                        "adhoc": ""
                    },
                    "steps": [
                        {
                            "_id": "createForm",
                            "_seq": 1,
                            "description": {
                                "i18n": {
                                    "_id": "",
                                    "en": "Create the Application profile"
                                }
                            },
                            "function": {
                                "actions": [
                                    {
                                        "_id": "form.create",
                                        "_seq": 1,
                                        "description": {
                                            "i18n": {
                                                "_id": "",
                                                "en": "test",
                                                "pt": "teste"
                                            }
                                        },
                                        "method": {
                                            "form": {
                                                "create": "fromDefinition"
                                            }
                                        },
                                        "setDraft": true,
                                        "setWorkflowLabelInField": "appProfile.Name",
                                        "setWorkflowLabelInTitle": true
                                    },
                                    {
                                        "_id": "getNodeValue",
                                        "_seq": 2,
                                        "description": {
                                            "i18n": {
                                                "_id": "uuid",
                                                "en": "This shows the example of getNodeValue with value fetch function."
                                            }
                                        },
                                        "method": {
                                            "indicator": {
                                                "indicatorSetId": "TACActivityHeader",
                                                "setValue": {
                                                    "data": {
                                                        "value": {
                                                            "data": "Infection",
                                                            "datatype": "string"
                                                        }
                                                    },
                                                    "path": "testSDOTwo.GrantType"
                                                }
                                            }
                                        }
                                    }
                                ]
                            },
                            "help": {
                                "i18n": {
                                    "_id": "",
                                    "en": "Please open the form and capture data"
                                }
                            },
                            "name": {
                                "i18n": {
                                    "_id": "",
                                    "en": "Create the Application profile"
                                }
                            },
                            "setInstanceStatusTo": {
                                "NotStarted": {
                                    "label": {
                                        "i18n": {
                                            "_id": "uuid",
                                            "en": "Not started"
                                        }
                                    }
                                }
                            },
                            "transition": [
                                {
                                    "_id": "captureForm",
                                    "name": {
                                        "i18n": {
                                            "_id": "",
                                            "en": "",
                                            "pt": ""
                                        }
                                    },
                                    "transitionAction": {
                                        "goToStep": {
                                            "default": "1",
                                            "type": ""
                                        }
                                    }
                                }
                            ]
                        },
                        {
                            "_id": "localStep2",
                            "_seq": 2,
                            "description": {
                                "i18n": {
                                    "_lang": "en",
                                    "en": "Capture form details"
                                }
                            },
                            "function": {
                                "task": {
                                    "assign": {
                                        "assignment": {
                                            "accept": {
                                                "label": {
                                                    "i18n": {
                                                        "_id": "en",
                                                        "en": "Accept",
                                                        "pt": "Aceitar"
                                                    }
                                                },
                                                "show": true
                                            },
                                            "message": {
                                                "i18n": {
                                                    "_id": "en",
                                                    "en": "This workflow sub process is ready for acceptance."
                                                }
                                            },
                                            "reject": {
                                                "label": {
                                                    "i18n": {
                                                        "_id": "en",
                                                        "en": "Reject",
                                                        "pt": "Rejeitar"
                                                    }
                                                },
                                                "show": true
                                            }
                                        },
                                        "role": {
                                            "profile": "community",
                                            "roleId": "CommunityCapturer"
                                        }
                                    },
                                    "help": {
                                        "i18n": {
                                            "_id": "",
                                            "en": "",
                                            "pt": ""
                                        }
                                    },
                                    "postActions": [],
                                    "preActions": [],
                                    "work": {
                                        "capture": {
                                            "formView": [
                                                {
                                                    "setId": "testSDOTwo",
                                                    "views": [
                                                        {
                                                            "label": {
                                                                "i18n": {
                                                                    "_id": "uuid",
                                                                    "en": "Edit",
                                                                    "pt": "Edit"
                                                                }
                                                            },
                                                            "viewId": "edit"
                                                        }
                                                    ]
                                                }
                                            ]
                                        }
                                    }
                                }
                            },
                            "help": {
                                "i18n": {
                                    "_id": "en",
                                    "en": "Please open the form and capture data"
                                }
                            },
                            "name": {
                                "i18n": {
                                    "_id": "",
                                    "en": "Capture Project profile"
                                }
                            },
                            "setInstanceStatusTo": {
                                "InProgress": {
                                    "label": {
                                        "i18n": {
                                            "_id": "uuid",
                                            "en": "In progress"
                                        }
                                    }
                                }
                            },
                            "transition": [
                                {
                                    "_id": "captureFormSubmit1",
                                    "default": true,
                                    "name": {
                                        "i18n": {
                                            "_id": "",
                                            "en": "Submit",
                                            "pt": "enviar"
                                        }
                                    },
                                    "transitionAction": {
                                        "goToStepId": {
                                            "stepId": "serverStep3",
                                            "type": ""
                                        }
                                    }
                                }
                            ]
                        },
                        {
                            "_id": "serverStep3",
                            "_seq": 3,
                            "description": {
                                "i18n": {
                                    "_lang": "en",
                                    "en": "Capture form details"
                                }
                            },
                            "function": {
                                "server": {
                                    "assign": {
                                        "assignment": {
                                            "accept": {
                                                "label": {
                                                    "i18n": {
                                                        "_id": "en",
                                                        "en": "Accept",
                                                        "pt": "Aceitar"
                                                    }
                                                },
                                                "show": true
                                            },
                                            "message": {
                                                "i18n": {
                                                    "_id": "en",
                                                    "en": "This workflow sub process is ready for acceptance."
                                                }
                                            },
                                            "reject": {
                                                "label": {
                                                    "i18n": {
                                                        "_id": "en",
                                                        "en": "Reject",
                                                        "pt": "Rejeitar"
                                                    }
                                                },
                                                "show": true
                                            }
                                        },
                                        "role": {
                                            "profile": "community",
                                            "roleId": "CommunityCapturer"
                                        }
                                    },
                                    "help": {
                                        "i18n": {
                                            "_id": "",
                                            "en": "",
                                            "pt": ""
                                        }
                                    },
                                    "postActions": [],
                                    "preActions": [],
                                    "serverAction": [
                                        {
                                            "_id": "sendworker",
                                            "_seq": 5,
                                            "description": {
                                                "i18n": {
                                                    "_id": "uuid",
                                                    "en": "test"
                                                }
                                            },
                                            "method": {
                                                "worker": {
                                                    "sendWorker": {
                                                        "rest": {
                                                            "parameters": [
                                                                {
                                                                    "parameterName": "uuid",
                                                                    "parameterValue": {
                                                                        "indicatorUUID": {
                                                                            "indicatorSetId": "testSDOTwo"
                                                                        }
                                                                    },
                                                                    "seq": 1
                                                                }
                                                            ],
                                                            "uri": "/db/test/test45.xq"
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    ],
                                    "work": {
                                        "capture": {
                                            "formView": [
                                                {
                                                    "setId": "testSDOTwo",
                                                    "views": [
                                                        {
                                                            "label": {
                                                                "i18n": {
                                                                    "_id": "uuid",
                                                                    "en": "Edit",
                                                                    "pt": "Edit"
                                                                }
                                                            },
                                                            "viewId": "edit"
                                                        }
                                                    ]
                                                }
                                            ]
                                        }
                                    }
                                }
                            },
                            "help": {
                                "i18n": {
                                    "_id": "en",
                                    "en": "Please open the form and capture data"
                                }
                            },
                            "name": {
                                "i18n": {
                                    "_id": "",
                                    "en": "Process server data"
                                }
                            },
                            "setInstanceStatusTo": {
                                "InProgress": {
                                    "label": {
                                        "i18n": {
                                            "_id": "uuid",
                                            "en": "In progress"
                                        }
                                    }
                                }
                            },
                            "transition": [
                                {
                                    "_id": "gobackToStep2",
                                    "condition": [
                                        {
                                            "spStatus": "success"
                                        },
                                        {
                                            "spStatus": "error"
                                        }
                                    ],
                                    "default": true,
                                    "name": {
                                        "i18n": {
                                            "_id": "",
                                            "en": "Revert",
                                            "pt": "enviar"
                                        }
                                    },
                                    "transitionAction": {
                                        "goToStepId": {
                                            "stepId": "localStep2",
                                            "type": ""
                                        }
                                    }
                                },
                                {
                                    "_id": "moveToNextStep",
                                    "condition": [
                                        {
                                            "spStatus": "success"
                                        }
                                    ],
                                    "default": true,
                                    "name": {
                                        "i18n": {
                                            "_id": "",
                                            "en": "Approve",
                                            "pt": "enviar"
                                        }
                                    },
                                    "transitionAction": {
                                        "goToStepId": {
                                            "stepId": "authorise",
                                            "type": ""
                                        }
                                    }
                                }
                            ]
                        },
                        {
                            "_id": "authorise",
                            "_seq": 4,
                            "description": {
                                "i18n": {
                                    "_id": "",
                                    "en": "Create the control object"
                                }
                            },
                            "function": {
                                "task": {
                                    "assign": {
                                        "assignment": {
                                            "accept": {
                                                "label": {
                                                    "i18n": {
                                                        "_id": "en",
                                                        "en": "Accept",
                                                        "pt": "Aceitar"
                                                    }
                                                },
                                                "show": true
                                            },
                                            "message": {
                                                "i18n": {
                                                    "_id": "en",
                                                    "en": "This workflow sub process is ready for acceptance."
                                                }
                                            },
                                            "reject": {
                                                "label": {
                                                    "i18n": {
                                                        "_id": "en",
                                                        "en": "Reject",
                                                        "pt": "Rejeitar"
                                                    }
                                                },
                                                "show": true
                                            }
                                        },
                                        "role": {
                                            "profile": "community",
                                            "roleId": "CommunityCapturer"
                                        }
                                    },
                                    "help": {
                                        "i18n": {
                                            "_id": "",
                                            "en": "",
                                            "pt": ""
                                        }
                                    },
                                    "postActions": [],
                                    "preActions": [],
                                    "work": {
                                        "capture": {
                                            "formView": [
                                                {
                                                    "setId": "testSDOTwo",
                                                    "views": [
                                                        {
                                                            "label": {
                                                                "i18n": {
                                                                    "_id": "uuid",
                                                                    "en": "Edit",
                                                                    "pt": "Edit"
                                                                }
                                                            },
                                                            "viewId": "edit"
                                                        }
                                                    ]
                                                }
                                            ]
                                        }
                                    }
                                }
                            },
                            "help": {
                                "i18n": {
                                    "_id": "",
                                    "en": "Please open the form and capture data"
                                }
                            },
                            "name": {
                                "i18n": {
                                    "_id": "",
                                    "en": "Create the Application profile"
                                }
                            },
                            "setInstanceStatusTo": {
                                "NotStarted": {
                                    "label": {
                                        "i18n": {
                                            "_id": "uuid",
                                            "en": "In affadavit"
                                        }
                                    }
                                }
                            },
                            "transition": [
                                {
                                    "_id": "authorise",
                                    "name": {
                                        "i18n": {
                                            "_id": "",
                                            "en": "Authorise",
                                            "pt": ""
                                        }
                                    },
                                    "transitionAction": {
                                        "goToStep": {
                                            "default": "1",
                                            "type": ""
                                        }
                                    }
                                }
                            ]
                        },
                        {
                            "_id": "completion",
                            "_seq": 5,
                            "description": {
                                "i18n": {
                                    "_id": "en",
                                    "en": "Completion"
                                }
                            },
                            "function": {
                                "actions": [
                                    {
                                        "_id": "formAuthoriseAction",
                                        "_seq": 1,
                                        "description": {
                                            "i18n": {
                                                "_id": "",
                                                "en": "test"
                                            }
                                        },
                                        "method": {
                                            "form": {
                                                "authorise": ""
                                            }
                                        }
                                    },
                                    {
                                        "_id": "formUnDraftAction",
                                        "_seq": 2,
                                        "description": {
                                            "i18n": {
                                                "_id": "",
                                                "en": "test"
                                            }
                                        },
                                        "method": {
                                            "form": {
                                                "undraft": ""
                                            }
                                        }
                                    },
                                    {
                                        "_id": "formCloseAction",
                                        "_seq": 4,
                                        "description": {
                                            "i18n": {
                                                "_id": "",
                                                "en": "test"
                                            }
                                        },
                                        "method": {
                                            "form": {
                                                "close": ""
                                            }
                                        }
                                    }
                                ]
                            },
                            "help": {
                                "i18n": {
                                    "_id": "en",
                                    "en": "Please open the form and capture data"
                                }
                            },
                            "name": {
                                "i18n": {
                                    "_id": "",
                                    "en": "Create the Project information form."
                                }
                            },
                            "setInstanceStatusTo": {
                                "Complete": {
                                    "label": {
                                        "i18n": {
                                            "_id": "uuid",
                                            "en": "Workflow Complete"
                                        }
                                    }
                                }
                            },
                            "transition": [
                                {
                                    "_id": "authoriseFormTransition",
                                    "name": {
                                        "i18n": {
                                            "_id": "",
                                            "en": ""
                                        }
                                    },
                                    "transitionAction": {
                                        "stop": {}
                                    }
                                }
                            ]
                        }
                    ],
                    "subprocessLabels": {
                        "assigned": {
                            "i18n": {
                                "_id": "",
                                "en": "Assigned"
                            }
                        },
                        "blankHistoryLabel": {
                            "i18n": {
                                "_id": "",
                                "en": "Currently there is no History Instances Found !"
                            }
                        },
                        "blankInstanceLabel": {
                            "i18n": {
                                "_id": "",
                                "en": "0 instances have been processed"
                            }
                        },
                        "capture": {
                            "i18n": {
                                "_id": "",
                                "en": "Capture"
                            }
                        },
                        "completedOn": {
                            "i18n": {
                                "_id": "",
                                "en": "Completed on"
                            }
                        },
                        "dateCompleted": {
                            "i18n": {
                                "_id": "",
                                "en": "Date completed"
                            }
                        },
                        "defaultStepMessage": {
                            "i18n": {
                                "_id": "",
                                "en": "Not started"
                            }
                        },
                        "defaultStepStatus": {
                            "i18n": {
                                "_id": "",
                                "en": "Not started"
                            }
                        },
                        "dueDate": {
                            "i18n": {
                                "_id": "",
                                "en": "Due on"
                            }
                        },
                        "dueOn": {
                            "i18n": {
                                "_id": "",
                                "en": "Due on"
                            }
                        },
                        "newInstanceAssignedSyntax": {
                            "i18n": {
                                "_id": "",
                                "en": "assigned to you"
                            }
                        },
                        "newInstanceDetails": {
                            "i18n": {
                                "_id": "",
                                "en": "List"
                            }
                        },
                        "newInstanceListSyntax": {
                            "i18n": {
                                "_id": "",
                                "en": "instances of which "
                            }
                        },
                        "newInstancecompetedSyntax": {
                            "i18n": {
                                "_id": "",
                                "en": "are completed"
                            }
                        },
                        "sequence": {
                            "i18n": {
                                "_id": "",
                                "en": "Version"
                            }
                        },
                        "startedOn": {
                            "i18n": {
                                "_id": "",
                                "en": "Started on"
                            }
                        },
                        "step": {
                            "i18n": {
                                "_id": "",
                                "en": "for Step"
                            }
                        },
                        "stepComment": {
                            "i18n": {
                                "_id": "",
                                "en": "Step comment"
                            }
                        },
                        "stepHistory": {
                            "i18n": {
                                "_id": "",
                                "en": "Step history"
                            }
                        },
                        "stepName": {
                            "i18n": {
                                "_id": "",
                                "en": "Step name"
                            }
                        },
                        "stepNumber": {
                            "i18n": {
                                "_id": "",
                                "en": "Step number"
                            }
                        },
                        "syncError": {
                            "i18n": {
                                "_id": "",
                                "en": "This sub process is out of sync"
                            }
                        },
                        "validDate": {
                            "i18n": {
                                "_id": "",
                                "en": "Valid date"
                            }
                        }
                    },
                    "variables": [
                        {
                            "dataType": "",
                            "default": "",
                            "id": "",
                            "sessionVar": "",
                            "value": ""
                        }
                    ]
                }
            ]
        },
```