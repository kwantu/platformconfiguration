This page was originally the [**2. Settings section**](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component#2-settings-section) part of the [Data object component](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component) page and was moved here on 2018-01-07 because that page had become too unwieldy.


***
# Settings section

This section relates to all the tags under the `component.configuration.indicator.set.version.settings`<br>
This section defines the following three aspects of a data object:
* Heading name
* The "Privacy settings" tag, which isn't currently used and is a placeholder for future reference.
* The user interface templates which are relevant for this data object
* Unique key constraints.

These are shown in the following code **example**:

```XML
<settings>
    <heading>
        <i18n xml:lang="en">Business unit category</i18n>
    </heading>
    <privacy>...</privacy>
    <uiTemplates>
        <uiTemplate id="document_edit" name="Create/Edit View" mode="edit" uiLayoutId="edit">
            <uiDevice deviceType="Web"/>
            <uiDevice deviceType="Android"/>
        </uiTemplate>
        <uiTemplate id="document_read" name="View" mode="readonly" uiLayoutId="read">
            <uiDevice deviceType="Web"/>
            <uiDevice deviceType="Android"/>
        </uiTemplate>
    </uiTemplates>
    <constraints> <!--duplicate check codes -->
        <unique>
            <element id="practicalDefCode"/>
            <scope>community</scope>
        </unique>
    </constraints>
</settings>
```
**Define the heading:** <br>
`uiTemplate.heading`: This is a natural language heading for the data object. The **example** in is from the `<i18n>` xml element tag, which is the Kwantu platform standard for natural language text. The `xml:lang="en"` attribute is set to **en** which is for English. <br>
**Define user interface templates:** <br>
A user interface template becomes a view on the data object that can be called from the workflow. Multiple views can be defined, and a view can be differentiated between types of environment in which they will be rendered, such as between a web page and a mobile device. <br>
It is important to note that the uiTemplates defined here are specified in detail in the `uiLayouts` section covered in the next section. They are linked together by way of the value of `uiLayouts.uiLayoutId` key value.<br>
The `uiTemplates` tag contains one or more `uiTemplate` structures, that each defines a user interface layout, that will become a view when transformed and is rendered.<br>
Each `uiTemplate` has the following structure containing four(4) attributes (id, name, mode, uiLayoutId) and anynumber of <uiDevice> XML element tags.:
* `uiTemplate.id`: this is a unique id for this template in the data object, and is used by the transformer.
* `uiTemplate.name`: this describes the user interface template.
* `uiTemplate.mode`: this takes one of two values 'edit'/'readonly' and defines if data may be edited in this view.
* `uiTemplate.uiLayoutId`: this id links to the detailed user interface layout specifiation in the next section.
The <uiDevice> XML element tags have the following attributes:
* `uiTemplate.uiDevice.deviceType` which may refer to the following device types supported currently: ['Web','Android']
<br>

Any unique key constraints in the data may be defined when a data field has to comply with a unique constraint across all data instances of the data object in the community. The unique key constraints are defined as follows:
* `constraint.unique.element.id` which refers to an element id defined in the elements section
* `constraint.unique.scope` which currently may only be the value 'community' and defines the scope of the unique key
