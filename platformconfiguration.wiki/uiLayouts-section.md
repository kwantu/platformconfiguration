This page was originally the [**3. uiLayouts section**](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component#3-uilayouts-section) part of the [Data object component](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component) page and was moved here on 2018-01-07 because that page had become too unwieldy. 


***
# uiLayouts section
* This section relates to the previous **`uiTemplates` section**. It is linked through the key value of `.uiLayouts.uiLayout.Id` and of `.uiTemplates.uiTemplate.id` being identical. 
A user interface layout contains two parts: 
    * The "panel set"; and 
    * The "layout". <br>
Refer to the structure in **Example** code 3a below.

**Example code 3a:**
```XML
<uiLayouts>
	<uiLayout id="edit">
		<panelSet id="accCepFifteen">
                    ... (Refer to Example code 3b:)
		</panelSet>
		<layout id="buttonBar" orientation="horizontal" align="left">
                    ... (Refer to Example code 3c:)
		</layout>
	</uiLayout>
</uiLayouts>
```
The **panel set** consists of the following two XML element tags: 
* `.panelSet.panelType.panelType` - The possible types are: `accordion`, ``, ... <rob> ``; and 
* `.panelSet.panelType.panel` The panel has some `.panelSet.panelType.panel.display` controls like: `.panelSet.panelType.panel.display.show` to control visibility and a `.panelSet.panelType.panel.display.label` to identify it for the user from the user interface point of view;  and a `.panelSet.panelType.panel.display.layout` which lists the element `.panelSet.panelType.panel.display.layout.ref` **id** of each `element` that is linked to this panel.

**Panel set** - **Example code 3b:**
```XML
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
```
The `uiLayouts` XML element tags are described as follows:
* `uiLayouts.uiLayout.id` The `id` is a unique identifier of a specific user interface layout.
* `uiLayouts.uiLayout.panelSet.id` The `id` is a unique identifier of a panel set.
* `uiLayouts.uiLayout.panelSet.panelType.accordion.requireOpenedPane` This tag optionally forces the user to open the pane and has possible values of (`true` or `false`).
* `uiLayouts.uiLayout.panelSet.panelType.accordion.selectedIndex` This is the default index number for the panel set. There can be several indexes on the data object but only one can be associated with this panel.
* `uiLayouts.uiLayout.panelSet.panel.id` The `id` is a unique identifier of a specific panel in a user interface layout.
* `uiLayouts.uiLayout.panelSet.panel.layout.button.label.i18n.#text` - This is a natural language label for the button. The example is: "Save and close".



**Lay out** - **Example code 3c:**
```XML
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
```
The second part of the "user interface layout" section is the `layout` XML element tag, which contains widgets like the three `button`s in the **example**. The possible set of widgets is: (`button`, `...`, `...`,`...`, `...` , `...`) <rob> <br>
`.uiLayouts.uiLayout.layout.button` has the following attributes:
* `.layout.button.id` which is a unique  identifier;
* `.layout.button.type` equals one of the following possibilities: ("app.save", "app.validateForm", "app.saveAsDraft"); and
* `.layout.button.style`  equals one of the following possibilities: ("prominent", "normal")
