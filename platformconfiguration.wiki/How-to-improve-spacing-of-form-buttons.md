At the bottom of each form are buttons to save, validate or save as draft.  The following code examples shows how to set adequate spacing between the buttons such that they are not crowded together.


```
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
                                                <button id="saveButton" type="app.save" assignName="$root" style="prominent">
                                                    <label>
                                                        <i18n xml:lang="en">Save and close</i18n>
                                                    </label>
                                                </button>
                                                <button id="validateButton" type="app.validateForm" assignName="$root" style="normal">
                                                    <label>
                                                        <i18n xml:lang="en">✓ check form validations</i18n>
                                                    </label>
                                                </button>
                                                <button id="saveAsDraft" type="app.saveAsDraft" assignName="$root" style="normal">
                                                    <label>
                                                        <i18n xml:lang="en">Save as draft</i18n>
                                                    </label>
                                                </button>
                                            </layout>
```