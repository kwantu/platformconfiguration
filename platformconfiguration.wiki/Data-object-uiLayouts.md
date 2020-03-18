Data objects may have multiple user interface layouts.  These enable apps to present different aspects of the data model at different times.  Each uiLayouts may:

* Exclude a field defined in the data model
* Show a field defined in the data model
* Show a field as editable that is defined in the data model

Following is an example of when this may be useful.  In a project tracking app, a project registration data object may prompt a user to enter the project name, description and so on.  Once the project is active you may wish to allow users to edit some details of the project, but prevent them from changing others.  In this case you can define separate uiLayouts that are referenced in different workflows.

# Defining uiLayouts

In the example below, the configuration file has a uiLayout with the id 'edit'.  The elements referenced in this uiLayout must also be included in the data model section of the configuration file.  Following is an example of a uiLayout

```XML
<uiLayout id="edit">
                                            <panelSet id="accCepFifteen">
                                                <panelType>
                                                    <accordion>
                                                        <requireOpenedPane>false</requireOpenedPane>
                                                        <selectedIndex>0</selectedIndex>
                                                    </accordion>
                                                </panelType>
                                                <panel id="panel1">
                                                    <display show="true">
                                                        <label>
                                                            <i18n xml:lang="en">Level of influence details</i18n>
                                                        </label>
                                                    </display>
                                                    <layout id="vbPanel2" orientation="vertical">
                                                        <element ref="hasInfluencedSolutions"/>
                                                        <element ref="uploadDocs"/>
                                                    </layout>
                                                </panel>
                                               
                                            </panelSet>
                                            <layout id="buttonBar" orientation="horizontal" align="left">
                                                <button id="saveButton" type="app.save" assignName="$root" style="prominent">
                                                    <label>
                                                        <i18n xml:lang="en">Save and close</i18n>
                                                    </label>
                                                </button>
                                                <button id="validateButton" type="app.validateForm" assignName="$root" style="normal">
                                                    <label>
                                                        <i18n xml:lang="en">✓ Check form validations</i18n>
                                                    </label>
                                                </button>
                                                <button id="saveAsDraft" type="app.saveAsDraft" assignName="$root" style="normal">
                                                    <label>
                                                        <i18n xml:lang="en">Save as draft</i18n>
                                                    </label>
                                                </button>
                                            </layout>
                                        </uiLayout>
```
# uiLayout elements

uiLayouts may include the following elements.

| Tag        | Attributes / sub-elements           | Function  | Notes  |
| ------------- |:-------------| -----|-----|
| [label](https://github.com/kwantu/platformconfiguration/wiki/Data-object-label-tag) |  | Place a label specified anywhere in the layout. |  |
|   | Show      | Ability to hide the label if required | |
|  | i18n      | Specify the label in text in a language| |
|  | Element | Read the label value from another element| |
|  | calculated      | Use a calculation to specify a label| |
| [element](https://github.com/kwantu/platformconfiguration/wiki/Data-object-element-tag) |      | Place one or more elements in the order specified on the UI| |
|  | Ref      | Id of the element that should be displayed at this position| |
| [panelSet](https://github.com/kwantu/platformconfiguration/wiki/Data-object-PanelSet-tag) |      | Groups a list of elements into an accordion or tab type or wizard structure| |
|  | PanelType      | May be tabs, accordion, wizard| |
|  | Panel      | The container to add a display or any of the other display types| |
|[button](https://github.com/kwantu/platformconfiguration/wiki/Data-object-button-tag)  |      | Places a button| |
|  | Action      | Specifies the action of the button|May be linked to the form rules. |
| [layout](https://github.com/kwantu/platformconfiguration/wiki/Data-object-layout-tag) |      | Places a group of related elements |  |
|  | Id      | Id of the layout group|  |
|  | Orientation      | Way elements are structured in the layout|May be vertical / horizontal |
|  | Align      | Identifies the alignment|May be left or right. |

Each of these layout components have their own specific rules.

![Schema for uiLayouts](https://github.com/kwantu/platformconfiguration/blob/master/uiLayouts.png)

# Referencing uiLayouts

uiLayouts are referenced at the step level in the workflow configuration file.  In the example below the uiLayouts with the id "validation" for the data object with the id "sdoOutcome" will be displayed.

```javascript
"formView": [
    {
        "views": [
            {
                "viewId": "validation",
                "label": {
                    "i18n": {
                        "pt": "Editar",
                        "_id": "uuid"
                    }
                }
            }
        ],
        "setId": "sdoOutcome"
    }
]
```