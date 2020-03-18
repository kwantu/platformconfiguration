After panelSet you can see that there is one layout again to contain the button on the user interface. This button will be treated as Save button on the interface and used to save the contents captured on the form. You can mix any number of labels, elements and buttons under layout.

```XML
<layout id="buttonBar" orientation="horizontal" align="left">
  <button id="saveButton" type="app.save" assignName="$root">
    <label>
    <i18n xml:lang="pt">Salvar</i18n>
    <i18n xml:lang="en">Save</i18n>
    </label>
  </button>
</layout>
```
Here is an example of a uiLayout from an actual SDO in use.
```XML
<uiLayout id="edit">
  <panelSet id="accCepFifteen">
  <panelType>
    <accordion>
    <requireOpenedPane>false</requireOpenedPane>
    <selectedIndex>0</selectedIndex>
    </accordion>
    <!--
    <tabs>
   <tabOrientation>vertical</tabOrientation>
    </tabs>
    -->
    <!--
    <wizard></wizard>
    -->
  </panelType>
  <panel id="panel1">
    <display show="true">
    <label>
      <i18n xml:lang="en">General Information</i18n>
      <i18n xml:lang="pt">General Information</i18n>
    </label>
    </display>
    <layout id="vbPanel2" orientation="vertical">
       <!-- label can be added or text purposes-->
    <element ref="testBox"/>
    <element ref="testArea"/>
    <element ref="testRadio"/>
    <element ref="testCombo"/>
    <element ref="testDate"/>
    <element ref="testcheckBox"/>
    <element ref="testhorizontalRepeat"/>
    <element ref="testVerticalRepeat"/>
    </layout>
  </panel>
  </panelSet>
  <layout id="buttonBar" orientation="horizontal" align="left">
  <button id="saveButton" type="app.save" assignName="$root">
    <label>
    <i18n xml:lang="pt">Salvar</i18n>
    <i18n xml:lang="en">Save</i18n>
    </label>
  </button>
  </layout>
</uiLayout>
```
