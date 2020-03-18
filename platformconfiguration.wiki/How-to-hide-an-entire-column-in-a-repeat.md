The following code example shows how to set show="false" in a repeat to hide one or more columns.  This ensures that the entire column is hidden.

```
<repeatColumn columnOrder="2" seq="2" width="50%" show="false">
                                                <repeatHeader span="" labelsFromData="">
                                                    <label>
                                                        <i18n xml:lang="en">Meeting date</i18n>
                                                        <i18n xml:lang="pt">Meeting date</i18n>
                                                    </label>
                                                </repeatHeader>
```