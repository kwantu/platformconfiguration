[back](https://github.com/kwantu/platformconfiguration/wiki/Support-and-Maintenance-Services-and-Procedures)

## Procedure to remove all the autocreated views for a community

``` bash
https://kwantu.me/exist/rest/db/kwantu-resource/_tools/reports_removeAllAutocreatedViews.xql?communityId={communityId}
where
{communityId} is the communityId for the community that you want to clear.
```

```
Here is the curl example
```bash
curl https://kwantu.me/exist/rest/db/kwantu-resource/_tools/reports_removeAllAutocreatedViews.xql?communityId=54e721d3-30ca-4a1b-8669-045a4b0ee95f \
    -H 'Authorization: Basic xxxxxxxxxxxx' \
    -H 'Content-Type: application/json'
```

Here is a sample output when successfull:
```json
[
    {
        "message": "DELETE Rest service called successfully",
        "errorCode": "OK",
        "result": {
            "rev": "2-9547e2d9cae136cb1b5a1cfa1d94a682",
            "id": "ViewConfig-54e721d3-30ca-4a1b-8669-045a4b0ee95f9a82a215-8a80-40c6-f1ac-7012b65a5556Chart1",
            "ok": true
        },
        "isError": false
    },
    {
        "message": "DELETE Rest service called successfully",
        "errorCode": "OK",
        "result": {
            "rev": "2-0c9a728f87a98c9f22ac9fe7c3620e43",
            "id": "ViewConfig-54e721d3-30ca-4a1b-8669-045a4b0ee95f9a82a215-8a80-40c6-f1ac-7012b65a5556Chart1gridRepeat",
            "ok": true
        },
        "isError": false
    },...
```
If there are no records to remove, this will be the result
```json
{
    "recordsReturned": 0,
    "bookmark": "nil",
    "execution_stats": {
        "total_quorum_docs_examined": 0,
        "total_docs_examined": 0,
        "execution_time_ms": 44.336,
        "total_keys_examined": 0,
        "results_returned": 0
    },
    "docs": null,
    "isError": false
}
```