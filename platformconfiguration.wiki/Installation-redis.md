[back to installation](https://github.com/kwantu/platformconfiguration/wiki/Installation)

#Redis installation

https://www.linode.com/docs/databases/redis/install-and-configure-redis-on-centos-7/

1. Add the EPEL repository, and update YUM to confirm your change:

```bash
sudo yum install epel-release
sudo yum update
```

2. Install Redis:
```bash
sudo yum install redis
```

3. Start Redis:
```bash
#(on older version of centos)
service redis start 
#(centos 7)
sudo systemctl start redis 
```
4. Optional: To automatically start Redis on boot:
```bash
# (centos 7)
sudo systemctl enable redis
```
5. Verify the Installation
```bash
#Verify that Redis is running with redis-cli:
redis-cli ping

#If Redis is running, it will return:
PONG
```
6. Set redis configuration

```bash
vim /etc/redis.conf
```
```ini

# set the location of the data file
dir /usr/local/data/redis

# Set the behaviour of the persist
appendonly yes
appendfsync everysec

port 6379
loglevel notice  (set to debug for now but back to notice for production)
```
7. Create the data directory

```bash
sudo mkdir /usr/local/data/redis
sudo chown redis:redis /usr/local/data/redis
```


7. Redis security settings
https://redis.io/topics/security <br>
While Redis does not try to implement Access Control, it provides a tiny layer of authentication that is optionally turned on editing the redis.conf file. When the authorization layer is enabled, Redis will refuse any query by unauthenticated clients. A client can authenticate itself by sending the AUTH command followed by the password. The password is set by the system administrator in clear text inside the redis.conf file. It should be long enough to prevent brute force attacks:

For now I have not set a password. It should be set before moving to production.

8. Server Tuning for Redis
To improve Redis performance, set the Linux kernel overcommit memory setting to 1:
```bash
sudo sysctl vm.overcommit_memory=1
```
This immediately changes the overcommit memory setting, but the change will not persist across reboots. To make it 
```bash
permanent, add vm.overcommit_memory = 1 in /etc/sysctl.conf:
```
## Redis clients. 
https://redis.io/clients#nodejs
