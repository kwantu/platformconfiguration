Created by Rob Worthington, last modified on Oct 03, 2017. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+calculate+the+total+for+values+in+a+column) on 2018-12-12.

Example of how to calculate the total for a column

```XML
<xpathFunctionfunction="sum((model/customModel/meetingattendrepeatbMatrix/meetingattendrepeatmatrixbDef/repeatDef/dataRow/learningMaterials[. ne '']))"/>
```

* meetingattendrepeatbMatrix - set ID
* meetingattendrepeatmatrixbDef - ID for repeat
* Budgets - repeatdef ID
* Budget - row ID
* TotalFundBodyFy - field row

Full example code block as follows:

```xml
<?xml version="1.0" encoding="utf-8"?>
<elRepeat id="meetingattendrepeatbMatrix" class="repeatGrid" orientation="horizontal">
  <repeatDef id="meetingattendrepeatmatrixbDef">
    <addRows>
      <autoLoad>
        <taxonomy id="TACmeetinghservicesReferred">
          <field primaryKey="true" observableName="code" xpathExpr="code" />
          <field observableName="label" xpathExpr="label" />
          <field observableName="response" xpathExpr="" />
        </taxonomy>
      </autoLoad>
    </addRows>
    <headerRow id="hsrowheader" show="true" />
    <dataRow id="hsrowId" show="true" />
    <summaryRow id="hsrowsummary" show="true" />
    <columns numberColumns="4" />
    <keyValue>code</keyValue>
  </repeatDef>
  <repeatColumn columnOrder="1" seq="1" width="15%">
    <repeatHeader labelsFromData="No">
      <label show="true">
        <i18n xml:lang="en">Health services referred</i18n>
      </label>
    </repeatHeader>
    <repeatData span="1">
      <elField id="code">
        <displays>
          <display show="false" mode="edit" widget="label">
            <label show="false">
              <i18n xml:lang="en" />
            </label>
          </display>
          <display show="false" mode="readonly" widget="label">
            <label show="false">
              <i18n xml:lang="en" />
            </label>
          </display>
        </displays>
        <fieldData dataType="string" />
      </elField>
      <elField id="label">
        <displays>
          <display show="true" mode="edit" widget="label">
            <label show="false">
              <i18n xml:lang="en" />
            </label>
          </display>
          <display show="false" mode="readonly" widget="label">
            <label show="false">
              <i18n xml:lang="en" />
            </label>
          </display>
        </displays>
        <fieldData dataType="string" />
      </elField>
    </repeatData>
  </repeatColumn>
  <repeatColumn columnOrder="2" seq="2" width="15%">
    <repeatHeader labelsFromData="No">
      <label>
        <i18n xml:lang="en">Males referred</i18n>
      </label>
    </repeatHeader>
    <repeatData>
      <elField id="numofMales">
        <displays>
          <display show="true" mode="edit" widget="textbox">
            <label show="false">
              <i18n xml:lang="en">Number of males referred</i18n>
            </label>
          </display>
          <display show="true" mode="readonly" widget="label">
            <label show="true">
              <i18n xml:lang="en">Number of males referred</i18n>
            </label>
          </display>
        </displays>
        <fieldData dataType="string" />
        <validations>
          <validation seq="1">
            <simple type="number" dataType="boolean" value="true" />
            <errorMessage>
              <i18n xml:lang="en">Please enter a value.</i18n>
            </errorMessage>
          </validation>
        </validations>
      </elField>
    </repeatData>
  </repeatColumn>
  <repeatColumn columnOrder="3" seq="3" width="15%">
    <repeatHeader labelsFromData="No">
      <label>
        <i18n xml:lang="en">Females referred</i18n>
      </label>
    </repeatHeader>
    <repeatData>
      <elField id="numofFemales">
        <displays>
          <display show="true" mode="edit" widget="textbox">
            <label show="false">
              <i18n xml:lang="en">Number of females referred</i18n>
            </label>
          </display>
          <display show="true" mode="readonly" widget="label">
            <label show="false">
              <i18n xml:lang="en">Number of females referred</i18n>
            </label>
          </display>
        </displays>
        <fieldData dataType="string" />
        <validations>
          <validation seq="1">
            <simple type="number" dataType="boolean" value="true" />
            <errorMessage>
              <i18n xml:lang="en">Please enter a value.</i18n>
            </errorMessage>
          </validation>
        </validations>
      </elField>
    </repeatData>
  </repeatColumn>
  <repeatColumn columnOrder="4" seq="4" width="15%">
    <repeatHeader labelsFromData="No">
      <label show="true">
        <i18n xml:lang="en">Total</i18n>
      </label>
    </repeatHeader>
    <repeatData>
      <elField id="totalNumber">
        <displays>
          <display show="true" mode="edit" widget="label">
            <label show="true">
              <i18n xml:lang="en" />
            </label>
          </display>
          <display show="true" mode="readonly" widget="label">
            <label show="true">
              <i18n xml:lang="en" />
            </label>
          </display>
        </displays>
        <fieldData dataType="integer">
          <calculated seq="1">
            <sum>
              <elementAtomic dataType="integer">
                <indicatorSet indicatorId="" setId="" Scope="currentUUID" dataType="integer">
                  <element elementId="numofMales" />
                </indicatorSet>
              </elementAtomic>
              <elementAtomic dataType="integer">
                <indicatorSet indicatorId="" setId="" Scope="currentUUID" dataType="integer">
                  <element elementId="numofFemales" />
                </indicatorSet>
              </elementAtomic>
            </sum>
          </calculated>
        </fieldData>
        <help show="false">
          <i18n xml:lang="en">Total per health services referred.</i18n>
        </help>
      </elField>
    </repeatData>
  </repeatColumn>
</elRepeat>
```