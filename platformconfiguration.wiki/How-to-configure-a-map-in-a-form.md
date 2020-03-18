Displaying a map in a form enables users to capture any of the following:

* Line
* Polygon
* Point

This data is saved with the data object and may be used to render the data object on a map.  When viewed three icons display in the map.  These allow the user to select which of the above options they will use.  They then click on the map to begin entering data.

Following is a code example to use in your data object:

```
<elMap id="Map">
                                            <displays>
                                                <display show="true" mode="edit" widget="editableMap">
                                                    <label show="true">
                                                        <i18n xml:lang="en">Map Location</i18n>
                                                    </label>
                                                    <style width="100%"/>
                                                </display>
                                                <display show="true" mode="readonly" widget="mapPreview">
                                                    <label show="true">
                                                        <i18n xml:lang="en">Map Location</i18n>
                                                        
                                                    </label>
                                                    <style width="100%"/>
                                                </display>
                                            </displays>
                                            <fieldData dataType="string">
                                            </fieldData>
                                        </elMap>
```