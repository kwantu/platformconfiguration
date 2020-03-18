[back to installation](https://github.com/kwantu/platformconfiguration/wiki/Installation)

#Couchdb Cluster Configuration

1. Install couchdb on each server that will form part of the cluster.
2. 

## Verify that the cluster can communicate with each other
```bash
erl -name k9@197.242.158.124 -setcookie 'brumbrum' -kernel inet_dist_listen_min 9100 -kernel inet_dist_listen_max 9100
erl -name k10@197.242.156.57 -setcookie 'brumbrum' -kernel inet_dist_listen_min 9100 -kernel inet_dist_listen_max 9100

net_kernel:connect_node('k9@197.242.158.124').
net_kernel:connect_node('k10@197.242.156.57').



https://www.monitis.com/blog/a-guide-to-couchdb-installation-configuration-and-monitoring/
https://docs.couchdb.org/en/master/setup/cluster.html