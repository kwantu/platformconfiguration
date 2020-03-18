This page was originally the [**8. Element select**](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component#8-element-select) part of the [Data object component](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component) page and was moved here on 2018-01-07 because that page had become too unwieldy.

***

# A. Introduction

The concept of a pick-list in the user interface is configured through the `elSelect` element type. This page describes the `elSelect` (element type and how it works) in detail. The `elSelect` tab is one of the 4 possible element types in the `elements` XML tab container.   The **`elSelect`** is an element type within the `elements` user interface tab. The possible element types are: ( [`elfield`](https://github.com/kwantu/platformconfiguration/wiki/elField), [`elSelect`](), [`elUpload`](https://github.com/kwantu/platformconfiguration/wiki/elUpload), [`elRepeat`](https://github.com/kwantu/platformconfiguration/wiki/elRepeat) ).  There is a page dedicated to each.

*** 
# B. The structure of the elSelect element
<br>
The following is a screenshot of the `elSelect` XML schema definition, as viewed from the Oxygen XML editor, provides an overview of the elSelect element that is defined by an elSelect tag and the "element blocks".

| The elSelect tag: |
| :---------------- |
|![](https://github.com/kwantu/platformconfiguration/blob/master/elSelecttag.png)|

The structure of this element is demonstrated in the following example:

**The XML tag structure of the element `elSelect`** - **Example code**
```XML
<elSelect id="levelOfInfluenceDetails">
    <displays>
        <display show="true" mode="edit" widget="combobox">
            ...
        </display>
        <display show="true" mode="readonly" widget="label">
            ...
        </display>
    </displays>
    <data>
        ...
    </data>
    <fieldData dataType="string"/>
    <validations>
        ...
    </validations>
    <help show="true">
        ...
    </help>
</elSelect>
```

## B1. id Attribute
The `id` attribute identifies it uniquely in the data object configuration file.<br>

Furthermore, the `id` attribute defines the field name with the same name in the data model. Therefore make sure that the `id` attribute value has no characters that are not allowed in a json tag.<br>
In the case of the `elSelect` the field in the data model for the `elSelect` element also has two child elements:
1. **code** which holds the code from the lookup taxonomy or search
2. **label** which holds the user visible label from the taxonomy or search. 

In the `elSelect` example below, the `id` value was a "provinceOnly" data model, which is created automatically as follows:

```javascript
{ "provinceOnly":
  {
  "code": "ec"
  "label": "Eastern Cape"
   }
}
```

## B2. The `displays` tag

The `elSelect` uses the common `displays` tag shared with other element types. The `displays` tag is described in the <link to the shared page here> [Data object component](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component) page.

## B3. The `data` tag

The `data` tag contains the links to the "lookup taxonomy" or "search" that will be used to populate the element. It contains the following two tabs outlined in the example below: <br>

```XML
<data>
    <taxonomy id="provinceOnly" ref="provinceOnly" name="provinceOnly" baseExpr="TaxonomyItems/Item" sortExpr="Name/Int[@xml:lang = 'en']">
        <codePath name="code">@Code</codePath>
        <labelPath name="label">Name/Int[@xml:lang = 'en']</labelPath>
    </taxonomy>
    <subElements>
        <assignSubElement id="code" dataType="string" sourcePath="code"/>
        <assignSubElement id="label" dataType="string" sourcePath="label"/>
    </subElements>
</data>
```
The **`data`** tag consists of the following tags:<br>
**1. taxonomy**, which specifies where the data is taken from. It contains a reference to the `taxonomyId` in the application configuration file.
(**Note:** The **`taxonomy`** tag is an indirect link to a taxonomy in the "taxonomy database" or a search from the "local database". It finds the taxonomy file in the following way: 
   * **first** find the entry for the taxonomy or search in the the **__app config file's `"taxonomies" [...]` array__**, which looks like the following code snippet from the [Application configuration file](https://github.com/kwantu/platformconfiguration/wiki/Application-configuration-file) and
   * **second** it uses the `uuid` found there as the key to retrieve the the actual taxonomy from the taxonomy database:

```javascript
"taxonomies": [
	{
		"global": {
			"version": "1",
			"id": "provinceOnly",
			"uuid": "provinceOnly"
		}
	},
        ...
```

The following tabs are contained in the `taxonomy` tab:
* The **`codePath`** tab specifies the xQuery codePath that will retrieve the picked item code that will be returned from the UI pick-list.
* The **`labelPath`** tab  The label path is a natural language receptacle for the natural language label that the pick-list returns when the user selects an item from it.

**2. subElements** tag, which contains the mapping instructions to which selected items' data are saved in the data model in the code and label tags. These are contained in the following pair of `assignSubElement` tags, each of them with an `id`, a `dataType` and `sourcePath` attribute. Note that the `assignSubElement` tag is responsible for creating the child fields in the elSelect element. By convention there are two child fields that are created: A `code` and a `label` field.<br>

Each `assignSubElement` has three attributes that manages the process:
1. **`id`** tag behaves in the same manner as the element id attribute, and defines the field name. By convention the platform currently support two sub-fields, one for the code and one for the label.
2. **`dataType`** which is the data type of the sub-field that is created. See **Table of data type attribute values:** on the [Data object component](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component) page.
3. **`sourcePath`** points to the `codePath` or `labelPath` child tags in the `taxonomy` tag described above. Therefore the values may only be valid given the `name` attribute defined there. <br>
Note that this structure will be generalised in future to give full control over the creation of child elements and making taxonomies more generic.

**3. filters**, which is an optional tag used only in dependent taxonomies. A dependent taxonomy is one where the value of the `elSelect` that may be selected is filtered based on another value provided in either an `elSelect` element, or a `elField` element in the same data object. Note that these two cases are dealt with slightly differently.

The `filters` tag is the 'taxonomy linking mechanism' for defining a hierarchy of pick-able items which the user drills into. The following is a logical description of its organization and how it works. Every time an item is selected from a pick-list from a level or sub level in that hierarchy, the user is presented with a pick-list only containing data related to the previously selected item from the previous presentation of the pick-list.  The hierarchy is implemented as a cascade of related data files stored in the taxonomies database.  <br>

The second level taxonomy is the `districtOnly` taxonomy, which lists the districts per province selected. The code below is an example. Note that the `filter` tag contains a <br>
* **`filterElement`** tag which points to the element in the data object on which this second taxonomy will be filtered. 
* **`element`** tag contains an instruction set on which value to extract from the filterElement above. In the example below the reference element province is an elSelect element type, and therefore it specifies that the value should be read from the `<subElement elementId="province" subElementId="code"/>` code child tag value.
* **`indicatorSet.Scope="currentUUID"`** is currently the only supported scope. It can only read values from the current instance of the data object. Therefore the `indicatorSet.indicatorId` and `indicatorSet.setId` attributes have no value at the moment, thereby referring to the current instance only. 

**The following is an actual example of the `data` section with a `filter` tab in it:**
```XML
<data>
    <taxonomy id="districtOnly" ref="districtOnly" name="districtOnly" baseExpr="TaxonomyItems/Item" sortExpr="Name/Int[@xml:lang = 'en']">
        <codePath name="code">@Code</codePath>
        <labelPath name="label">Name/Int[@xml:lang = 'en']</labelPath>
            <filter>
                <filterElement>province</filterElement>
                <filterValue operator="equal">
                <!--<value></value>-->
                <element dataType="string" id="">
                    <indicatorSet indicatorId="" setId="" Scope="currentUUID" dataType="string">
                        <subElement elementId="province" subElementId="code"/>
                    </indicatorSet>
                </element>
                </filterValue>
            </filter>
    </taxonomy>
<subElements>
    <assignSubElement id="code" dataType="string" sourcePath="code"/>
    <assignSubElement id="label" dataType="string" sourcePath="label"/>
</subElements>
</data>
```


**Naming of dependent taxonomy files: Example of Province and district taxonomies** <br>

The way in which the platform implements dependent or filtered taxonomies, is by defining each filter value, and presenting the secondary taxonomy in a discrete number of files, each relating to the value being used to filter. This is done for performance reasons, so that filtered lists of tens of thousands of items in a taxonomy may be managed effectively, especially in offline and low bandwidth conditions. <br>

In the example below, the structure of the dependent taxonomy file naming conventions are presented:<br>

The first level taxonomy for provinces has already been shown in the code above. Lets presume the following table shows the potential values for the province taxonomy. 

|#| code | label                |
|-| ---- | -------------------- |
|1| ec   | Eastern Cape         |
|2| nc   | Northern Cape        |
|3| wc   | Western Cape         |

The user selected item 1 for the Eastern cape in the `elSelect` element with the `id` 'province'. The table below represents the way in which the two taxonomies are defined in the application config file. Note that the dependent taxonomy is saved in multiple files for the second taxonomy, each representing a filtered list based on a selection from the fist taxonomy.

|#| Taxonomy id | Taxonomy version | Taxonomy UUID | Taxonomy file name in the database |
|-| ----------- | ---------------- |-------------- |----------------------------------- |
|1| provinceOnly| 1 |provinceOnlyFile | `provinceOnlyFile_1` |
|2a| districtOnly| 1 | districtOnlyFile | `districtOnlyFile_1_provinceOnlyFile_1_ec` |
|2b| districtOnly| 1 | districtOnlyFile | `districtOnlyFile_1_provinceOnlyFile_1_nc` |
|2c| districtOnly| 1 | districtOnlyFile | `districtOnlyFile_1_provinceOnlyFile_1_wc` |

To understand the example above, consider that `provinceOnly_1` is the actual top-level taxonomy file in the taxonomies database. This file contains a list of all provinces in a country. The `provinceOnly` level consists only of one single file. <br>
For the second level (dependent or filtered) taxonomy, the file is broken up into as many files as there are values on which needs to be filtered. In our example above, the `provinceOnly` taxonomy had three provinces. Therefore there will be three files for the dependent taxonomy. The dependent taxonomy file name is constructed with the following elements:
1. `districtOnlyFile` which is the uuid of the of the districtOnly taxonomy in the application config file.
2. `_1` which is the version of the of the districtOnly taxonomy in the application config file joined with an `_`.
3. `provinceOnlyFile` which is the uuid of the of the provinceOnly taxonomy in the application config file joined with an `_`.
4. `_1` which is the version of the of the provinceOnly taxonomy in the application config file joined with an `_`.
5. `ec` which is the value specified in the `filter` tag of the secondary taxonomy. In our example this is the 'province.code' field value.
Consequently, the platform will render the list of items in the `districtOnlyFile_1_provinceOnlyFile_1_ec` taxonomy file, when the user has selected the value of Eastern Cape in the province element. If the user selected Northern Cape then the platform will render the list of items from a different taxonomy file, i.e. `districtOnlyFile_1_provinceOnlyFile_1_nc`


**NOTE: The following two vital things need to be understood about the `data` tag:**
1. The `.elSelect.data.taxonomy.id` attribute value must be exactly same value as that of the `taxonomies.global.id` attribute value, which in this example is `"provinceOnly"`. What the platform does at run-time is to look-up the matching array element `id` and retrieve the `"uuid": ` value. It is the `uuid` value that points to the required taxonomy in the taxonomies database. Refer to [Create an app](https://github.com/kwantu/platformconfiguration/wiki/Create-an-app). Don't be fooled by the fact that the `id` and the `uuid` are the same value in the example, because they may be different in other instances, when a lower level taxonomy overrides the generic top level taxonomy. They are simply the same here for convenience sake.
2. At run-time, when the taxonomy is retrieved and presented to the user in the user interface as a pick list, two values will be returned from the pick-list by the act of selecting an item from within the pick-list and that is where the **`subElements`** tag comes into play, providing a mapping return mechanism for the data from the pick list to the data object.

This is the mechanism by which taxonomies are defined in the taxonomy database and referenced in multiple other configuration files. The  `elSelect` element is the only element that contains `data` references. No other element has a `data` XML tag. Data references are indirect pointer-links to data files stored in the taxonomy database.


## B4. The `validations` tag


## B5. The `help` tag

***
# C. Example elSelect XML code snippet
```XML
<elSelect id="testCombo">
  <displays>
  <display show="true" mode="edit" widget="combobox">
    <label show="true">
    <i18n xml:lang="en">This is Combobox</i18n>
    <i18n xml:lang="pt">This is Combobox</i18n>
    </label>
  </display>
  <display show="true" mode="readonly" widget="label">
    <label show="true">
    <i18n xml:lang="en">This is Combobox</i18n>
    <i18n xml:lang="pt">This is Combobox</i18n>
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
  <data>
  <taxonomy id="UserLookupTaxonomy" ref="UserLookupTaxonomy" name="UserLookupTaxonomy" baseExpr="TaxonomyItems/Item" sortExpr="Name/Int[@xml:lang = 'en']">
    <codePath name="code">@Code</codePath>
    <labelPath name="label">Name/Int[@xml:lang = 'en']</labelPath>
  </taxonomy>
  <subElements>
    <assignSubElement id="code" dataType="" sourcePath="code"/>
    <assignSubElement id="label" dataType="" sourcePath="label"/>
  </subElements>
  </data>
</elSelect>
```



