[back to installation...](https://github.com/kwantu/platformconfiguration/wiki/Installation)

## Couchdb-lucene (rnewson)

This is the installation for the rnewson implementation of lucene for Couchdb.<br>

There are some guidelines [here](https://smartregister.atlassian.net/wiki/spaces/Documentation/pages/33259522/CouchDB-Lucene+installation+guideline+for+Full-Text+search)<br>

Please make sure that java is installed on the server. You can find the instructions [here](https://github.com/kwantu/platformconfiguration/wiki/Installation-Install-Java)<br>

### Build couchdb-lucene application from sources
1. Checkout the repository by git clone https://github.com/rnewson/couchdb-lucene.git ( Some breakage likely on master for a while. Use 1.1.0 release (https://github.com/rnewson/couchdb-lucene/releases/tag/v1.1.0) if you want stable.)
1. Enter into the application root directory by the command : cd couchdb-lucene
1. Run the command:  mvn install
1. Run the command: mvn
1. Enter into the target folder you will find a tar and a zip folder.
1. Unzip or Untar the folder and put it in `/opt`
1. Rename the folder couchdb-lucene-<version>-dist.* to couchdb-lucene

### Install from the kwantu installation environment.
1. The kwantu environment is on our server kwantu4.kwantu.net.
2. The folder is /willem/home/installation/couchdb-lucene
3. Copy the file `couchdb-lucene.tar.gz` to the database server where couchdb is running
4. Extract the contents of `couchdb-lucene.tar.gz` to the /opt/couchdb-lucene

### Specify the configuration details
1. Copy the startup script `start-couchdb-lucene.sh` to /opt
2. Create the data directory where the index data will be stored: `/usr/local/data/couchdb-lucene`
3. Update the configuration file in `/opt/couchdb-lucene/conf/couchdb-lucene.ini` replacing the ip address of the server running lucene and set the lucene user password

`nnn.nnn.nnn.nnn` is the server Ip address that lucene binds to.<br>

```ini
[lucene]
# The output directory for Lucene indexes.
#dir=indexes
dir=/usr/local/data/couchdb-lucene/indexes

# The local host name that couchdb-lucene binds to
host=nnn.nnn.nnn.nnn

# The port that couchdb-lucene binds to.
port=5985

# Timeout for requests in milliseconds.
timeout=1200000

# Timeout for changes requests.
changes_timeout=600000

# Default limit for search results
limit=50

# Allow leading wildcard?
allowLeadingWildcard=true

# couchdb server mappings
[local]
url = http://{luceneUser}:{luceneUserPasswd}@nnn.nnn.nnn.nnn:8003/
```
4. Create an administrator user called lucene with the password identified above in couchdb using the rest or fauxton interfaces
5. Update the nginx settings so that /local/ redirects requests to the port specified on the database server.

### Create the startup script
The following startup script can be created to start the lucene indexing service.
`/opt/start-couchdb-lucene.sh`

```bash
cd /opt/couchdb-lucene
/opt/couchdb-lucene/bin/run &
```
When started up successfully it will show the following in the console:
```log
[root@localhost opt]# 2019-02-02 14:43:42,696 INFO [Config] Index output goes to: /usr/local/data/couchdb-lucene/indexes
2019-02-02 14:43:42,776 INFO [Main] Accepting connections with ServerConnector@20398b7c{HTTP/1.1,[http/1.1]}{10.131.229.208:5985}
```

### Update the nginx so that it points to the couchdb-lucene instance and port. 


Remember to set the nginx redirect where `nnn.nnn.nnn.nnn` is the server Ip address that lucene binds to
```js
upstream lucene5985 {
    server nnn.nnn.nnn.nnn:5985;
}
...
        location /local {
                proxy_set_header        ns_server-ui yes;
                proxy_pass              http://lucene5985;
                include /etc/nginx/proxy_default.conf;
        }
```

