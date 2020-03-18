[back](https://github.com/kwantu/platformconfiguration/wiki)

## 1. Providing access to a user

Create the private and public keys using puttygen.
Save the private key in the user machine, and copy the public key to a location on the server. For this example that place is `/home/willem/nceba_public`

```bash
sudo su -
useradd nceba
cd /home/nceba
mkdir /home/nceba/.ssh
cp /home/willem/nceba_public /home/nceba/.ssh/authorized_keys
chown -R nceba /home/nceba/.ssh
chmod 600 /home/nceba/.ssh/authorized_keys
chmod 700 /home/nceba/.ssh
usermod -a -G wheel nceba
service sshd restart
```

# Stopping and starting services
## Application server
The following services are running:

### betterdata-mobile: application directory
### openVpn_restart.sh: Script to start our internal vpn
This is only used for remote support if needed. 
### rebuildCouchdbIndexes.sh: Script to automatically reindex the database
This script will run a procedure that will re-index all the database server couchdb databases. Note that this might affect users so should be run after hours. It writes the results into the two files
rebuildCouchdbIndexes.sh.delete.txt
rebuildCouchdbIndexes.sh.create.txt
### startNode.sh: Restarts the app, and does a build if there has been changes.
To start: `startNode.sh` <br>
This will close the app, see if there is any of the latest changes that need to be brought down using git, and then start the app running on node.js.<br>
The logs for the app is in the following location: `~/.pm2/logs/`. <br>
```bash
cd ~/.pm2/logs/
ll
-rw-r--r-- 1 root root  129262 Mar  6 11:47 mobile1-8-error-0.log
-rw-r--r-- 1 root root 1307974 Mar  6 11:47 mobile1-8-out-0.log
```
To see if there are any issues tail the log files for the error, or the output log: <br>
`tail -f mobile1-8-error-0.log` will show the logs as they are updated.<br>
`tail -200 mobile1-8-error-0.log` will show the last 200 lines in the log.
If there is an issue with looking for node modules, find the instructions [here](https://github.com/kwantu/platformconfiguration/wiki/Installation-Server-upgrade-checklist)

### start_exist.sh / stop_exist.sh: Scripting engine with db server, and the reporting server.
To stop: `./stop_exist.sh`<br>
Once stopped, then make sure that the service stopped completely<br>
`ps -ef | grep exist` <br>
If there are any instances running stop with kill -9 <pid>
To Start: `sh ./start_exist.sh &`
### nginx: the proxy server that is running in front of everything
To start `service nginx restart`



## Database server
The following apps are running here:
### couchdb: Database server
The database is running on a service that is accessed through the sv command <br>
Stop: `sv stop couchdb` <br>
Start: `sv start couchdb` <br>
Restart: `sv restart couchdb` <br>

The logs are in the `/var/log/couchdb`<br>
To make sure that it is running, where the ip address is the one that is bound
 
```bash
curl http://10.131.229.207:8003
{"couchdb":"Welcome","version":"2.3.0","git_sha":"07ea0c7","uuid":"9ef95bc799d2fb2784193426fa25fd7b","features":["pluggable-storage-engines","scheduler"],"vendor":{"name":"The Apache Software Foundation"}}
```


### couchdb-lucene: Lucene indexing server for couchdb
This is installed in `/opt/couchdb-lucene`.<br>
To Start: `/opt/start-couchdb-lucene.sh`
To see if it is running: <br>
`ps -ef | grep java`
To find the logs: <br>
`/opt/couchdb-lucene/logs` <br>
