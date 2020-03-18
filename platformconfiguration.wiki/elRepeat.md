It was moved back here from the [**10. Element repeat**](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component#10-element-repeat) part of the [Data object component](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component) page and was moved here on 2018-01-07 because that page had become too unwieldy.

***

# 10. Element repeat
The **`elRepeat`** is the way the platform implements a user interface grid.
The XML element tag is illustrated in the following screenshot.

| **Repeat definition: `elRepeat`**                                             |
|:----------------------------------------------------------------------------- |
| ![](https://github.com/kwantu/platformconfiguration/blob/master/elRepeat.png) |

The repeat configuration has two core elements:
1. **The repeat definition section** referenced below called `repeatDef`; and
1. **The repeat column section** referenced below called `repeatColumn`.

Both of these are expanded as follows:

| **Repeat definition: `repeatDef`** |
|:---------------------------------- |
|![](https://github.com/kwantu/platformconfiguration/blob/master/repeatDef.png)|

## 10.1) The repeat definition section
The repeat definition section  manages the overall behaviour of the grid, what is allowed etc. the following table shows the list of available XML element tags, their attributes and possible attribute-values and sub-elements, as well as a description of the function that is controlled by it.

| Tag        | Attributes / Sub-elements           | Function  | Notes  |
| :------------- |:-------------| :-----|:-----|
| `Addrows` | `userAdd` | This specifies that there will be a user button, and that the user may add a row to the grid clicking the button |Additional values are the minimum and maximum number of rows, If a row may be deleted, and labels for the buttons |
|  | `autoload`      | The rows are added automatically based on the values provided. These are one of the following: | (i) blank lines, (ii) a taxonomy, (iii) periods (such as quarters between a start and end date), (iv) a reference to another SDO, adding the same lines in another repeat or (v) Provision for a search adding a row for each returned value |
| `HeaderRow` |  | A header row is displayed | |
| `DataRows` |  | Data rows are displayed | |
| `SummaryRow` |  | A summary row is displayed | |
| `Columns` |  | Columns are displayed | |
| `Heading` |  | A heading is displayed | |
| `KeyValue` |  | Pointer to the field in the grid that contains the key values |This is by default a sequence number that is added automatically |

<br> 
The ability to specify a repeating column as part of tabular app user interface functionality is very valuable. This capability is discussed below as follows:<br>

| **Repeat details: `repeatColumn`** |
|:---------------------------------- |
|![](https://github.com/kwantu/platformconfiguration/blob/master/repeatColumn.png)

## 10.2) The repeat column section
The repeat column section defines each column in the grid individually, ordered by the sequence attribute. Optionally, the width of the column can be specified as a percentage. Within the "column", there are three basic tags, each of which acts as a container for yet other elements.

| Tag        | Attributes / Sub-elements           | Function  | Notes  |
| :------------- |:-------------| :-----|:-----|
| `repeatHeader` | `LabelsFromData` | Yes/No |If Yes, then the header row is populated with the label from the elements in the data row definition. |
|  | `Span`      | Default 1 | Ability to group columns together for specific columns |
| | `Label` | Specify a single label for the column directly as a label with natural language text | |
| | `elField` | Specify a field to capture data in the header row | |
| `repeatData` | Span | Default 1 | Ability to group columns together for specific columns|
| | One of: (`elField`,`elSelect`,`elupload`,`elRepeat`) | The elements to show in the data grid cell | |
| `repeatSummary` | `elField` | Specify a field to capture  / show data in the summary row | This will usually be calculated data|
 

[More on Data object elements...](https://github.com/kwantu/platformconfiguration/wiki/Data-object-elements) <br>
