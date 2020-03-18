[back to installation](https://github.com/kwantu/platformconfiguration/wiki/Installation)

## Installation of ElasticSearch for the full open source version.
```bash
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-oss-7.3.0-x86_64.rpm
rpm -i elasticsearch-oss-7.3.0-x86_64.rpm
wget https://artifacts.elastic.co/downloads/kibana/kibana-oss-7.3.0-x86_64.rpm
rpm -i kibana-oss-7.3.0-x86_64.rpm
curl -X GET "localhost:9200/?pretty"
```
## Installation of ElasticSearch for the openDistro version.
https://opendistro.github.io/for-elasticsearch-docs/docs/install/rpm/
```bash
#prepare the yum repositories
cd /etc/yum.repos.d/
curl https://d3g5vo6xdbdb9a.cloudfront.net/yum/opendistroforelasticsearch-artifacts.repo -o opendistroforelasticsearch-artifacts.repo
#install java jdk
yum install java-1.8.0-openjdk-devel
#install elasticSearch
yum install opendistroforelasticsearch
#create this link
ln -s /usr/lib/jvm/java-1.8.0/lib/tools.jar /usr/share/elasticsearch/lib/
#systemctl start elasticsearch.service

https://opendistro.github.io/for-elasticsearch-docs/docs/install/plugins/
```

## Installation of ElasticSearch for the free basic version.
https://www.elastic.co/guide/en/elasticsearch/reference/7.4/rpm.html#rpm-repo


```bash
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
# create the repo
 vim /etc/yum.repos.d/elasticsearch.repo
...
[elasticsearch-7.x]
name=Elasticsearch repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md

# then 
sudo yum install elasticsearch

curl -X GET "http://127.0.0.1:9200/?pretty"

#Create the data directory
mkdir /usr/local/data/elasticsearch 
chown elasticsearch:elasticsearch /usr/local/data/elasticsearch

#edit the settings
vim /etc/elasticsearch/elasticsearch.yml
#
# Path to directory where to store the data (separate multiple locations by comma):
#
path.data: /usr/local/data/elasticsearch
#
# Set the bind address to a specific IP (IPv4 or IPv6):
#
network.host: 197.242.158.124
#
# Set a custom port for HTTP:
#
http.port: 9200


service elasticsearch start
#test that it is working
curl -XGET https://localhost:9200 -u admin:admin --insecure
curl -XGET https://localhost:9200/_cat/nodes?v -u admin:admin --insecure
curl -XGET https://localhost:9200/_cat/plugins?v -u admin:admin --insecure
service elasticsearch status
```

###Note if upgrading to version 7.4.0
It requires the temp directory to be explicitly set. 
```bash
# first create the temp directory
cd /usr/local/data/elasticsearch
mkdir tmp
chown elasticsearch:elasticsearch tmp

# then set the system to be able to read it
vim /etc/sysconfig/elasticsearch
....
# Additional Java OPTS
ES_JAVA_OPTS="-Djna.tmpdir=/usr/local/data/elasticsearch/tmp"

```

## Installation of Kibana

```bash
yum install kibana
service kibana start

##set the ports
vim /etc/sysconfig/iptables
# elasticSearch and kibana
-A INPUT -p tcp -m tcp --dport 9200 -m state --state NEW -j ACCEPT
-A INPUT -p tcp -m tcp --dport 5601 -m state --state NEW -j ACCEPT

 1017  ifconfig
 1018  vim /etc/elasticsearch/elasticsearch.yml
 1019  service elasticsearch stop

vim /etc/kibana/kibana.yml
#set the following
server.port: 5601
#specify the host on which the kibana server is running
server.host: "197.242.156.94"
#specify the host on which the elastic search server is running
elasticsearch.hosts: ["http://197.242.156.94:9200"]

server.basePath: "/kibana"
server.rewriteBasePath: true


#Now set the nginx redirect settings to make sure Kibana works correctly
vim /etc/nginx/vhosts.d/kwantu.conf

# define the locations
upstream kibana5601 {
    server 10.155.78.83:5601;
}
upstream elastic9200 {
    server 10.155.78.83:9200;
}

# then specify the proxy settings
        location /elastic {
#                proxy_set_header        ns_server-ui yes;
                proxy_pass        http://elastic9200;
#                include /etc/nginx/proxy_default.conf;
        }

        location /kibana {
#                proxy_set_header        ns_server-ui yes;
                proxy_pass              http://kibana5601;
#                include /etc/nginx/proxy_default.conf;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection 'upgrade';
                proxy_set_header Host $host;
                proxy_cache_bypass $http_upgrade;
        }

service nginx restart




