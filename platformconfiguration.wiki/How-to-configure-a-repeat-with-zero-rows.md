Created by Rob Worthington on Nov 22, 2017. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+configure+a+repeat+with+zero+rows) on 2018-12-13.

In the context of the [app-config file](https://github.com/kwantu/platformconfiguration/wiki/Application-config) and the [forms](https://github.com/kwantu/platformconfiguration/wiki/Entity-list#form) defined in it, in some cases, you may need to set a [repeat](https://github.com/kwantu/platformconfiguration/wiki/elRepeat), to show with zero rows.  For example, when the user may or may not need to complete the repeat, but if they do, then certain fields must be completed.

The following code sample shows how to do this:
```XML
   <canDeleteAllRows>true</canDeleteAllRows>
```
   The **_canDeleteAllRows_** element tag is used to allow repeat with remove button for all rows and is shown below in the context of a form for adding users, as follows:

```XML
                                                    <userAdd>
                                                        <add type="button">
                                                            <label>
                                                                <i18n xml:lang="pt">Adicionar</i18n>
                                                                <i18n xml:lang="en">Add</i18n>
                                                            </label>
                                                        </add>
                                                        <delete type="link">
                                                            <label>
                                                                <i18n xml:lang="en">Remove</i18n>
                                                                <i18n xml:lang="pt">Remover</i18n>
                                                            </label>
                                                        </delete>
                                                        <maxIterations>4</maxIterations>
                                                        <minIterations>1</minIterations>
                                                        <canDeleteAllRows>true</canDeleteAllRows>
                                                        <addLinesMode>BlankLines</addLinesMode>
                                                    </userAdd>
```