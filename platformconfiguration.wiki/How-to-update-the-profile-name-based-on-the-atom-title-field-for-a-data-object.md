Created by Rob Worthington, last modified on Sep 29, 2017. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+update+the+profile+name+based+on+the+atom+title+field+for+a+data+object) on 2018-12-18.

***

Updating a profile name, means updating the title of the `appProfile` indicator. Just ensure that, in any process, where the profile name requires updating, the `appProfile` must be included in the list of indicators of that _subprocess_.

**Below is a sample, used to update the _wrapper title_, getting data from another indicator's _wrapper title_:**

```javascript
{
    "_id": "appTitleForListing",
    "_seq": 1,
    "description": {
        "i18n": {
            "_id": "",
            "en": "test"
        }
    },
    "method": {
        "indicator": {
            "setWrapperElement": {
                "data": {
                    "indicatorWrapper": {
                        "indicatorSetId": "drldrlandacquisitionform",
                        "path": "title"
                    }
                },
                "indicatorSetId": "appProfile",
                "path": "title"
            }
        }
    }
}
```
As can be seen, the `setWrapperElement` function of the `indicator` is used. This defines that `"indicatorSetId": "appProfile"` means that: `appProfile` indicator will be updated; and the `"path": "title"` field will be updated. But as can be seen, this function only looks for wrapper section fields, as this is a `"setWrapperElement"` function.

Also highlighted in red is the `getNodeValue` again, which is used to bring the data in. In the above case, it is bringing in data from `drldrlandacquisitionform` indicator's `title` field, as `getNodeValue`'s `indicatorWrapper` function is used.

(Tip: `getNodeValue` in point number 2 is used to get the indicator's data from a field and in point number 3, is used to get data from the wrapper section)


**Below is sample used to update the _wrapper title_ by getting data from another indicator's _field title_**
```javascript
{
    "_id": "appTitleForListing",
    "_seq": 1,
    "description": {
        "i18n": {
            "_id": "",
            "en": "test"
        }
    },
    "method": {
        "indicator": {
            "setWrapperElement": {
                "data": {
                       "indicator": {
                           "indicatorSetId": "someSDO",
                           "elementId": "someElement"
                       }
                   } ,
                "indicatorSetId": "appProfile",
                "path": "title"
            }
        }
    }
}
```
Normally, the sequence of actions does not matter in any steps, except for the last step, where we must make sure that all actions are executed before the authorisation step.

