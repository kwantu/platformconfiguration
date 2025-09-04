[back to installations page ...](https://github.com/kwantu/platformconfiguration/wiki/Installation)

## Create the data base folders

```bash
cd /usr/local
sudo mkdir /usr/local/data
sudo mkdir /usr/local/data/couchdb
sudo chown couchdb:couchdb /usr/local/data/couchdb

```

## ​Set the resource limits

Some assistance can be found in the following pages:
* https://stackoverflow.com/questions/41103624/emfile-error-running-couchdb-on-ubuntu-16
* https://stackoverflow.com/questions/39506149/ubuntu-16-04-systemd-redis-issues-with-ulimit/39506150#39506150 <br>

If the system is set up to use the Pluggable Authentication Modules (PAM) system (as is the case with nearly all modern Linuxes), creating a file named /etc/security/limits.d/100-couchdb.conf with the following contents will ensure that CouchDB can open up to 10000 file descriptors at once:

```bash
vim /etc/security/limits.d/100-couchdb.conf
```
```bash
#<domain>    <type>    <item>    <value>
couchdb      hard      nofile    264000
couchdb      soft      nofile    264000
couchdb      soft      nproc     264000
couchdb      hard      nproc     264000
```

### Update the settings in the initiation scripts
These changes are in the `/etc/sv/couchdb/run` script
```bash
vim /etc/sv/couchdb/run
```
Make sure that that following line entries are placed. They do the following:
1. Increase the ulimits
2. Increase number of Erlang connections allowed. Even if you’ve increased the maximum connections CouchDB will allow, the Erlang runtime system will not allow more than 1024 connections by default. `ERL_MAX_PORTS` directive increases that<br>
```bash
#!/bin/sh
ulimit -n 64000
export ERL_MAX_PORTS=64000
echo 30 > /proc/sys/net/ipv4/tcp_fin_timeout
echo 1 > /proc/sys/net/ipv4/tcp_tw_recycle
echo 1 > /proc/sys/net/ipv4/tcp_tw_reuse
export HOME=/opt/couchdb
exec 2>&1
exec chpst -u couchdb ${HOME}/bin/couchdb
```

### Make modifications to the sysctl.conf
1. Reduce the default TIME_WAIT value. 
See a description here http://www.linuxbrigade.com/reduce-time_wait-socket-connections. This is done for the current session in the run script. But can also be set to load for the system wide settings. On different distributions this will be in different places. <br>

**Centos:** Add below in /etc/sysctl.conf
```bash
vim /etc/sysctl.conf
```

**RedHat:** Create a file in `/usr/lib/sysctl.d` called `kwantu.conf` with the following content:<br>
```bash
vim /usr/lib/sysctl.d/kwantu.conf
```
This is the content to insert
```bash
# Decrease TIME_WAIT seconds
net.ipv4.tcp_fin_timeout = 30
 
# Recycle and Reuse TIME_WAIT sockets faster
net.ipv4.tcp_tw_recycle = 1
net.ipv4.tcp_tw_reuse = 1

```

### Set the iptables ports and firewall (for a non-clustered environment)

To secure that site we have currently blocked outside contact to the server on port 5984 via localhost only. If the solution uses iptables as a firewall, edit the following file <br>

```bash
vim /etc/sysconfig/iptables
```
and set: (replace 10.131.229.189 with the ipaddress of the appserver)<br>

```bash
# allow Appserver to couchdb
-A INPUT -p tcp -s 10.131.229.189 -m tcp --dport 8003 -m state --state NEW -j ACCEPT -m comment --comment "couchdb appserver"
# allow Appserver to couchdb-lucene
-A INPUT -p tcp -s 10.131.229.189 -m tcp --dport 5985 -m state --state NEW -j ACCEPT -m comment --comment "couchdb appserver"
```
Remember to restart the iptables for the updates to take place.<br>

```bash
service iptables restart
```

### For RedHat use firewall-cmd 
(If the db server is not open to the world, then we do not need to hassle with ssl on the db server)

```bash
firewall-cmd --zone=public --add-port=8003/tcp --permanent
firewall-cmd --zone=public --add-port=5985/tcp --permanent
firewall-cmd --reload

# To start firewalld
systemctl enable firewalld
systemctl start firewalld

# To get its status
systemctl status firewalld


#And check whether the port was added to ipatables rules:
iptables-save | grep 8003
#should return
#-A IN_public_allow -p tcp -m tcp --dport 80 -m conntrack --ctstate NEW -j ACCEPT
```

## Update the settings in the couchdb configuration file
The couchdb configuration files are held in the `{COUCHDB_HOME}\etc\defaults\local.ini`. See the example configuration file below. <br>. The `local.ini` contains server specific settings that can be overwritten.
```bash
vim /opt/couchdb/etc/local.ini
```

1. In the [couchdb] section add the following

```ini
[couchdb]
os_process_timeout = 1200000
uuid = 9ef95bc799d2fb2784193426fa25fd7b
database_dir = /usr/local/data/couchdb/data
view_index_dir = /usr/local/data/couchdb/index
max_dbs_open = 5000
file_compression = snappy
```
2. In the [couch_peruser] section add the following

```ini
[couch_peruser]
enable = false
```
3. In the [chttpd] section add the following

```ini
[chttpd]
bind_address = 197.242.156.57
port = 8003
```
4. In the [couch_httpd_auth] section add the following

```ini
[couch_httpd_auth]
timeout = 30000
```

5. Insert the lucene user in the [admins] section

```ini
[admins]
Administrator = -pbkdf2-36931c4fb8a71a596dc27a1955d58b0b820bb846,81e54ecb603a32447fbcb94fd13977d0,10
lucene = -pbkdf2-30b3df1f1974daf0ae559e8a70d56df7054c302c,2c5878bba5d7924ac7efbe365da4f601,10
```

6. Insert the following sections at the bottom

```ini
[cors]
origins = *
methods = GET, PUT, POST, HEAD, DELETE
headers = accept, authorization, content-type, origin, referer, x-csrf-token
credentials = true

[replicator]
connection_timeout = 60000
max_jobs = 1000
max_churn = 200

[log]
level = debug
```

6. Deal with the ssl stuff once the certificates are available

```ini
[ssl]
cert_file = /etc/nginx/ssl/kwantu.support.crt
key_file = /etc/nginx/ssl/kwantu.support.key
cacert_file = /etc/nginx/ssl/lets-encrypt-x3-cross-signed.pem
tls_versions = ['tlsv1.2']
```
### Update the nginx so that it points to the couchdb-lucene instance and port. 


Remember to set the nginx redirect where `nnn.nnn.nnn.nnn` is the server Ip address that couchdb runs on and binds to
```js
upstream couchdb {
    server nnn.nnn.nnn.nnn:5985;
}
...
        location /kwantu_ {
                proxy_set_header        ns_server-ui yes;
                proxy_pass        http://couchdb8003;
                include /etc/nginx/proxy_default.conf;
        }

        location /_utils {
                proxy_set_header        ns_server-ui yes;
                proxy_pass        http://couchdb8003;
                include /etc/nginx/proxy_default.conf;
        }

        location /_session{
                proxy_set_header        ns_server-ui yes;
                proxy_pass        http://couchdb8003;
                include /etc/nginx/proxy_default.conf;
        }

        location /_all_dbs{
                proxy_set_header        ns_server-ui yes;
                proxy_pass        http://couchdb8003;
                include /etc/nginx/proxy_default.conf;
        }

        location /_find{
                proxy_set_header        ns_server-ui yes;
                proxy_pass        http://couchdb8003;
                include /etc/nginx/proxy_default.conf;
        }

```




## Set up the configuration details through the fauxton interface.
1. Log in to the fauxton interface with {serverURL}:8003/_utils
2. Go to the `Setup Apache CouchDB` link and complete the details for the single server setup. Make sure to set the administrator name and passwords correct, and bind it to the host ip address, not 0.0.0.0 that will allow connections from anywhere.

## Finally set the permissions on the INI files

```bash
chmod 0644 /opt/couchdb/etc/*
```

## Create the key databases
```
#through fauxton
_users
_replicator
_global_changes

#or using curl replacing the 127.0.0.1 with the actual ip address of the couchdb server you need.
curl -X PUT http://127.0.0.1:5984/_users
curl -X PUT http://127.0.0.1:5984/_replicator
curl -X PUT http://127.0.0.1:5984/_global_changes
```
# Updating config to support Gzip compression
## In <couchdb>/etc/local.ini

Add/Update below mentioned settings in the suggested sections

```
[chttpd]
compression_level = 6
compress_response = true
compressible_types = text/*, application/javascript, application/json, application/xml
compression_min_size = 128

[httpd]
compression_level = 6
compress_response = true
compressible_types = text/*, application/javascript, application/json, application/xml
compression_min_size = 128

[cors]
headers = accept, authorization, content-type, origin, referer, accept-encoding, vary
```

In all nginx files which listne over 443 for any domain, insude 'server' json block add
```
	# Enable compression
gzip on;
gzip_vary on;
gzip_comp_level 6;
gzip_min_length 1000;
gzip_proxied any;
gzip_types
    application/json
    application/javascript
    text/css
    text/javascript
    text/plain
    text/xml;
```

# Troubleshooting
emfile in the log means you've run out of file descriptors.

## timeouts
https://github.com/apache/couchdb/issues/859
https://github.com/apache/couchdb/issues/1267

netstat -nat | awk '{print $6}' | sort | uniq -c | sort -n
