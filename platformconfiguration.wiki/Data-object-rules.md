This section covers actions that can be triggered from the DO.  The following table summarises which rules are available.

| Rule        | Explanation           |
| ------------- |:-------------|
| saveModel | Saves the data entered into the pending model for the DO instance |
| closeForm  | Closes the form and returns to the sub process instance in which the DO is located |
| updateTitle | Updates the title of the DO instance |

Each of these rules are described in more detail in the following sections.

# saveModel

```XML
<rule id="saveModel" event="onClick">
   <action>saveModel</action>
</rule>
```

# closeForm

```XML
<rule id="closeForm" event="onClick">
   <action>closeForm</action>
</rule>
```

# updateTitle

The following example has two parameters:

| Parameter        | Explanation           | Values  |
| ------------- |:-------------|:-----|
| update source= | This is the id of the element from which the value used to update the DO instance title is taken | Any element id |
| target= | This is the id of the DO envelope element that will be updated by the source | Any wrapper id |

```XML
<rule id="updateTitle" event="onSave">
   <action>updateTitle</action>
   <updates>
      <update source="/hasInfluencedSolutions" target="atom:title"/>
   </updates>
</rule>
```


