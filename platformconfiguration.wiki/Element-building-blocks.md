This page was originally the [**6. Element building blocks**](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component#6-element-building-blocks) part of the [Data object component](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component) page and was moved here on 2018-01-07 because that page had become too unwieldy.


***
# 6. Element building blocks
Each element from the following list, (`elfield`, `elSelect`, `elUpload` and `elRepeat`), contains (or is made up of) reusable blocks called "element blocks", to coin a phrase.  These "element blocks" are described in the following paragraphs: (6.1 `displays`, 6.2 `data`, 6.3 `fieldData`, 6.4 `validations`, 6.5 `help` )<br> 

## 6.1) User interface displays
A vital concept to understand is the link between a specific `uiLayout` and a user interface `display`. This link is implemented by making the value of the `.displays.display.mode` attribute identical to the relevant `.uiLayouts.uiLayout.id` to which it links. (note: The `mode` attribute is poorly named. It should actually be called `uiLayoutId`, because that is what its value refers to. [2018-01-03]) <br>
The following code snippet shows the structure of the display element block:
**Example code 6**
```XML
<displays>
    <display show="true" mode="edit" widget="combobox">
        <label show="true">
            <i18n xml:lang="en">To what extent do you feel you have  influence over solutions to issues identified in your community?</i18n>
        </label>
        <showIf operator="Equal" value="Other" datatype="string">
            <Element ElementID="idOfTheOtherField"/>
        </showIf>
        <showIf operator="Equal" value="yetOther" datatype="string" join="or">
            <Element ElementID="idOfTheOtherField"/>
        </showIf>
        <style width="60%"/>
    </display>
</displays>
```
**displays** is the container containing as many display element blocks as there are uiLayout templates defined.<br> 
**display** is the set of attributes and tags that manages the way the element is displayed or rendered in the specific view. The display tag contains the following attributes:
* **`show`** can take a value of true/false and determines if the element should display at all in the uiLayout.
* **`mode`** contains the reference to the uiLayout in which it will render. (see above ....)
* **`widget`** defines the display widget that will be used in the uiLayout to render the element. A comprehensive list of widgets available for different elements are presented below. [**widget**](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component#widgets)
* **`label`** is the block that contains the natural language text of the label of the element. 
    * **`show`** is the attribute to control whether the label should render, or only the data element. If the show is set to false, the label will not render.
    * **`i18n`** is the tag for the label in a specific language. and data part and the label renders in the selected language. Multiple language labels may be defined.
    * **xml:lang="en"** this attribute specifies the language. The value `"en"` is the ISO 639-1 code for English.     
* **`showIf`** - The `showIf` tag allows for a conditional rendering of the element as a whole determined by a logical condition based on the value of another field. If the `showIf` tag is present, the user interface logic looks to the `showIf` conditional XML tag node set, which evaluates to true or false. If the condition evaluates to true, then the field displays in the user interface, otherwise it does not. The conditionality is defined by the folliwing attributes and tags:
    * **`operator`** is an attribute with possible values of: (`"Equal"`, `"GreaterThan"`, `"GreaterThanOrEqual"`, `"LessThan"`, `"LessThanOrEqual"`, `"MaxLength`", `"NotEqual"`, `"NotNull"`, `"Required"`, `"UniqueInColumn"`, `"UniqueInDomain"`).  
    * The **`value`** attribute contains the value to which the contents of the other field must be compared.
    * The **`Element`** tag contains the identity of the other field in the component to be compared, by specifying the value of that field's identity in the **`ElementID`** attribute value. In the example code the id of the other field is `"idOfTheOtherField"`.
    * The **`join`** attribute can have values of **`"or"`** / **`"and"`** and can be used in subsequent repeating `showIf` tags beneath each other. In this case, each `showIf` tag is evaluated in turn and the true/false result of each, is linked together with a logical of the `join` value. This produces something like: `showIf` or `showIf` or `showIf` ... , meaning that if any one of the `showIf`s is true, the evaluation stops and the display remains on.
* **`style`** is a tag with the `width` attribute
    * **`width`** attribute specifying a value as a "00%" of the panel that the display element may occupy. 


### Widgets

The element types above may be used to render many user interface element displays. The table below shows the user interface widgets and which data object element types may contain them.

| #  | Type         | Widget  | Notes  |
| -: |:-------------| :-----|:-----|
|  1 | `elField`  | `link` |Displays a hyperlink |
|  2 | `elField`  | `textbox` |Normal text box |
|  3 | `elField`  | `textarea` |Memo area |
|  4 | `elField`  | `richbox` |Rich text area | <rob>
|  5 | `elUpload`  | `fileUpload` |Displays a file upload link or photo button |
|  6 | `elField`  | `checkbox` |Checkbox |
|  7 | `elField`  | `datePicker` |Date chooser |
|  8 | `elField`, <br> `elUpload`, <br> `elSelect`  | `label` |A natural language text label |
|  9 | `elField`  | `richlabel` |Rich text label | <rob>
| 10 | `elSelect` | `combobox` |Drop down combobox |
| 11 | `elField`  | `image` |Image |
| 12 | `elField`  | `video_edit` |Video object | <rob>
| 13 | `elField`  | `video_object` |Video object | <rob>
| 14 | `elField`  | `preview` |Document preview |
| 15 | `elField`  | `iframe` |iframe | <rob>
| 16 | `elField`  | `radio` |Radio button |
| 17 | `elUpload` | `image` |Upload an image file |
| 18 | `elUpload` | `download` |Download a previously uploaded image or file. Deprecated?| <rob>
| 19 | `elUpload` | `upload` |Upload a file |
| 20 | `elUpload` | `preview` |Preview a previously uploaded image or file. Pared with `camera` |
| 21 | `elUpload` | `camera` |Upload an image file directly from the camera. Pared with `preview` |


## 6.2) Data references
* The **`data`** tab only appears in the following two element type XML tab node sets and the structure in each is different from the other: 
    * **`elField`**  Refer to the element type [`elField`]()
    * **`elSelect`** Refer to the element type [`elSelect`](https://github.com/kwantu/platformconfiguration/wiki/elSelect)


## 6.3) Field level meta data
**`fieldData`** is the container that controls four aspects of data in a field, which are: The type; the format; whether it's indexed or not; and its default value. 
```XML
<fieldData dataType="string" dataFormat="text" index="true">
    <default>
        <value>Active</value>
    </default>
</fieldData>
```

* The **`dataType`** attribute ensures that only that data type can be captured. 

**Table of data type attribute values:**

| **`dataType`**  |
| :-------------: |
| string          |
| integer         |
| float           |
| decimal         |
| memo            |
| date            |
| dateTime        |
| boolean         |
| number          |
| element         |
| currency        |

* The **`dataFormat`** attribute controls the display format according to the value of the attribute.

**Table of data format attribute values:**

| **`dataFormat`** |
| ---------------: |
|string            |
|integer           |
|float             |
|email             |
|URI               |
|date              |
|coordinateDMS     |
|geoPoint          |
|yesNo             |
|boolean           |
|text              |
|html              |
|richText          |
|currency          |
|#,##0             |
|memo              |
|Rmil #,##0.0      |
|#,##0.00          |
|R #,##0.00        |

* The **`default`** tag contained in the `fieldData` tag provides a `value` tag which contains the default value of the field. Though tags are generally used when multiple occurrences are possible, it only makes sense to have a single `default` tag in the `fieldData` tag.
* The `index` attribute is used to indicate 


## 6.4) Field level validation
* **`validations`** are sequentially ordered constraints imposed on the input data of a field. There can be any number of `validation` tags. They can be `simple` or`complex` <rob>. The `simple` tag has the following three attributes:
    * `type` has possible values of ("required", "...") <rob>
    * `dataType` has possible values of ("boolean", "...") <rob>
    * `value` has possible values of ("true", "false","NUMERIC","string","blob" "...") <rob>
    * <rob>. An example follows:
```XML
<validation seq="1">
    <simple type="required" dataType="boolean" value="true"/>
    <errorMessage>
        <i18n xml:lang="en">This field is required</i18n>
    </errorMessage>
</validation>
```

## 6.5) Field level help
**`help`** presents on the user interface as a link to a help text specific to the element. It is multi language enabled, and the browser will select the correct language if available.

* The **`show`** attribute have possible values of: ("true" or "false"). If it is false the help link does not appear.
* **`i18n`** is the natural language help text.
    * **`xml:lang`** is natural language code attribute following the i18n standard which is selected by the browser as appropriate depending on the browser language settings.

```XML
<help show="true">
        <i18n xml:lang="en">Please select an option</i18n>
</help>
```
