The panelSet is a more advanced layout concept that allows for the grouping of components and display objects. It allows for the creation of:

* tabs
* accordion
* wizard

![PanelSet tag schema](https://github.com/kwantu/platformconfiguration/blob/master/PanelSettag.png)

The `panelSet` user interface can be configured in accordions, tabs or wizard structure and on each pane (**the visible area on all these different components**) we can set a layout and on each layout we can place a label for text and elements for user controls. See the screenshot of a panel below.

![Placeholder for a screenshot of a panel](https://github.com/kwantu/platformconfiguration/blob/master/Kwantu%20Star.jpg)

So in the snippet below, under `panelType`, `accordion` is enabled (not commented), which means that the user interface will display the accordion. If you comment accordion and open the tabs then the user interface will convert to tabular structure. There can be more than one panel each panel relates to one visible area of the accordion or tab or wizard which ever is selected.

A panel has an `id` which links to any text, but is unique across the configuration file and may not be repeated. The panel may be **hidden**, or **visible** with a `show="true"` attribute.

```XML
<display show="true">
```
The label of panel which is the term / label on the accordion panel can be specified.
```XML
<label>
      <i18n xml:lang="en">General Information</i18n>
      <i18n xml:lang="pt">General Information</i18n>
</label>
```
You may also specify the background colour of the accordion panel.
```
<uiLayout id="edit">
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
                                                            <i18n xml:lang="en">General Information</i18n>
                                                            
                                                        </label>
                                                        <style  style="background:#FFFFFF; font-size: 19px;"/>
                                                    </display>
```
Change the colour code to set the background colour.
