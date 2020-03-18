Created by Rob Worthington, last modified on Oct 25, 2017. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+configure+instanceType+in+the+workflow) on 2018-12-13.


Each workflow process must be defined as either a `newSequence` or a `newInstance`.  The option to choose depends on the purpose of the workflow.  The following examples may help decide which to use.

`newSequence` type workflows should never specify the maximum number of instances.  Only one is ever allowed.

|Example|Explanation|
|-------|-----------|
|Process to create a new profile	|* The workflow will create a new instance. <br> * It has a maximum of one instance for the process (ie there can be only one profile). <br> * Multiple sequences are allowed. <br> * Deletion of sub profile instances is not allowed.<br> |

**Configuration**
```javascript
"instanceType": {
    "newSequence": {
        "maxSequences": 1
    }
}
```

|Example|Explanation|
|-------|-----------|
|Process to update a profile	|* This workflow will create a new sequence. <br> * Multiple sequences are allowed.|

**Configuration**
```javascript
"instanceType": {
    "newSequence": {
        "maxSequences": -1 
    }
}
```
|Example|Explanation|
|-------|-----------|
Process to create multiple locations, outcomes or other data objects	| * The workflow will create a new instance. <br> * Multiple instances are allowed. <br> * Multiple sequences of the same instance are allowed. <br> * Deletion of sub profile instances is allowed.|

**Configuration**
```javascript
"instanceType": {
    "newInstance": {
        "maxInstances": -1,
        "maxSequences": -1,
        "mayDelete": true 
    }
 }
```
|Example|Explanation|
|-------|-----------|
|Process that repeat each month, quarter or year| * This workflow will create a new sequence <br> * Multiple sequences are allowed <br> |

**Configuration**
```javascript
"instanceType": {
    "newSequence": {
        maxSequences": -1
    }
}
```