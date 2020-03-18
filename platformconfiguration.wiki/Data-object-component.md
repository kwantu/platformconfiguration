This page relates to the detailed description of the [data object configuration file](https://github.com/kwantu/platformconfiguration/wiki/Data-object-configuration-file). <br>

 **Note:** In this page, "XML element **tags**" and "XML element tag **attributes**" may be preceded with their (absolute or relative) PATH in order to provide orientation within the file structure. **For example: `.configuration`.`indicator`.`set`.`id`** is relative, because it begins with a **`.`** dot.

***

# Component
## Introduction
The `component` XML element tag contains the core definition of the data object. It consists of the following two major sections which are elaborated on further below: <br>  
[**A. The first**](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component#define-the-data-data-object-uniquely) defines the data object identifier. This should be unique across all data objects used in all applications. <br>
[**B. The second**](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component#data-object-detail) provides the details and business rules for the identified data objects. The image below shows the structure of the configuration section: <br>

| Fig. 1 Screenshot from xmlNotepad |
| :-------------------------------- |
|![Screenshot document object configuration tag](https://github.com/kwantu/platformconfiguration/blob/master/Screenshot%20document%20object%20configuration%20element.PNG)| 
## A. Define the data object uniquely
The identical "identification id" is specified in the following three places:
1. .`identification`.`id`="LevelofInfluence" 
1. .`configuration`.`indicator`.`id`="LevelofInfluence"
1. .`configuration`.`indicator`.`set`.`id`="LevelofInfluence" <br>
The natural language name for the data object is defined in 
*  `.identification`.`name`.`i18n`="Level of Influence" <br>
The rest of the attributes for these XML element tags present in the example data object configuration file will be deprecated. These also include `applicationId`,`baseComponentType`, `documentation`

**Example code 1:**
``` XML
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
      ...
    </indicator>
</configuration>
```

## B. Data object detail
The specification of the data object details take place in the following 5 sections:
1. [Version information section](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component#1-version-information-section)
1. [Settings section](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component#2-settings-section)
1. [uiLayouts section](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component#3-uilayouts-section)
1. [Rules section](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component#4-rules-section)
1. [Elements section](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component#5-elements-section)

### 1. Version information section
This section will be deprecated. Only use the current example configuration file default values for the following tags: `versionInfo`,`publish`,`upgradeInformation`,`documentation`

### 2. Settings section

This section relates to all the tags under the `component.configuration.indicator.set.version.settings`<br>
[This section has its own page here](https://github.com/kwantu/platformconfiguration/wiki/Settings-section).
<Be mindful of broken links if these headings are changed.>

### 3. uiLayouts section
This section relates to the previous **`uiTemplates` section**. <br>
[This section has its own page here](https://github.com/kwantu/platformconfiguration/wiki/uiLayouts-section).
<Be mindful of broken links if these headings are changed.>

### 4. Rules section
The Rules section contains a list of actionable user interface events. <br>
[This section has its own page here](https://github.com/kwantu/platformconfiguration/wiki/Rules-section).
<Be mindful of broken links if these headings are changed.> 

### 5. Elements section
The **User interface elements** section mirrors the MVC (model view controller) concept of other development platforms. <br>
[This section has its own page here](https://github.com/kwantu/platformconfiguration/wiki/Elements-section).
<Be mindful of broken links if these headings are changed.> 

***

### 6. Element building blocks
Each element from the following list, (`elfield`, `elSelect`, `elUpload` and `elRepeat`), contains (or is made up of) reusable blocks called "element blocks", to coin a phrase.   <br>
[This section has its own page here](https://github.com/kwantu/platformconfiguration/wiki/Element-building-blocks).
<Be mindful of broken links if these headings are changed.>

***

### 7. Element field
The elField is the core element type, where we are dealing with a single value to be stored.  <br>
Refer to the [**`elField`**](https://github.com/kwantu/platformconfiguration/wiki/elField) page.
<Be mindful of broken links if these headings are changed.>

***
 
### 8. Element select

The select element type is a field into which a user can capture data from the screen, and is linked to a pick-list which can get data from either one of: (a "**taxonomy**"; or a "**search**" of a data object as defined in a search configuration file).  This element type is named `elSelect`. <br>
[This section has its own page here](https://github.com/kwantu/platformconfiguration/wiki/elSelect).
<Be mindful of broken links if these headings are changed.>
***

### 9. Element upload
In order to upload data from the user interface and store it, an element type dedicated to the idea exists and has the XML tag name of `elUpload`. <br>
Refer to the [**`elUpload`**](https://github.com/kwantu/platformconfiguration/wiki/elUpload) page.
<Be mindful of broken links if these headings are changed.>

***

### 10. Element repeat
The `elRepeat` is the way the platform implements a user interface grid. <br>
Refer to the [**`elRepeat`**](https://github.com/kwantu/platformconfiguration/wiki/elRepeat) page.
<Be mindful of broken links if these headings are changed.>

***

### 11. Hash
The `hash` component is the way the platform implements hashed fields. <br>
Refer to the [**`hash`**](https://github.com/kwantu/platformconfiguration/wiki/hash) page.
<Be mindful of broken links if these headings are changed.>

***

### 12. Example data object file
The following is a complete example of a data object file:
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
                                         <elSelect id="levelOfInfluenceDetails">
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
