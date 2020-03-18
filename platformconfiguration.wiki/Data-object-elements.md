Elements are the building blocks of the DO data model. They hold the information regarding the type of data storage field that is created in the data model, its data type, its size, its user interface type, validations, any help associated, constraints etc. <br>

| **Data object elements** |
| :-------------------- |
| ![](https://github.com/kwantu/platformconfiguration/blob/master/dataobjectElements.png)|

Each element has an id, which is used to refer to the element in the layout section. Different elements are defined within the <elements> section, in any order, but the order in which they are placed in the layout under Step 8, will be displayed here in the interface. However, in the **XML data model**, the order in which the elements are specified determines the order in the model. Typically, the id of the element is used to become the `<elements>` tag in the data model.

There are three basic element types:

* [elField](https://github.com/kwantu/platformconfiguration/wiki/elField)
* [elSelect](https://github.com/kwantu/platformconfiguration/wiki/elSelect)
* [elRepeat](https://github.com/kwantu/platformconfiguration/wiki/elRepeat)

# Data Types

The following is a list of the data types used in the platform.  The choice of the data type affects the validations and calculations that can be applied.  It also affects layout in reporting.

* `<xs:enumeration value="string"/>` 
* `<xs:enumeration value="integer"/>` 
* `<xs:enumeration value="float"/>` 
* `<xs:enumeration value="decimal"/>`
* `<xs:enumeration value="memo"/>` 
* `<xs:enumeration value="date"/>` 
* `<xs:enumeration value="dateTime"/>`
* `<xs:enumeration value="boolean"/>` 
* `<xs:enumeration value="number"/>`

Please see this guide on how to configure [the date element to show today's date as default](https://github.com/kwantu/platformconfiguration/wiki/How-to-set-the-default-date-as-today)

# Data Formats

The following data formats are used.  This determine how to interpret the data correctly.  For example, dates may be formatted in different ways.  The same applies to currencies.

* `<xs:enumeration value="string"/>`
* `<xs:enumeration value="integer"/>`
* `<xs:enumeration value="float"/>`
* `<xs:enumeration value="email"/>`
* `<xs:enumeration value="URI"/>`
* `<xs:enumeration value="date"/>`
* `<xs:enumeration value="coordinateDMS"/>`
* `<xs:enumeration value="geoPoint"/>`
* `<xs:enumeration value="yesNo"/>`
* `<xs:enumeration value="boolean"/>`
* `<xs:enumeration value="text"/>`
* `<xs:enumeration value="html"/>`
* `<xs:enumeration value="richText"/>`
* `<xs:enumeration value="currency"/>`
* `<xs:enumeration value="#,##0"/>`
* `<xs:enumeration value="memo"/>`
* `<xs:enumeration value="Rmil #,##0.0"/>`
* `<xs:enumeration value="#,##0.00"/>`
* `<xs:enumeration value="R #,##0.00"/>`

# Widgets

This table of [widgets](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component#widgets) was moved to the [Data object component](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component) page on 2018-01-03 as recommended by Willem.

# Validations

Possible cases for type attribute in the validation tag are below. Each case has different datatype requirement.

| #  | Type           | Data type  | Value  |
| -: |:-------------| :-----|:-----|
| 1 | required | boolean |BOOLEAN |
| 2 | eq  | string |ANY STRING |
| 3 | ge | number |ANY NUMBER |
| 4 | le | number |ANY NUMBER |
| 5 | minLength | number |ANY NUMBER |
| 6 | maxLength | number |ANY NUMBER |
| 7 | email | | |
| 8 | pattern | ||
| 9 | ne | string |ANY STRING |
| 10 | date | date | |
| 11 | number | boolean |BOOLEAN |
| 12 | dateLessThan | date |DATE |
| 13 | dateGreaterThan | date |DATE|
| 14 | dateLessThanEqualTo | date |DATE |
| 15 | dateGreaterThanEqualTo | date |DATE |
| 16 | dateLessThanCurrent | | |
| 17 | dateGreaterThanCurrent | ||
| 18 | dateLessThanEqualToCurrent | ||
| 19 | dateGreaterThanEqualToCurrent | ||

# Calculations

See https://docs.google.com/document/d/1_-czXKjBnixFUOksBhn2w7uUXE1D1BERZMMdGQo8OGI/edit?ts=5c13690d#heading=h.nyoir32r967q