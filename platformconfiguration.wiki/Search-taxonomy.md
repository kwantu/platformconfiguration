Created by Rob Worthington on Oct 25, 2017. Copied from the Kwantu [wiki](http://w.kwantu.net/display/CON/Search+taxonomy) to Github 2018-12-10
Go to start of metadata

Also to integrate - https://docs.google.com/document/d/11dhg3hiPFDFsDCnqrjtwVx_CVhZsOG3TlsLnB7r6STE/edit


Search taxonomies may be defined to search on other data objects or profiles.  They may apply filters to limit the results set.
1. URL where the search is stored
Staging - http://kwantu8.kwantu.net:8001/kwantu_configs/search_UUID goes here
Production - http://couchp03.kwantu.net:8001/kwantu_configs/search_f0085098-7d5a-4a23-db3c-7a3ab39d71e0
2 Structure of the search object
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


2.1 componentType




Option
Description
Notes
code


label


2.2 output



Option
Description
Notes
code


label


2.3 query
2.3.1 content
2.3.1.1 categories




Option
Description
Notes
applicationId


emit


id



2.3.1.2 filters





Option
Description
Notes
model
This can be field or array inside model.

To filter on wrapper elements use 
“#ROOT.” as suffix eg:

#ROOT.meta-data.applicationId

If this search is to fetch repeat data, i.e if this search have defined basepath then the current context of filter will be repeat element so you can filterout on the repeat elements.
E.g
If repeat have one column named groupType and you want rows only have groupType = something then you just need to use model groupType.
If in the same case of fetching repeat data you want to filter atom entries on some field outside repeat, like you want repeat data of only those atom entries where one field outside repeat say type is equal to A then you need to use #MODEL. as suffix. Like #MODEL.type

operator
Supported operators are

equals

contains (works on field and array both)

In to check value in given set of values

value
This can be static value or can have some special value

#COMMUNITY_ID = current community id

#APPLICATION_ID = current application id

#PROFILE_ID = current profile id

#VARIABLE.abc = Match with abc variable in current profile variables



The following example shows how to filter on a specific taxonomy value in the data object.
Code example 
 Expand source
2.3.1.3 sort





Option
Description
Notes
path



2.3.2 scope





Option
Description
Notes
applicationId

Only required if scope id is profile or profile links
id

community
system
profile
profileLinks
dataContext

Valid values:

pending = Pending section

latestApproved = approved section

approved = Approved history


2.4 target




Option
Description
Notes
local





