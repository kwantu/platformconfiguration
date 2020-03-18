In order to understand how a DO config file relates to it's app, refer to the [Kwantu platform app model](https://github.com/kwantu/platformconfiguration/wiki/Kwantu-platform-app-model) page.

_(**Note:** the Kwantu legacy code and documentation interchangeably refer to an **SDO** and an **DO**, which are the same thing!)_

***
# Introduction to configuring a data object
This page describes **DO configuration in XML** using the data object configuration file and its [schema](https://github.com/kwantu/platformconfiguration/wiki/Data-object-configuration-file#schema). The DO config file defines attributes for each DO. There are 00 XML objects in the root of the configuration file. The following picture is a screen shot of the file opened down to `kwantu:data` and below with xmlNotepad. From this we can clearly see the hierarchy in the file.

![Screenshot of SDO configuration path](https://github.com/kwantu/platformconfiguration/blob/master/Screenshot%20of%20SDO%20configuration%20path.PNG)

This wiki page takes the file `config_1_LevelofInfluence` as an example to refer to. Follow the "PATH" down to the `kwantu:data` element. `PATH=/content/kwantu:sequence/kwantu:data/` Descriptions are done from there on downwards as follows: 

* component
* identification
* configuration
    * indicator
    * id
    * set
    * version
    * versionInfo
    * settings
    * uiLayouts
    * rules
    * elements


```XML
<test>
  <name>John</name>
  <!-- <address>221/B N Street</address>-->
</test>
```

# Schema

The XML DO (Data Object) configuration file has an **`XSD`** schema file that validates the configuration called [**`kwantuSDOConfig.xsd`**](https://github.com/kwantu/platformconfiguration/blob/master/kwantuSDOConfig.xsd). 

The DO configuration file format is defined by a configuration schema file, using the standard XML schema definition (.xsd). **This document should be read in the context of that schema file only**. See [xsd](https://github.com/kwantu/platformconfiguration/blob/master/kwantuSDOConfig.xsd) and [pdf](https://github.com/kwantu/platformconfiguration/blob/master/SDOConfigSchema.pdf).  In the (execution or run-time) environment, the DO file has a given structure, using an atom type wrapper, and then a content section that manages the configuration data for the specific SDO.

# Structure of the configuration file

The configuration file is made up of the following sections.
### component

### identification

### configuration

### indicator

### id

### set

### version

### versionInfo

### settings

### uiLayouts
[uiLayouts](https://github.com/kwantu/platformconfiguration/wiki/Data-object-uiLayouts) 
This section defines one or more user interface layouts and the elements available in each layout.

### rules
[rules](https://github.com/kwantu/platformconfiguration/wiki/Data-object-rules)
This section defines rules that are executed when the data object instance is saved.

### elements
| [elements](https://github.com/kwantu/platformconfiguration/wiki/Data-object-elements) | This section defines the elements used in the data model |

Please follow the links above for more information on each of these sections.



Following is an example of this file.    -->   _If you use Windows, you can cut and paste the [code](https://github.com/kwantu/platformconfiguration/wiki/Data-object-configuration-file/_edit#code) below into [XML Notepad 2007 free](https://www.microsoft.com/en-za/download/details.aspx?id=7973)  to help understand the structure. It would look like this._ ![Kwantu Platform config file view in XMLnotepad 2007.png](https://github.com/kwantu/platformconfiguration/blob/master/Kwantu%20Platform%20config%20file%20view%20in%20XMLnotepad%202007.png)

### code

```XML
<entry xmlns="http://www.w3.org/2005/Atom" xmlns:kwantu="http://www.kwantumedia.com/2012/AtomExtension" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.w3.org/2005/Atom http://kwantu9data.kwantu.net:8080/exist/rest/db/kwantu-resource/schemas/indicatorConfigSchema/xml/kwantuSDOConfig.xsd">
    <id>urn:uuid:config_1_LevelofInfluence</id>
    <title type="text">LevelofInfluence details</title>
    <summary type="text">LevelofInfluence details</summary>
    <published>2014-07-04T15:39:08.315+05:30</published>
    <updated>2014-07-04T15:39:08.315+05:30</updated>
    <author type="user">
        <kwantu:community>10004</kwantu:community>
        <kwantu:profile>10007</kwantu:profile>
        <name>Admin</name>
    </author>
    <contributor>
        <kwantu:community>10004</kwantu:community>
        <kwantu:profile>10007</kwantu:profile>
        <name>Admin</name>
    </contributor>
    <icon src=""/>
    <link href="/db/data/10004/workspace/10004-10002/editor/.feed.entry/config_1_LevelofInfluence.entry.atom" rel="edit" type="application/atom+xml"/>
    <category term="config" label="Config" scheme="schemas/comment.xsd"/>
    <kwantu:control>
        <kwantu:global-meta-info>
            <kwantu:info key="indicator" value="config"/>
            <kwantu:info key="set" value="config"/>
            <kwantu:info key="app_id" value="10004-10002"/>
        </kwantu:global-meta-info>
        <kwantu:draft>true</kwantu:draft>
        <kwantu:moderation required="false" status=""/>
        <kwantu:privacy>
            <kwantu:add level="0">Everyone</kwantu:add>
            <kwantu:create level="0">Everyone</kwantu:create>
            <kwantu:read level="0">Everyone</kwantu:read>
            <kwantu:update level="0">Everyone</kwantu:update>
            <kwantu:delete level="0">Everyone</kwantu:delete>
        </kwantu:privacy>
        <kwantu:deleted profileId="" date="">false</kwantu:deleted>
        <kwantu:expired date="">false</kwantu:expired>
        <kwantu:status code="0">Active</kwantu:status>
        <kwantu:featured startDateTime="" endDateTime="">false</kwantu:featured>
        <kwantu:release date=""/>
        <kwantu:locked>
            <kwantu:reserved locked="false" date="" profileId="" expire="" requestRelease=""/>
            <kwantu:session locked="false" date="" profileId="" token="" expire="" requestRelease=""/>
            <kwantu:form locked="false" date="" profileId="" formId="" requestRelease=""/>
            <kwantu:device locked="false" date="" profileId="" deviceId="" requestRelease=""/>
        </kwantu:locked>
        <kwantu:refresh period="0">N/A</kwantu:refresh>
    </kwantu:control>
    <content>
        <kwantu:sequence num="1" current="true" locked="false">
            <kwantu:trace>
                <kwantu:timestamps>
                    <kwantu:submission>2014-07-04T15:39:08.315+05:30</kwantu:submission>
                </kwantu:timestamps>
                <kwantu:contributor>
                    <kwantu:community>10004</kwantu:community>
                    <kwantu:profile>10007</kwantu:profile>
                </kwantu:contributor>
                <kwantu:moderation required="false" status=""/>
            </kwantu:trace>
            <kwantu:data>
                <component xmlns="">
                    <identification id="LevelofInfluence" applicationId="10002" baseComponentType="indicator">
                        <name>
                            <i18n xml:lang="">Kwantu Default Content</i18n>
                        </name>
                        <documentation>
                            <i18n xml:lang="">Kwantu Default Content Indicator</i18n>
                        </documentation>
                    </identification>
                    <configuration>
                        <indicator id="LevelofInfluence">
                            <set id="LevelofInfluence" currentVersion="1.5.0" devVersion="1.5.0">
                                <version version="1.5.0">
                                    <versionInfo>
                                        <publish/>
                                        <upgradeInformation/>
                                        <documentation>
                                            <i18n xml:lang="en"></i18n>
                                        </documentation>
                                    </versionInfo>
                                    <settings>
                                        <heading>
                                            <i18n xml:lang="en"></i18n>
                                        </heading>
                                        <searchable>true</searchable>
                                        <dataStore>profile</dataStore> 
                                        <privacy>
                                            <add>
                                                <roles>
                                                    <role id="member">Member</role>
                                                </roles>
                                            </add>
                                            <create>
                                                <roles>
                                                    <role id="member">Member</role>
                                                </roles>
                                            </create>
                                            <read>
                                                <roles>
                                                    <role id="sysAdmin">System Administrator</role>
                                                    <role id="sysConfig">System Configurator</role>
                                                    <role id="admin">Administrator</role>
                                                    <role id="owner">Owner</role>
                                                    <role id="member">Member</role>
                                                </roles>
                                            </read>
                                            <update>
                                                <roles>
                                                    <role id="sysAdmin">System Administrator</role>
                                                    <role id="sysConfig">System Configurator</role>
                                                    <role id="admin">Administrator</role>
                                                    <role id="owner">Owner</role>
                                                </roles>
                                            </update>
                                            <delete>
                                                <roles>
                                                    <role id="sysAdmin">System Administrator</role>
                                                    <role id="sysConfig">System Configurator</role>
                                                    <role id="admin">Administrator</role>
                                                    <role id="owner">Owner</role>
                                                </roles>
                                            </delete>
                                        </privacy>
                                        <uiTemplates>
                                            <uiTemplate id="document_edit" name="Create/Edit View" mode="edit" uiLayoutId="edit">
                                                <uiDevice deviceType="Web"/>
                                                <uiDevice deviceType="Android"/>
                                            </uiTemplate>
                                            <uiTemplate id="document_read" name="View" mode="readonly" uiLayoutId="read">
                                                <uiDevice deviceType="Web"/>
                                                <uiDevice deviceType="Android"/>
                                            </uiTemplate>
                                        </uiTemplates>
                                    </settings>
                                    <uiLayouts>
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
                                                            <i18n xml:lang="en">Level of influence details</i18n>
                                                        </label>
                                                    </display>
                                                    <layout id="vbPanel2" orientation="vertical">
                                                        <element ref="hasInfluencedSolutions"/>
                                                        <element ref="uploadDocs"/>
                                                    </layout>
                                                </panel>
                                               
                                            </panelSet>
                                            <layout id="buttonBar" orientation="horizontal" align="left">
                                                <button id="saveButton" type="app.save" assignName="$root" style="prominent">
                                                    <label>
                                                        <i18n xml:lang="en">Save and close</i18n>
                                                    </label>
                                                </button>
                                                <button id="validateButton" type="app.validateForm" assignName="$root" style="normal">
                                                    <label>
                                                        <i18n xml:lang="en">✓ Check form validations</i18n>
                                                    </label>
                                                </button>
                                                <button id="saveAsDraft" type="app.saveAsDraft" assignName="$root" style="normal">
                                                    <label>
                                                        <i18n xml:lang="en">Save as draft</i18n>
                                                    </label>
                                                </button>
                                            </layout>
                                        </uiLayout>
                                        <uiLayout id="read">
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
                                                            <i18n xml:lang="en">Action details</i18n>
                                                        </label>
                                                    </display>
                                                    <layout id="vbPanel2" orientation="vertical">
                                                        <element ref="hasInfluencedSolutions"/>
                                                        <element ref="uploadDocs"/>
                                                        
                                                    </layout>
                                                </panel>
                                               
                                            </panelSet>
                                        </uiLayout>
                                    </uiLayouts>
                                    <rules>
                                        <rule id="saveModel" event="onClick">
                                            <action>saveModel</action>
                                        </rule>
                                        <rule id="closeForm" event="onClick">
                                            <action>closeForm</action>
                                        </rule>
                                        <rule id="updateTitle" event="onSave">
                                            <action>updateTitle</action>
                                            <updates>
                                                <update source="/hasInfluencedSolutions" target="atom:title"/>
                                            </updates>
                                        </rule>
                                    </rules>
                                    <elements>
                                         <elSelect id="'Level of influence details'">
                                            <displays>
                                                <display show="true" mode="edit" widget="combobox">
                                                    <label show="true">
                                                        <i18n xml:lang="en">To what extent do you feel you have  influence over solutions to issues identified in your community?</i18n>
                                                    </label>
                                                    <style width="60%"/>
                                                </display>
                                                <display show="true" mode="readonly" widget="label">
                                                    <label show="true">
                                                        <i18n xml:lang="en">To what extent do you feel you have  influence over solutions to issues identified in your community?</i18n>
                                                    </label>
                                                    <style width="60%"/>
                                                </display>
                                            </displays>
                                            <data>
                                                <taxonomy id="ExtentOfInfluence" ref="ExtentOfInfluence" name="ExtentOfInfluence" baseExpr="TaxonomyItems/Item" sortExpr="Name/Int[@xml:lang = 'en']">
                                                    <codePath name="code">@Code</codePath>
                                                    <labelPath name="label">Name/Int[@xml:lang = 'en']</labelPath>
                                                </taxonomy>
                                                <subElements>
                                                    <assignSubElement id="code" dataType="string" sourcePath="code"/>
                                                    <assignSubElement id="label" dataType="string" sourcePath="label"/>
                                                </subElements>
                                            </data>
                                            <fieldData dataType="string"/>
                                            <validations>
                                                <validation seq="1">
                                                    <simple type="required" dataType="boolean" value="true"/>
                                                    <errorMessage>
                                                        <i18n xml:lang="en">This field is required</i18n>
                                                    </errorMessage>
                                                </validation>
                                            </validations>
                                             <help show="true">
                                                 <i18n xml:lang="en">Please select an option</i18n>
                                             </help>
                                        </elSelect> 
                                       <elUpload id="uploadDocs">
                                            <displays>
                                                <display show="true" mode="edit" widget="camera">
                                                    <label show="false">
                                                        <i18n xml:lang="en">Capture photo</i18n>
                                                    </label>
                                                    <style width="90%"/>
                                                </display>
                                                <display show="true" mode="readonly" widget="preview">
                                                    <label show="false">
                                                        <i18n xml:lang="en">Preview photo</i18n>
                                                    </label>
                                                    <style width="90%"/>
                                                </display>
                                            </displays>
                                            <fieldData/>
                                        </elUpload>
                                    </elements>
                                </version>
                            </set>
                        </indicator>
                    </configuration>
                </component>
            </kwantu:data>
        </kwantu:sequence>
    </content>
    <kwantu:map/>
    <kwantu:calendar/>
    <kwantu:tags/>
    <kwantu:likes/>
</entry>
```



# Widgets

Data objects may include the following widgets:

| # | Widget        | Explanation           |
|-: | :-------------: |:-------------|
|1| `elSelect` | Displays a drop down menu.  May be connected to a taxonomy or search to select from a list of terms |
|3| `text` | A text field |
|4| `radio` | Radio buttons |
|5| `checkbox` | A check box |
|6| `datepicker` | A date chooser |
|7| `memo` | A text field allowing for a sentence or more |
|8| `fileupload` | A file upload or photo |





# Preview tool

[This tool](http://staging1.kwantu.org/#!/testIndicator) allows you to preview data objects as you configure them:

username: **rob**
password: **test**

# Taxomies
[There is a significant explanation of how references to taxonomies are made inside a data object here.](https://github.com/kwantu/platformconfiguration/wiki/Taxonomies#configuring-a-data-object-to-reference-a-taxonomy)

