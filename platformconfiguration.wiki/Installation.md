[back to the main page ...](https://github.com/kwantu/platformconfiguration/wiki)


# Checklists for installation of servers
Note that a collection if installation items are stored in /home/willem/installation<br>

## Application Server Installation
The following checklist of activities manages the installation of the typical application server
1. Basic packages
2. Nginx
3. Exist-db
4. Exist-db data
5. Node.js and betterdata app
6. Redis
7. MySQL
8. Certbot scripts
9. Scripts in /opt to start things.
10. Set up the firewall. (Mostly IPTables)
<br>

## Database Server Installation
The following checklist of activities manages the installation of the typical application server
1. Basic packages
2. Couchdb
3. Lucene indexing
4. Backups
5. Scripts in /opt to start things
6. Set up the firewall. (Mostly IPTables)
<br>

# Detailed list of applications and how to go about installing them
## General utilities on a new server

```bash
yum install wget # tool to fetch data from the internet
yum install vim  # text editor
yum install htop # to view all running processes and services stats
yum install java # to run exist, jasper and lucene
yum install ncdu # utility to analyse the use of disk space
```
1. Create a symlink for java to the installation where the actual path is what is on your installation
```bash
ln -s /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.201.b09-2.el7_6.x86_64.jre /usr/local/java
```


## NodeJS and The main application
[Installing on a new server](https://github.com/kwantu/platformconfiguration/wiki/Installation-Nodejs-and-the-Main-Application).<br>
## Nginx
[View the configuration details for nginx here](https://github.com/kwantu/platformconfiguration/wiki/Installation-configuration-nginx)

## CertBot and letsEncrypt
[View the installation and configuration details for CertBot and letsEncrypt here](https://github.com/kwantu/platformconfiguration/wiki/Installation-configuration-certbot-letsencrypt)

## Exist-db
[View the configuration details for exist-db here](https://github.com/kwantu/platformconfiguration/wiki/Installation-configuration-exist-db)

## iptables firewall
[View the installation and configuration details for iptables firewall here](https://github.com/kwantu/platformconfiguration/wiki/Installation-iptables)

## Redis (transaction management database server)
[View the installation details for redis here](https://github.com/kwantu/platformconfiguration/wiki/Installation-redis)

## MySQL (For user accounts only)
[View the configuration details for MySQL here](https://github.com/kwantu/platformconfiguration/wiki/Installation-configuration-mysql)

# Database Server Installation
## Couchdb installation and configuration
This manages the installation and configuration of the couchdb database server.<br>
* [The installation instructions can be found here](https://github.com/kwantu/platformconfiguration/wiki/Installation-Couchdb).<br>
* [Setting up the cluster](https://github.com/kwantu/platformconfiguration/wiki/Installation-Couchdb-Cluster).<br>
* [The configuration instructions can be found here](https://github.com/kwantu/platformconfiguration/wiki/Installation-Couchdb-Configuration).<br>

## Couchdb Lucene (Rnewson)

This manages the indexes for the profiles and sub-profiles searches. [The installation instructions can be found here](https://github.com/kwantu/platformconfiguration/wiki/Installation-Couchdb-Lucene).

## ssl Certificate using certbot on nginx

[This process sets up the ssl certificate from certbot / letsencrypt](https://github.com/kwantu/platformconfiguration/wiki/Installation-ssl-certbot).<br>

## ElasticSearch and Kibana
[Install guides](https://github.com/kwantu/platformconfiguration/wiki/Installation-ElasticSearch-Kibana)

## MySQL installation and configuration


# Build and update processes


[Checklist for updating a server](https://github.com/kwantu/platformconfiguration/wiki/Installation-Server-upgrade-checklist).<br>

Needs review and updating - https://drive.google.com/drive/search?q=Kwantu%201.8%20Application%20installation%20and%20settings

https://docs.google.com/document/d/1adzuH8hU06hsC86hC8X7nQFOI6kWc2Rk8rWwX-W2AeA/edit#heading=h.hnmmaalmltfi

Extensive document - https://docs.google.com/document/d/17XLSmw2J_ufguyhwvLGPry_ldNhz5xjcz7ugN8CmRLg/edit?ts=5c136998#heading=h.3f1w5lqqexp0

