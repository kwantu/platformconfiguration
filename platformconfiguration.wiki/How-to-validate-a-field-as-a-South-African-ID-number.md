Created by Rob Worthington, last modified on Sep 27, . Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+validate+a+field+as+a+South+African+ID+number) on 2018-12-12.

The Kwantu platform uses document and the DOM (document object model) everywhere.  For that reason the [Xpath](https://en.wikipedia.org/wiki/XPath) functionality is supported extensively to query and process any data that may be in such a document.  So it is that the `<xpathFunction>` tag is available in [configuration-file](https://github.com/kwantu/platformconfiguration/wiki/Entity-list#config-file) syntax to achieve these ends, (such as when it is necessary to validate the relationships between individual fields on a [form](https://github.com/kwantu/platformconfiguration/wiki/Entity-list#form)... as below.)
  
Example code to validate the gender in a South African ID number with some commented sections as possible responses:

```XML
<?xml version="1.0" encoding="utf-8"?>
<elField id="gender">
  <displays>
    <display show="true" mode="edit" widget="label">
      <label show="true">
        <i18n xml:lang="en">Gender</i18n>
        <i18n xml:lang="pt">Gender</i18n>
      </label>
    </display>
    <display show="true" mode="readonly" widget="label">
      <label show="true">
        <i18n xml:lang="en">Gender</i18n>
        <i18n xml:lang="pt">Gender</i18n>
      </label>
    </display>
  </displays>
  <fieldData dataType="string">
    <calculated>
      <xpathFunction function="if(#three? ne '')then(if(contains('01234', substring(#three?,7,1))) then ('Female') else ('Male'))else('')">
        <elementAtomic dataType="string" id="three">
          <indicatorSet indicatorId="" setId="" Scope="" dataType="">
            <element elementId="IDnumber" />
          </indicatorSet>
        </elementAtomic>
      </xpathFunction>
    </calculated>
  </fieldData>
  <!--<validations>
                                                <validation seq="1">
                                                    <simple type="required" dataType="boolean" value="true"/>
                                                    <errorMessage>
                                                        <i18n xml:lang="en">Please select a gender</i18n>
                                                        <i18n xml:lang="pt">Por favor, selecione uma Distrito</i18n>
                                                    </errorMessage>
                                                </validation>
                                            </validations>-->
  <!--<validations>
                                          <validation seq="1">
                                            <simple type="required" dataType="boolean" value="true"/>
                                            <errorMessage>
                                              <i18n xml:lang="en">A title for the document is required.</i18n>
                                            </errorMessage>
                                          </validation>
                                        </validations>-->
  <!--<help show="true">
                                          <i18n xml:lang="en">Please enter the name of the group that created this score card.</i18n>
                                          <i18n xml:lang="pt">Por favor, insira o nome do grupo que criou este cartão de pontuação.</i18n>
                                        </help>-->
</elField>
```

Example code to calculate the date of birth and gender from the ID number

```XML
                                        <elField id="dateOfBirth">
                                            <displays>
                                                <display show="true" mode="edit" widget="label">
                                                    <label show="true">
                                                        <i18n xml:lang="en">DateOfBirth</i18n>
                                                        <i18n xml:lang="pt">DateOfBirth</i18n>
                                                    </label>
                                                </display>
                                                <display show="true" mode="readonly" widget="label">
                                                    <label show="true">
                                                        <i18n xml:lang="en">DateOfBirth</i18n>
                                                        <i18n xml:lang="pt">DateOfBirth</i18n>
                                                    </label>
                                                </display>
                                            </displays>
                                            <fieldData dataType="string">
                                                <calculated>
                                                    <xpathFunction function="if(#three? ne '')then(concat(substring(#three?,5,2),'/',substring(#three?,3,2), '/19', substring(#three?,1,2)))else('')">
                                                        <elementAtomic dataType="string" id="three">
                                                            <indicatorSet indicatorId="" setId="" Scope="" dataType="">
                                                                <element elementId="IDnumber"/>
                                                            </indicatorSet>
                                                        </elementAtomic>
                                                    </xpathFunction>
                                                </calculated>
                                            </fieldData>
                                            <validations>
                                                <validation seq="1">
                                                    <simple type="required" dataType="boolean" value="true"/>
                                                    <errorMessage>
                                                        <i18n xml:lang="en">If it does not reconcile, “The ID Number does not corespond to the date of birth.”</i18n>
                                                    </errorMessage>
                                                </validation>
                                            </validations>
                                        </elField>
          <elField id="gender">
                                            <displays>
                                                <display show="true" mode="edit" widget="label">
                                                    <label show="true">
                                                        <i18n xml:lang="en">Gender</i18n>
                                                        <i18n xml:lang="pt">Gender</i18n>
                                                    </label>
                                                </display>
                                                <display show="true" mode="readonly" widget="label">
                                                    <label show="true">
                                                        <i18n xml:lang="en">Gender</i18n>
                                                        <i18n xml:lang="pt">Gender</i18n>
                                                    </label>
                                                </display>
                                            </displays>
                                            <fieldData dataType="string">
                                                <calculated>
                                                    <xpathFunction function="if(#three? ne '')then(if(contains('01234', substring(#three?,7,1))) then ('Female') else ('Male'))else('')">
                                                        <elementAtomic dataType="string" id="three">
                                                            <indicatorSet indicatorId="" setId="" Scope="" dataType="">
                                                                <element elementId="IDnumber"/>
                                                            </indicatorSet>
                                                        </elementAtomic>
                                                    </xpathFunction>
                                                </calculated>
                                            </fieldData><!--<validations>
                                                <validation seq="1">
                                                    <simple type="required" dataType="boolean" value="true"/>
                                                    <errorMessage>
                                                        <i18n xml:lang="en">Please select a gender</i18n>
                                                        <i18n xml:lang="pt">Por favor, selecione uma Distrito</i18n>
                                                    </errorMessage>
                                                </validation>
                                            </validations>--><!--<validations>
                                          <validation seq="1">
                                            <simple type="required" dataType="boolean" value="true"/>
                                            <errorMessage>
                                              <i18n xml:lang="en">A title for the document is required.</i18n>
                                            </errorMessage>
                                          </validation>
                                        </validations>--><!--<help show="true">
                                          <i18n xml:lang="en">Please enter the name of the group that created this score card.</i18n>
                                          <i18n xml:lang="pt">Por favor, insira o nome do grupo que criou este cartão de pontuação.</i18n>
                                        </help>-->
                                        </elField>
```