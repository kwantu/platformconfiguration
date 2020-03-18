Created by Rob Worthington on Aug 02, 2017.  Copied from Kwantu [wiki](http://w.kwantu.net/display/CON/Linkages) 2018-12-10.

# Common errors



| Error |Cause|Resolution|
|-------|-----|----------|
|No results in linkage search|The app ID may be missing|In the app in which you link, check if the app config file has an entry in the "childApps" section. This must reference the UUID of the app that you will link too.  See [Json code block 1](https://github.com/kwantu/platformconfiguration/wiki/Linkages#json-code-block-1) below|
No results in linkage search | The name or reference field of the appProfile form may be empty. The linkage search queries these fields, so they must be populated to return a result | Check the workflow for the profile registration and profile update for the app that you are linking too. The completion step must have the actions to populate these fields

### Json code block 1:

```javascript
"childApps": [
   {
   "appId": "62acc4c8-0374-4df1-da68-ca2ddfd283ad",
   "displayName": "Properties",
   "helpText": "Properties",
   "version": "1" 
   }
],
```
