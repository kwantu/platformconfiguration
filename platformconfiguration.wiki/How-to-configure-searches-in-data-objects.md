Created by Rob Worthington, last modified on Oct 30, 2017. Copied from Kwantu [wiki](http://w.kwantu.net/display/CON/How+to+configure+searches+in+data+objects) 2018-12-11.


# 1 The search object

The search object is stored in the kwantu_configs file, and the search document _id is as follows: <br>
Id = “search_” + uuid in the config file.

Channels are important for sync. Usually it will be “config_a_” plus appId. 

If the appId is 1024 everybody will get it. 

searchConfig:
1. Output (default to the example)
2. Query … this is the key area to modify
3. Scope
applicationId
communityId
id: (profile/community/application)
Content
Filters: here you can place a filter in the format below. (more detail needed)
Categories. See below an example how to implement
Target … where must it run,. Typically “local”.
ComponentType … leave as below

```json
{
  "_id": "search_ae66263b-49c1-41ca-d038-90175953c287",
  "_rev": "22-c3646f60808e6d2b22b3eb9d75c17f0a",
  "searchConfig": {
    "output": {
      "code": "data",
      "label": "Data extract"
    },
    "query": {
      "scope": {
        "applicationId": "c5d4b0b9-2fc3-4259-96a5-95c8fb232f88",
        "id": "profile"
      },
      "content": {
        "filters": [
          {
            "model": "#ROOT['meta-data'].subprofileId",
            "operator": "equals",
            "value": "#SUBPROFILE_ID"
          }
        ],
        "categories": [
          {
            "basepath": "modulesRepeat.repeatDef.data",
            "id": "NTIPConfigTheorySubjectDetails",
            "applicationId": "c5d4b0b9-2fc3-4259-96a5-95c8fb232f88",
            "emit": [
              {
                "path": "moduleName",
                "name": "label"
              },
              {
                "path": "moduleCode",
                "name": "moduleCode"
              },
              {
                "path": "moduleType.code",
                "name": "moduleTypeCode"
              },
              {
                "path": "moduleType.label",
                "name": "moduleTypeLabel"
              }
            ]
          }
        ]
      }
    },
    "target": "local",
    "componentType": {
      "code": "query",
      "label": "Query"
    }
  },
  "channels": [
    "config_a_c5d4b0b9-2fc3-4259-96a5-95c8fb232f88"
  ]
}
```

## 1.1 URL where the search is stored

http://couchp03.kwantu.net:8001/kwantu_configs/search_f0085098-7d5a-4a23-db3c-7a3ab39d71e0

# 2 Structure of the search object

```JASON
{   "_id": "search_f0085098-7d5a-4a23-db3c-7a3ab39d71e0",
  "_rev": "107-91a26bad95aeb1e5b7fdad9c70efb001",
  "channels": [
      "config_a_1bef91bf-3b92-47ae-f34b-b3f13f9fcda3",
      "config_a_aaf8144e-ddac-42d6-c251-aaf04682e9e4",
      "config_a_6a3b0748-1335-4316-edaf-e3a90685358e",
      "config_a_da0e5103-0fe1-4beb-d3c4-d01ba2ad0cbb"
  ]
  "searchConfig": {
      "componentType": {
          "code": "query",
          "label": "Query"
      },
      "output": {
          "code": "data",
          "label": "Data extract"
      },
      "query": {
          "content": {
              "categories": [
                  {
                      "applicationId": "da0e5103-0fe1-4beb-d3c4-d01ba2ad0cbb",
                      "emit": [],
                      "id": "appProfile"
                  }
              ],
              "filters": [
                  {
                      "model": "doc.model.pending.status",
                      "operator": "equals",
                      "value": "Authorised"
                  }
              ],
              "sort": [
                  {
                      "path": "doc.title"
                  }
              ]
          },
          "scope": {
              "applicationId": "1bef91bf-3b92-47ae-f34b-b3f13f9fcda3",
              "id": "community",
              "dataContext": "latestApproved"
          }
      },
      "target": "local"
  }
}

```

## 2.1 componentType

|Option|Description|Notes|
|------|-----------|-----|
|code||
|label||

## 2.2 output

|Option|Description|Notes|
|------|-----------|-----|
|code|||
|label|||

## 2.3 query

### 2.3.1 content

#### 2.3.1.1 categories

|Option|Description|Notes|
|------|-----------|-----|
|applicationId|
|emit|
|id|

#### 2.3.1.2 filters

|Option|Description|Notes|
|------|-----------|-----|
|model|This can be a field or an array inside a model. To filter on wrapper elements use: “**#ROOT.**” as suffix eg: **#ROOT.meta-data.applicationId**;  If this search is to fetch repeat data, i.e if this search have defined base-path then the current context of filter will be repeat element so you can filter out on the repeat elements.  E.g If the repeat element has one column named _groupType_ and you want rows only have _groupType_ = _something_ then you just need to use model _groupType_. If, in the same case of fetching data repeatedly, and you want to filter atom entries on some field outside of the repeat, like you want repeat data of only those atom entries where one field is outside of the repeat, (say _type_ is equal to _A_) then you need to use **#MODEL**. as suffix. Like **#MODEL.type**|
|operator|Supported operators are: equals; contains (works on field and array both);  In to check value in given set of values|
|value|This can be static value or can have some special value:  **#COMMUNITY_ID** = current community id;  **#APPLICATION_ID** = current application id;  **#PROFILE_ID** = current profile id;  **#VARIABLE.abc** = Match with abc variable in current profile variables|

#### 2.3.1.3 sort

|Option|Description|Notes|
|--|--|--|
|path|||

### 2.3.2 scope

|Option|Description|Notes|
|--|--|--|
|applicationId|Only required if scope id is profile or profile links|
|id|community; system; profile; profileLinks|
|dataContext|Valid values: **pending** = Pending section; **latestApproved** = approved section; **approved **= Approved history;|

## 2.4 target

|Option|Description|Notes|
|--|--|--|
|local|||

# Examples

If you need to filter on a value in the repeat, and the base path is set to the repeat, then the following examples will apply
```
#ROOT.sss.sss to start from document root
#MODEL.ddd.ddd if we need anything from outside repeat
and no suffix.... only relative path if we use inside repeat
```