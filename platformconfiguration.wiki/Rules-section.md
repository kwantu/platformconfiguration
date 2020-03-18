This page was originally the [**4. Rules section**](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component#4-rules-section) part of the [Data object component](https://github.com/kwantu/platformconfiguration/wiki/Data-object-component) page and was moved here on 2018-01-07 because that page had become too unwieldy.

***

# Rules section
The absolute PATH to the `rules` section in the data object config file is as follows: <br> `entry.content.kwantu:sequence.kwantu:data.component.configuration.indicator.set.version.rules`. <br>
The Rules section contains a list of actionable user interface events. Each rule has the following attributes and sub-tags: 
* `.rules.rule.id` is an attribute of this tag which must contain a unique identifier within the DO configuration file for this rule and may have the following possible example values: ( `saveModel`, `closeForm`, `updateTitle`).  

* There is a second an attribute of this tag .rules.rule.event, which may have the possible example values of ( `onClick` and `onSave`); and 
* Also a nested sub-tag called `.rules.rule.action` which may have the values of: (`saveModel`, `closeForm`, `updateTitle` ).


**Example code 4:**
```XML
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
```
