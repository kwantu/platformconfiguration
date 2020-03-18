Created by Rob Worthington on Sep 29, 2017. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+take+the+name+entered+in+the+profile+creation+field+and+set+this+as+the+sub+process+instance+name) on 2018-12-17.

***

Now this is something that refers to an action. As it is update to `subProcess` name hence if we refer to workflow action documentation (Section 4.1) and go to `subProces`s section we will get a function there name `setTitle` that updates the name of `subProcess`.


First we need to make sure that entered title is saved somewhere is indicator field by some point 1 above. Once this title is saved in the filed it can be used to set title of _subprocess_ instance.

```javascript
{
    "_id": "spTitle",
    "_seq": 2,
    "description": {
        "i18n": {
            "_id": "",
            "en": "test"
        }
    },
    "method": {
        "subProcessInstance": {
            "setTitle": {
                any getNodeValue definition
            }
        }
    }
}
```
As you can see within `setTitl`e function there is a `getNodeValue` implementation. This `getNodeValue` can pick anything and will supply this to the function. Refer last section of workflow action documentation. Below is example of `getNodeValue` for a quick reference.


Below `getNodeValue` is to bring data from:

**(1) an element**

```javascript
                "data": {
                    "indicator": {
                        "indicatorSetId": "someSDO",
                        "elementId": "someElement"
                    }
                }
```
**(2) A fixed value**

```javascript
                "data": {
                    "value": {
                        "datatype": "number",
                        "data": "10"
                    }
                }
```
**(3) From any indicator wrapper section**

```javascript
                "data": {
                    "indicatorWrapper": {
                        "indicatorSetId": "someSDO",
                        "path": "author.name"
                    }
                }
```
Calculate and variable are other two sources of `getNodeValu`. Please refer actions documentation for this.  So action to set `subprocess` name will be

```javascript
{
    "_id": "spTitle",
    "_seq": 2,
    "description": {
        "i18n": {
            "_id": "",
            "en": "test"
        }
    },
    "method": {
        "subProcessInstance": {
            "setTitle": {
                "data": {
                       "indicator": {
                           "indicatorSetId": "someSDO",
                           "elementId": "someElement"
                       }
                   }
            }
        }
    }
}
```