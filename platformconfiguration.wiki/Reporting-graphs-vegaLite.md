[back ...](https://github.com/kwantu/platformconfiguration/wiki)

## Configuration details in the SDO

Specify a elField with the wvidget vegaChart in readonly mode in order to render the charts.<br> 
The json code for the chart can be placed in the field, and the textarea widget should be used for that.<br>
```xml
<elField id="vegaBarChart1">
    <displays>
        <display show="true" mode="edit" widget="textarea">
            <label show="true">
                <i18n xml:lang="en">Some chart=edit</i18n>
            </label>
        </display>
        <display show="true" mode="readonly" widget="vegaChart">
            <label show="true">
                <i18n xml:lang="en">Some chart=readnly</i18n>
            </label>
        </display>
    </displays>
    <fieldData dataType="string"/>
    <validations>
        <validation seq="1">
            <simple type="required" dataType="boolean" value="true"/>
            <errorMessage>
                <i18n xml:lang="en">Chart specification is required</i18n>
            </errorMessage>
        </validation>
    </validations>
</elField>
```
## Data format and storage.
Data is read from a data file that is attached to current SDO. `<indicatorUUID>:graph` <br>
In the example below, the `fieldId` is important. it has to be same as elementId id on the form. In that way we can have more than one graphs in one SDO.
```js
{
    "_id": "ChristianAidPartnerDetails-49be6b1f-906a-416e-8eb4-2fc54119bd91:graph",
    "_rev": "1-b46944ea8f8841198d191ef4b0bfce19",
    "data": [
        {
            "fieldId": "vegaBarChart1",
            "values": [
                {
                    "category": "A",
                    "amount": 28
                },
                {
                    "category": "B",
                    "amount": 55
                },
                {
                    "category": "C",
                    "amount": 43
                },
                {
                    "category": "D",
                    "amount": 91
                }
            ]
        }
    ]
}
```
## The configuration for the graphs
The vega config can be found at https://vega.github.io/vega/examples/ for different charts. The example for a simple bar chart is shown below.

```js


