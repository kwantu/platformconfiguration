Created by Rob Worthington, last modified on Dec 18, 2017. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+configure+overdue+notifications) on 2018-12-17.

### Introduction
General notifications are triggered when a workflow step begins or ends or a process is re-assigned.  Overdue notifications are triggered based on a data or time.  Once configured a scheduler will check when the correct date or time has been reached and trigger the notification.  

This enables you to configure notifications such as:

* Alert a user two days before the due date is reached
* Alert a user five days after a step started
* Alert a user when a specified date has been reached

### Configuration options
The following configuration options are available when you add the schedule block to your notification:

|Element type|Parameter|Explanation|Example|
|------------|---------|-----------|-------|
|`executeCommand`|Due date	|This schedules a notification based on the due date specified for the workflow process|`dueDate`|
|`executeCommand`|Valid date	|This schedules a notification based on the valid date specified for the workflow process|`validDate`|
|`executeCommand`|Current time	|This schedules a notification based on the |`currentTime`|
|`executeCommand`|Specified time	|This schedules a notification based on the |`specifiedTime` `2017-12-06T16:59:03+05:30`|
|`executeCommand`|Step created date	|This schedules a notification based on the date the current step was created|`stepCreatedDate`|
|executeCommand|Now	|The notification is triggered immediately	|now|
|factor|Minutes	|This uses minutes as the unit|minutes|
|factor|Hours	|This uses hours as the unit	|hours|
|factor|Days	|This uses days as the unit	|days|
|factor|Weeks	|This uses weeks as the unit	|weeks|
|factor|Months	|This uses months as the unit	|months|
|factor|Quarters	|This uses quarters as the unit	|quarters|
|factor|Years	|This uses years as the unit	|years|
|unit|Integer	|This is the number of units. May use negative to send a notification before the specified date.	|5|
|frequency|Integer	|This is how often the notification repeats, once it has initially been triggered. You may leave this out of you do not required	|2|
|frequency|everyXMinute	|This is the units for how often the notification repeats 
|frequency|everyXWeek	|
|frequency|everyXDay|	
|frequency|everyXMonth|	
|frequency|everyXMonth|
|frequency|everyXQuarter|	
|frequency|everyXYear|

The following example shows the schedule block that can be added to any step level notification.

### 1. Code example 
```javascript 
                                                    "schedule": {
                                                        "executeCommand": {
                                                            "stepCreatedDate": {
                                                                "factor": "minutes",
                                                                "unit": 2
                                                            }
                                                        },
                                                        "repeat": {
                                                            "frequency": {
                                                                "everyXDay": 1
                                                            }
                                                        },
                                                        "state": "submitted"
                                                    }
```
The following example shows the full notification block that can be inserted into the pre or post action area for any step in the workflow.

### 2. Example code
```javascript
                                        {
                                            "_id": "wfNotificationEmailNew",
                                            "_seq": 1,
                                            "description": {
                                                "i18n": {
                                                    "_id": "",
                                                    "en": "test"
                                                }
                                            },
                                            "method": {
                                                "notification": {
                                                    "message": {
                                                        "default": {
                                                            "i18n": {
                                                                "_id": "en",
                                                                "en": "Due date ",
                                                                "pt": "THIS IS DEFAULT MESSAGE WITH SOME REPLACEMENTS AS WELL"
                                                            }
                                                        },
                                                        "rtf": {
                                                            "markup": {
                                                                "i18n": {
                                                                    "_id": "en",
                                                                    "en": "Please process as due date is approaching Message",
                                                                    "pt": "THIS IS  MESSAGE WITH SOME REPLACEMENTS AS WELL"
                                                                }
                                                            }
                                                        },
                                                        "title": {
                                                            "i18n": {
                                                                "_id": "en",
                                                                "en": "Please process as due date is approaching Title",
                                                                "pt": "THIS IS  title WITH SOME REPLACEMENTS AS WELL"
                                                            }
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
                                                                "en": "Reject",
                                                                "pt": "Rejeitar"
                                                            }
                                                        }
                                                    },
                                                    "notificationType": "system",
                                                    "priority": "normal",
                                                    "recipients": {
                                                        "stepAssignee": {}
                                                    },
                                                    "schedule": {
                                                        "executeCommand": {
                                                            "stepCreatedDate": {
                                                                "factor": "minutes",
                                                                "unit": 2
                                                            }
                                                        },
                                                        "repeat": {
                                                            "frequency": {
                                                                "everyXDay": 1
                                                            }
                                                        },
                                                        "state": "submitted"
                                                    }
                                                }
                                            }
                                        }
```