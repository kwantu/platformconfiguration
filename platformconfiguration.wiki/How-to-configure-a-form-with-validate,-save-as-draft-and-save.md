Created by Rob Worthington on Oct 25, 2017. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+configure+a+form+with+validate%2C+save+as+draft+and+save) on 2018-12-12.

We can configure three different options for saving a form.  These are:

| Option | Description | Configuration |
|--------|-------------|---------------|
|Save|Validates and saves the form on the local database|`<button id="saveButton" type="app.save" assignName="$root">`|
|Validate|Validates the form, but does not save it|`<button id="validateButton" type="app.validateForm" assignName="$root">`|
|Save as draft|Saves the form on the local database without validating it|`<button id="saveAsDraft" type="app.saveAsDraft" assignName="$root">`|

The following is an example of the configuration for each of these.
```XML
<layout id="notice" orientation="vertical" align="left">
    <label>
        <i18n xml:lang="en">✓ - validates the form without saving.</i18n>
    </label>
    <label>
        <i18n xml:lang="en">Save as draft - only saves in your local device, and not on the server.</i18n>
    </label>
    <label>
        <i18n xml:lang="en">Save - saves the data locally and on the server when the workflow has been advanced.</i18n>
    </label>
</layout>
<layout id="buttonBar" orientation="horizontal" align="left">
    <button id="validateButton" type="app.validateForm" assignName="$root">
        <label>
            <i18n xml:lang="en">✓</i18n>
        </label>
    </button>
    <button id="saveAsDraft" type="app.saveAsDraft" assignName="$root">
        <label>
            <i18n xml:lang="en">Save as draft</i18n>
        </label>
    </button>
    <button id="saveButton" type="app.save" assignName="$root">
        <label>
            <i18n xml:lang="en">Save</i18n>
        </label>
    </button>
</layout>
```

The save option may be combined with the automatic workflow transition to save and transition the workflow.

