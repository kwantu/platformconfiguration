[back](https://github.com/kwantu/platformconfiguration/wiki/Support-and-Maintenance-Services-and-Procedures)
## Rest service to publish a configuration for a community to the production server

```http
https://<hostname>/exist/rest/db/kwantu-resource/api/rest/publishCommunityConfiguration.xq?communityId=<communityId>&env=<destServer>

where:
<hostname> is the server that existdb is running on for the staging: eg. kwantu9data.kwantu.net for staging
<communityId> is the uuid of the community to be migrated.
<destServer> is the code for the server to which the configuration must be pushed

for example:
http://kwantu9data.kwantu.net:8080/exist/rest/db/kwantu-resource/api/rest/publishCommunityConfiguration.xq?communityId=051a4973-d2fa-475d-ef66-e80b27c576f0&env=EPWPRS
```
### The following is a list of server codes to be used.

|Code|Server environment|
|----|-------|
| PROD01 | Kwantu live server (https://kwantu.me) |
| EPWPRS | Municipal Performer (https://municipalperformer.com) |
| EPWPRSDPW |Production server on EPWP (http://epwprs.dpw.gov.za)|
| TBI | Supporting Global Leaders |
| DEV | Kwantu testing server (htps://kwantu.support)|
| DRDLRPROD | DRDLR production server |
| DRDLRTRAIN | DRDLR training server |

## Building exist
This shows how to build the kwantu-resource collection from the kwantu9data to the various production environments.
### Step 1. Run the script to create the tarbal backup file on kwantu9data
```bash
cd /Script/build
sudo ./exist8080-backup-kwantu-resource.sh
```
This creates the following file in the /tmp directory: `kwantu-resource.tar.gz`

## Restore this to the various servers that has access to the kwantu9data server via ssh.


## For EPWPRS use the following procedure
1. Go to kwantu4 and run the following script. This will copy the file to the EPWP server accessible from the outside.
```bash
/Script/build/buildCopy-kwantu-resource-tar-toEPWPMUN.sh
```
Make sure that the file copied has the correct date and time.
2. If the backup goes to the Application server, then do this to do the restore.
```bash
/Script/build/build-A1-get-kwantu-resource-tgz.sh
```
This will copy the file from the epwpmun server to the local /tmp directory, extract its contents and do the restore.<br><br>
NBNBNB!!!: Make sure that you have copied the existing kwantu-resource/lib/mod-server.xqm file because this will overwrite the whole kwantu-resource collection.<br>
2. If the backup goes to the Oracle server, follow these steps:
Now go to the epwpmun server to copy he file the last hop to the oracle server
```bash
/Script/build/build-copy-kwantu-resource-tgz-to-oracle-server.sh
```
3. Now go to the server on which you want to restore the back and run the following script
```bash
/Script/build/buildCopy-kwantu-resource-tar-toEPWPMUN.sh
```