# 11. Hash

The **`hash`** is the way the platform implements a hashed field.

```
<elHash id="secretField">
    <displays>
        <display show="true" mode="edit" widget="hash">
            <label show="true">
                <i18n xml:lang="en">Secret Identity String</i18n>
            </label>
        </display>
        <display show="true" mode="readonly" widget="label">
            <label show="true">
                <i18n xml:lang="en">Secret Identity String</i18n>
            </label>
        </display>
    </displays>
    <fieldData dataType="string"/>
    <validations></validations>
</elHash>
```