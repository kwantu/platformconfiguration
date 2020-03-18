[back to installations ...](https://github.com/kwantu/platformconfiguration/wiki/Installation)

# Core couchdb installation
<a href="http://docs.couchdb.org/en/latest/install/unix.html#installation-using-the-apache-couchdb-convenience-binary-packages" target="_blank">See the official documentation here</a>

1. Enable the Apache CouchDB package repository

In CentOS open the following yum package repository
```bash
# on ubuntu
sudo mkdir /etc/yum.repos.d

sudo vim /etc/yum.repos.d/bintray-apache-couchdb-rpm.repo
```
Place the following text into the repo
```ini
[bintray--apache-couchdb-rpm]
name=bintray--apache-couchdb-rpm
baseurl=http://apache.bintray.com/couchdb-rpm/el$releasever/$basearch/
gpgcheck=0
repo_gpgcheck=0
enabled=1
```

2. Install the Apache CouchDB packages

In RedHat/CentOS run the command:

```bash
$ sudo yum -y install epel-release && yum install couchdb
```

## Install runit service manager

1. Download runit repo for centos
(Make sure you download for the correct operating system)
```bash
mkdir /root/work
curl -s https://packagecloud.io/install/repositories/imeyer/runit/script.rpm.sh > /root/work/runit.rpm.sh 
chmod 755 /root/work/runit.rpm.sh
/root/work/runit.rpm.sh
yum install runit
```

However, that seems to fail for RedHat.  Therefore followed this approach:
1. Download the rpm file from https://packagecloud.io/imeyer/runit/packages/el/7/runit-2.1.2-3.el7.centos.x86_64.rpm
2. Then install this with the rpm package manager
```bash
rpm -i runit-2.1.2-3.el7.centos.x86_64.rpm
#test that it was installed
sv
#responds as
usage: sv [-v] [-w sec] command service ...

```
3. Create couchdb service directories
```bash
mkdir /etc/sv/
mkdir /etc/sv/couchdb
mkdir /etc/sv/couchdb/log
mkdir /etc/sv/couchdb/log/supervise
mkdir /etc/sv/couchdb/control
mkdir /etc/sv/couchdb/supervise
#make sure owned by root
chown -R root:root /etc/sv
#then set the correct file permissions
chmod -R 0755 /etc/sv
chmod -R 0755 /etc/sv
chmod 0700 /etc/sv/couchdb/supervise
chmod 0700 /etc/sv/couchdb/log/supervise
```

4. Install the logging service
```bash
vim /etc/sv/couchdb/log/run

#--------insert this----------
#!/bin/sh
exec svlogd -tt /var/log/couchdb
```

5. Install the couchdb service
```bash
vim /etc/sv/couchdb/run

#--------insert this----------
#!/bin/sh
ulimit -n 246000
echo 30 > /proc/sys/net/ipv4/tcp_fin_timeout
echo 1 > /proc/sys/net/ipv4/tcp_tw_recycle
echo 1 > /proc/sys/net/ipv4/tcp_tw_reuse
export ERL_MAX_PORTS=246000
export HOME=/opt/couchdb
exec 2>&1
exec chpst -u couchdb ${HOME}/bin/couchdb

```
6. Create a symlink to enable boot persistant and start
```bash
ln -s /etc/sv/couchdb /etc/service/couchdb
```

## Now make sure that couchdb is correctly configured

[Configure couchdb installation](https://github.com/kwantu/platformconfiguration/wiki/Installation-Couchdb-Configuration)
