Created by Rob Worthington on Sep 27, 2017. . Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+validate+a+field+as+a+URL) on 2018-12-12.

The conventional way provided to validate a field as a URL in the Kwantu platform app-config-file, is to use the [regular expression](https://en.wikipedia.org/wiki/Regular_expression) comparison capability, which can be seen in the JASON code example: 

`value='"^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$"'/>` 

which has the following meaning indicating that the string is a valid URL:
* At the beginning of the URL, look for either one of the following: 
   * `http://www.` or 
   * `https://www.` or 
   * `http://` or 
   * `https://`
* followed by a single character
* followed by a sequence of any number of the following:
   * followed by any number of characters in the range from `a-z` or `0-9`
   * followed by one dash `-` or one dot `.`
   * followed by any number of characters in the range from `a-z` or `0-9`
* followed by a dot `.`
* followed by two to five characters in the range from `a-z`
* followed by a semi-colon `:` and one to five characters in the range from `a-z`
* followed by any character
* followed by an _end of line_ 

The [regular expression](https://en.wikipedia.org/wiki/Regular_expression) code example from above is expressed below in the `<elField>` tag of a form in the XML [app-config-file](https://github.com/kwantu/platformconfiguration/wiki/Application-config) as follows:

```XML
                                        <elField id="website">
                                            <displays>
                                                <display show="true" mode="edit" widget="textbox">
                                                    <label show="true">
                                                        <i18n xml:lang="en">Website</i18n>
                                                        <i18n xml:lang="pt">Website</i18n>
                                                    </label>
                                                </display>
                                                <display show="true" mode="readonly" widget="link">
                                                    <label show="true">
                                                        <i18n xml:lang="en">Website</i18n>
                                                        <i18n xml:lang="pt">Website</i18n>
                                                    </label>
                                                </display>
                                            </displays>
                                            <fieldData dataType="string"/>
                                            <validations>
                                                <validation seq="1">
                                                    <simple type="pattern" dataType="string" value='"^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$"'/>
                                                    <errorMessage>
                                                        <i18n xml:lang="en">Please enter the URL</i18n>
                                                        <i18n xml:lang="pt">Please enter the URL</i18n>
                                                    </errorMessage>
                                                </validation>
                                            </validations>
                                        </elField>
```
