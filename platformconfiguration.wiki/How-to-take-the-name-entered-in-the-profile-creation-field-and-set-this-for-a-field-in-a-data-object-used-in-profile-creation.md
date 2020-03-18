Created by Rob Worthington on Sep 29, 2017. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+take+the+name+entered+in+the+profile+creation+field+and+set+this+for+a+field+in+a+data+object+used+in+profile+creation) on 2018-12-17.

***

This is achieved by an implicit property within the `form.create` action, which is defined in the first action of the _subprocess_. 

**Example below:**
```Javascript
                                    {
                                        "_id": "form.create",
                                        "_seq": 1,
                                        "description": {
                                            "i18n": {
                                                "_id": "",
                                                "en": "test",
                                                "pt": "teste"
                                            }
                                        },
                                        "method": {
                                            "form": {
                                                "create": "fromDefinition"
                                            }
                                        },
                                        "setDraft": true,
                                        "setWorkflowLabelInField": "appProfile.Name",
                                        "setWorkflowLabelInTitle": true
                                    }
```

Where `appProfile` is the indicator. It can also be any other indicator. Once the indicators are created at _first step_, the `workflow` label is passed and set into `Name` (in this case) the field of this `appProfile` indicator.
Putting `setDraft: true` will set all the indicators to `draft = true`, hence it will send them to the pending list of profiles. This property is normally supplied where profile creation is done. For example, this property is needed in `profileRegistration` so that newly created profiles will go into the pending list, as the profile listing screen checks the `appProfile` indicator draft status.

Putting `setWorkflowLabelInTitle:` This property will set the supplied workflow title indicator's title. So in the case of `profileRegistration`, the `appProfile` indicator's title (wrapper section) will be updated, which is displayed on the profile listing page. If you supply this on to other _subprocesses_, which do not contain `appProfile` (lets say `MonthlyProgress` process), which (for example) has 5 indicators, this workflow title value will be updated to the title (Wrapper) of all the indicators. Normally this property is not used other than in the profile creation process.
