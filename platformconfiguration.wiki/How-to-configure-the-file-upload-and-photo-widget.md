Created by Rob Worthington on Oct 10, 2017. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+configure+the+file+upload+and+photo+widget) on 2018-12-12.

This capability has to be in the [app-config-file](https://github.com/kwantu/platformconfiguration/wiki/Application-config) because it is an optional UI (user interface) feature. It is part of the `<element>` tag which contains the [fields](https://github.com/kwantu/platformconfiguration/wiki/elField) of a [form](https://github.com/kwantu/platformconfiguration/wiki/Entity-list#form).  The tags inside the `<elements>` tag relate to the nature of the fields on the form and the `<elUpload>` tag specifically defines this kind of field.

Example:

```XML
                                        <elUpload id="uploadwid">
                                            <displays>
                                                <display show="true" mode="edit" widget="upload">
                                                    <label show="true">
                                                        <i18n xml:lang="en">Upload attachment</i18n>
                                                        <i18n xml:lang="pt"/>
                                                    </label>
                                                </display>
                                                <display show="true" mode="readonly" widget="preview">
                                                    <label show="true">
                                                        <i18n xml:lang="en">Upload attachment</i18n>
                                                        <i18n xml:lang="pt"/>
                                                    </label>
                                                </display>
                                            </displays>
                                            <fieldData dataType="string"/>
      <!--<validations>
                                                <validation seq="1">
                                                    <simple type="required" dataType="boolean" value="true"/>
                                                    <errorMessage>
                                                        <i18n xml:lang="en">Please upload attachment</i18n>
                                                        <i18n xml:lang="pt">Por favor, insira algum texto</i18n>
                                                    </errorMessage>
                                                </validation>
                                            </validations>-->
                                        </elUpload>
```