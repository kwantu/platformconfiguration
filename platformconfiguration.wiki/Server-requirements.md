[back to main](https://github.com/kwantu/platformconfiguration/wiki)

This article discusses the server requirements for hosting the Kwantu platform.  The platform is split into an application server and one or more database servers.

# Application server

The application server manages the the application the transaction management. It accesses the data capture servers as required.  We recommend Linux 24GB, 8 cores (Note that the ram levels are related to caching of content, and is a factor of performance requirements.

| Software  | Notes  |
| :-----| :-----|
| Redis database server for the transaction manager |This is a critical performance tool. If there are load issue, we may need to segment it into a number of severs. |
| Exist-db 3.0 |This will run some basic server based operations|
| Node.js |To run the application |
|Nginx |Load balancer and proxy server |

# Database server

The database servers holds a database per community. This means that we can easily separate different communities onto different servers, or we can cluster the servers and add a load-balancer in front. The optimal scenario will depend on your context.  We recommend three servers running in a cluster with Linux 24GB, 8 cores
(Note that the ram levels are related to caching of content, and is a factor of performance requirements.

| Software  | Notes  |
| :-----| :-----|
| CouchDB server version 2.2 |This is a critical performance tool. If there are load issue, we may need to segment it into a number of severs. |
| Java |For use by the Lucene indexer|
| Lucene indexer | |

# Minimum requirements

The minimum recommended requirements are:

CPU - 3.2GHz Quad-Core Xeon
RAM - 24 GB DDR3 1333MHz
Hard Drives - 2x 1 TB Enterprise
RAID Level - RAID 1
Linux Centos 

# Example specifications


Incorporate use case config examples as per https://confluence.atlassian.com/doc/server-hardware-requirements-guide-30736403.html

# Software stack

The Kwantu platform is based on the following stack.

| Product type        | Product           | Version  | License  |
| :------------- |:-------------| :-----| :-----|
| Web server | [nginx](https://github.com/nginx/nginx) | 1.10.2 |[2-clause BSD](https://en.wikipedia.org/wiki/Simplified_BSD_License) |
| Database | [Couch DB](https://github.com/apache/couchdb) | 2.3.0 |[Apache License 2.0](https://en.wikipedia.org/wiki/Apache_License)|
| Database | [Exist-db](https://github.com/exist-db/exist/) | 2.2 |[GNU LGPL v2.1](https://en.wikipedia.org/wiki/GNU_Lesser_General_Public_License) |
| JavaScript | [Node.js](https://github.com/nodejs/node) |9.4.0 |[MIT license](https://en.wikipedia.org/wiki/MIT_license) |
| Jasper reports | [Ireport](https://github.com/Jaspersoft/jasperreports) | 6.3.0 |[GPLv3](http://www.gnu.org/licenses/gpl-3.0.html)|
| Redis |  | 3.2.12 |[Three clause BSD license](https://redis.io/topics/license)|
| MySQL Community Edition |  | 6.3.0 |[GPL License]|
|  | Oracle Java OpenJDK | 1.8.0_181-b13|[GPLv2](http://openjdk.java.net/legal/gplv2+ce.html)|
| Apache Lucene |  | 7.6.0|[Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0.html)|
| Git |  | 1.7.1 ||

# Notes

Reference https://hackernoon.com/running-a-couchdb-2-0-cluster-in-production-on-aws-with-docker-50f745d4bdbc