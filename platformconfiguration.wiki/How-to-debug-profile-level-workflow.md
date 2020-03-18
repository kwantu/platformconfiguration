Created by Rob Worthington on Oct 12, 201. Copied from Kwantu [Wiki](http://w.kwantu.net/display/CON/How+to+debug+profile+level+workflow) on 2018-12-17.

***


### Steps for debugging data for PROFILE level workflow:

1. Open profile

2. Run on console

```javascript
dao.get("_local/"+app.profile._id + ":processes:local")
.then(function(s){console.log(JSON.stringify(s)); }).catch(function(s){console.log(s)})
```
3. Run on console

```javascript
dao.get(app.profile._id + ":processes")
.then(function(s){console.log(JSON.stringify(s)); }).catch(function(s){console.log(s)})
```
4. Copy response of command 2 & 3 in a file and send us for debugging.

### Step to clear PROFILE level workflow issue:

1. Open profile

2. Run command on console

```javascript
dao.deleteDocument("_local/"+app.profile._id + ":processes:local")
.then(function(s){console.log(s); }).catch(function(s){console.log(s)})
```
3. Go back to profile listing page and open the profile again

### Steps for debugging data for SUB_PROFILE level workflow:

1. Open profile

2. Open subprofile node on which the problem is

3. Run on console

```javascript
dao.get("_local/"+app.profile.subprofileId + ":processes:local")
.then(function(s){console.log(JSON.stringify(s)); }).catch(function(s){console.log(s)})
```

4. Run on console

```javascript
dao.get(app.profile.subprofileId + ":processes")
.then(function(s){console.log(JSON.stringify(s)); }).catch(function(s){console.log(s)})

```
5. Copy response of command 3 & 4 in a file and send us for debugging.

### Step to clear SUB_PROFILE level workflow issue:

1. Open profile

2. Open subprofile node on which the problem is

3. Run command on console
```javascript
dao.deleteDocument("_local/"+app.profile.subprofileId + ":processes:local")
.then(function(s){console.log(s); }).catch(function(s){console.log(s)})
```

3. Go back to profile listing page and open the profile again

