[back](https://github.com/kwantu/platformconfiguration/wiki/Installation)

## Install (If not already done)

1. We will use the yum installer, but we need to configure the repository first.

```bash
sudo vim /etc/yum.repos.d/mysql-community.repo
```

2. Add the following lines into that file:

```bash
# Enable to use MySQL 5.6
[mysql56-community]
name=MySQL 5.6 Community Server
baseurl=http://repo.mysql.com/yum/mysql-5.6-community/el/6/$basearch/
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-mysql
```
Note that this  sometimes fails, in which case change gpgcheck=0

3. Then run the install

```bash
sudo yum install mysql-community-server
```
4. Start the mysql service daemon

```bash
sudo service mysqld start
```

5. Test that the service is running

```bash
sudo service mysqld status
```
## Now secure the installation

_**Note that the port 3306 should not be opened to the world.**_ <br>

1. Run the initial mysql script to secure the installation.

```bash
sudo mysql_secure_installation

NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MySQL
      SERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP CAREFULLY!

In order to log into MySQL to secure it, we'll need the current
password for the root user.  If you've just installed MySQL, and
you haven't set the root password yet, the password will be blank,
so you should just press enter here.

Enter current password for root (enter for none):
OK, successfully used password, moving on...

Setting the root password ensures that nobody can log into the MySQL
root user without the proper authorisation.

Set root password? [Y/n] Y
New password:
Re-enter new password:
Password updated successfully!
Reloading privilege tables..
 ... Success!


By default, a MySQL installation has an anonymous user, allowing anyone
to log into MySQL without having to have a user account created for
them.  This is intended only for testing, and to make the installation
go a bit smoother.  You should remove them before moving into a
production environment.

Remove anonymous users? [Y/n] Y
 ... Success!

Normally, root should only be allowed to connect from 'localhost'.  This
ensures that someone cannot guess at the root password from the network.

Disallow root login remotely? [Y/n] Y
 ... Success!

By default, MySQL comes with a database named 'test' that anyone can
access.  This is also intended only for testing, and should be removed
before moving into a production environment.

Remove test database and access to it? [Y/n] Y
 - Dropping test database...
ERROR 1008 (HY000) at line 1: Can't drop database 'test'; database doesn't exist
 ... Failed!  Not critical, keep moving...
 - Removing privileges on test database...
 ... Success!

Reloading the privilege tables will ensure that all changes made so far
will take effect immediately.

Reload privilege tables now? [Y/n] Y
 ... Success!

All done!  If you've completed all of the above steps, your MySQL
installation should now be secure.

Thanks for using MySQL!
Cleaning up...
```

2. Set the root password for easy access as root user edit the .my.cnf file in the root user.
```bash
sudo vim /root/.my.cnf
```
3. Insert the following lines:
```sql
[client]
user=root
password=somepassword
```

## Set the configuration details
The settings for the MySQL database is kept in the `/etc/my.cnf` file. <br>

1. Firstly, you will need to set the permissions on the file to something that is write-able, and then edit it with a text editor. We use `vim`.
```bash
sudo chmod 777 /etc/my.cnf
sudo vim /etc/my.cnf
```
2. Now update the details as follows: <br>

```ini

[mysqld]
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
user=mysql
bind-address = 127.0.0.1


# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0
character-set-server = utf8

default-storage_engine = innodb
lower_case_table_names = 1
thread_concurrency = 16
max_connections=1000

[mysqld_safe]
log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid

[mysqldump]
max_allowed_packet = 500M
```
<br>

3. Set the file permissions back to read only and restart the database deamon
```bash
sudo chmod 400 /etc/my.cnf
sudo service mysqld restart
```

## Create the users management database and load the initial information

1. First create the mysql database `mobile1_8`. Make sure that the default character set is utf8, and utf8_general_ci
```sql
CREATE DATABASE `mobile1_8` /*!40100 DEFAULT CHARACTER SET utf8 */
```
2. Then run the database creation script to create the database and tables.<br>
[mysql_Installation_script.sql](https://github.com/kwantu/platformconfiguration/blob/master/mysql_Installation_script.sql)<br>

3. Then load run the database creation script, with the intial system administrator user.<br>
[mysql_Installation_script_insertRecords.sql](https://github.com/kwantu/platformconfiguration/blob/master/mysql_Installation_script_insertRecords.sql)<br>

### If you need to migrate communities and users
Use the following template queries and replace the communityId with the relevant data, and create insert scripts with the results. Run this against the source database where the data must be migrated from.

```sql
--- Migrate community records
SELECT * FROM `mobile1_8`.`community` WHERE communityId IN 
                      ( 'b9341c47-ce52-4c62-8701-d5a0c7f2ecd4',
			'c2923ded-7e31-4f22-9991-f04d08285669',
			'be1b7e46-aecd-4295-a4f3-c69efb25510b');

--- migrate user records. Their existing passwords will be maintained
SELECT * FROM `mobile1_8`.`user_` WHERE userId IN 
(SELECT userId FROM `mobile1_8`.`user_roles_map` 
 WHERE communityId IN ( 'b9341c47-ce52-4c62-8701-d5a0c7f2ecd4',
			'c2923ded-7e31-4f22-9991-f04d08285669',
			'be1b7e46-aecd-4295-a4f3-c69efb25510b'));

--- migrate user roles on the communities.
SELECT * FROM `mobile1_8`.`user_roles_map` WHERE communityId IN ( 'b9341c47-ce52-4c62-8701-d5a0c7f2ecd4',
			'c2923ded-7e31-4f22-9991-f04d08285669',
			'be1b7e46-aecd-4295-a4f3-c69efb25510b');
```

