[Back to installation](https://github.com/kwantu/platformconfiguration/wiki/Installation)

# Configuring Existdb

We prefer to use a tested tarball with exist installed the way we have it at the moment. That removes the need to deal with all the specific exist issues such as add in libraries etc. The current example can be found on kwantu4 in `/home/willem/installation/exist.tar.gz` <br>
1. Extract this in the following location: `/usr/local/`
2. Create the required data directories if not yet there. `/usr/local/data/exist_data`
3. Make sure that the growing user is created (we will use it later)
4. Copy the start and stop scripts into /opt/
5. Make sure that the javaFiles installation in /usr/local/java is present
6. Start exist-db
7. Copy the backup and restore scripts in /Scripts

# Restore the production server database
This can be a bit of a tricky process. Follow the following steps
1. Use the exist web interface and trigger a backup on the production server that serves as a basis for the app
2. Copy the zipped backup and unzip it in /tmp/db ....
3. Prepare the restore script to look as follows.

```bash
#!/bin/bash
export JAVA_HOME="/usr/local/java"
export EXIST_HOME="/usr/local/exist"
cd /usr/local/exist

/usr/local/exist/bin/backup.sh -u admin -r '/tmp/db/__contents__.xml' &
#/usr/local/exist/bin/backup.sh -u admin -p admin -r '/tmp/db/__contents__.xml' &

#done
echo Done 
exit 0
```
4. Run this script once, it will start but then give an error unAuthenticated. That is normal. Now comment the first line and uncomment the second
```bash
#/usr/local/exist/bin/backup.sh -u admin -r '/tmp/db/__contents__.xml' &
/usr/local/exist/bin/backup.sh -u admin -p admin -r '/tmp/db/__contents__.xml' &
```
5. Run the script again. It should now run through smoothly right up to completion. Note that there will be a message of some script that need to be run. 
6. Open exist-db web view in the browser using the following URL. Make sure that port 8080 is open. If it is blocked, then  you need to proxy it through nginx. Install and set up nginx and then see below.
```http
http://<hostname>:8080/exist/apps/dashboard/index.html
```
7. See the result of the backup. 
```bash
...
Finished restore of backup.

If you restored collections inside /db/apps, you may want
to rebuild the application repository. To do so, run the following query
as admin:

import module namespace repair="http://exist-db.org/xquery/repo/repair"
at "resource:org/exist/xquery/modules/expathrepo/repair.xql";
repair:clean-all(),
repair:repair()
```
8. Open exist IDE in the browser, and execute the script above replacing all references of the server url to the current.

```http
http://localhost:8080/exist/apps/eXide/index.html
```