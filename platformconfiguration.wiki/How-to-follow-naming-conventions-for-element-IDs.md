Created by Rob Worthington on Aug 23, 2018. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+follow+naming+conventions+for+element+IDs) on 2018-12-13.

**This article describes naming conventions for element IDs.**

All element IDs must use [`camelCase`](https://www.quora.com/What-is-the-difference-between-Pascal-Case-and-Camel-Case) formatting and ideally be defined in the spec to ensure they have business meaning.  

## Repeat structures

Each repeat has five separate element IDs.  However, four of these should always follow the same standard ID as per the example below.

Only the actual repeat ID should be distinct.  In this example unlinkedIssuesRepeat. This must always be a meaningful name that describes the repeat and it's contents.

See examples of naming conventions below as follows:

**XML**
```XML
<repeatDef id="repeatDef">
    <headerRow id="header" show="false"/>
    <dataRow id="data" show="true"/>
    <summaryRow id="summary" show="false"/>
```
**JSON**
```javascript
        "unlinkedIssuesRepeat": {
          "summary": "",
          "header": "",
          "repeatDef": {
            "data": [
```