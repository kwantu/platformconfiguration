This page is referenced from  the [**7. Element field**](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component#7-element-field) part of the [Data object component](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component) page and was cross referenced here on 2018-01-07 with other sub pages that have been created because that page had become too unwieldy.


***
This page describes the implementation of the fundamental concept of a user interface field. The elField is the core element type, where we are dealing with a single value to be stored.

![](https://github.com/kwantu/platformconfiguration/blob/master/elField%20tag.png)

| Tag        | Attributes / sub-elements        | Function  | Notes  |
| :------------- |:-------------| :-----|:-----|
|   | id | Uniquely identifies the element, and becomes the name of the element in the data model | |
| displays | widgets   | Models the way that the element will be displayed in different contexts | Follows the generic displays functionality that has been discussed elsewhere |
| FieldData | DataType | Specify the data type of the field | See the valid list of data types below|
| | DataFormat | Formatting rules for the data type | See the valid list of formats below|

Defines that the model created is a single valued property for example if the id of<elField id="testBox"> is "testBox" than generated data model will be in XML is:

```
<testBox></testBox>
```
Below is example of a elField
```XML
<elField id="testBox">
  <displays>
  <display show="true" mode="edit" widget="textbox">
    <label show="true">
    <i18n xml:lang="en">This is Textbox</i18n>
    <i18n xml:lang="pt">This is Textbox</i18n>
    </label>
  </display>
  <display show="true" mode="readonly" widget="label">
    <label show="true">
    <i18n xml:lang="en">This is Textbox</i18n>
    <i18n xml:lang="pt">This is Textbox</i18n>
    </label>
  </display>
  </displays>
  <fieldData dataType="string"/>
</elField>
```
The display of an elField is managed by is its display tag
```XML
<display show="true" mode="edit" widget="textbox">
  <label show="true">
    <i18n xml:lang="en">This is Textbox</i18n>
    <i18n xml:lang="pt">This is Textbox</i18n>
  </label>
</display>
```
Show="true" says this is displayed and visible, making it to false will hide this entire control. The mode="edit" says that this display is applicable in edit mode. The widget="textbox" says that user interface component will be a textbox which is applied on this data model element. See a list of applicable widgets in the final chapter. The label itself can be turned off or on with show="true" in the label element, therefore it determines if you need to display a label in front of the textbox or whether it is without a label. The value of the label itself is within the i18n tag for each specified language.

In the same context, the way the control displays in read-only mode is also defined. In this case the mode is 'readonly'. As in the section below, it states that the read-only mode displays the field as a label, by choosing the widget as a 'label'. So if you need to render a radio button, create a elField element and within display of the mode (edit/readonly whichever you want) place widget = "radio". It will display the radio on specified elField.

```XML
<display show="true" mode="readonly" widget="label">
  <label show="true">
    <i18n xml:lang="en">This is Textbox</i18n>
    <i18n xml:lang="pt">This is Textbox</i18n>
  </label>
</display>
```
The data characteristics are defined by the fieldData tag:
```XML
<fieldData dataType="string"/>
```
In this fieldData tag we can define one or more field level validations to employ. In the example below the type="required" specifies that the field is required, and may not be left empty. If the validation fails, the error message specified will be generated. See the annexure for the possible values for the validation type

```XML
<validations>
  <validation seq="1">
    <simple type="required" dataType="boolean" value="true"/>
    <errorMessage>
      <i18n xml:lang="en">Please select an option</i18n>
      <i18n xml:lang="pt">Please select an option</i18n>
    </errorMessage>
  </validation>
</validations>
```
## Full elField example

```XML
<elField id="testBox">
  <displays>
    <display show="true" mode="edit" widget="textbox">
        <label show="true">
        <i18n xml:lang="en">This is Textbox</i18n>
        <i18n xml:lang="pt">This is Textbox</i18n>
        </label>
    </display>
    <display show="true" mode="readonly" widget="label">
        <label show="true">
        <i18n xml:lang="en">This is Textbox</i18n>
        <i18n xml:lang="pt">This is Textbox</i18n>
        </label>
    </display>
  </displays>
  <fieldData dataType="string"/>
  <validations>
    <validation seq="1">
        <simple type="required" dataType="boolean" value="true"/>
        <errorMessage>
        <i18n xml:lang="en">Please select an option</i18n>
        <i18n xml:lang="pt">Please select an option</i18n>
        </errorMessage>
    </validation>
  </validations>
</elField>
```