[back](https://github.com/kwantu/platformconfiguration/wiki)
# Builds
The builds log is stored in a google sheet that can be found [here](https://docs.google.com/spreadsheets/d/1Lfj2OvJGmRuJYlc24lY1OhmxVQzQ5_o6QCp_lZKlHQ4/edit?usp=sharing).

### Build 3.0.45

1. New UI for performance indicators.
2. Details page changes for performance application.
3. Fix for SDO opening on screen unlock.
4. Changes to make screen lock configurable.
5. Default screen inactivity timeout increased to 30 mins.
6. Performance tree editor introduced.
7. Color scheme and level definition changes in performance app.
8. Auto outline added in performance application.
9. Performance improvement and minor bug fixes.


### Build 3.0.44

1. Performance Audit lock fix.
2. Dashboard fixes.

### Build 3.0.43

1. Performance Audit creation fix.

### Build 3.0.42

1. Offline notification worker fixed.

### Build 3.0.41

1. Dashboards

### Build 3.0.40

SKIPPED

### Build 3.0.39

SKIPPED

### Build 3.0.38

1. Local file sync issues fixed.
2. Rollback logging fixed.


### Build 3.0.37

1. Out of sync issues fixed.
2. Minor UI fixes.
3. _uuid issue for repeats.


### Build 3.0.36

SKIPPED

### Build 3.0.35

1. Out of sync issues fixed.
2. Minor UI fixes.

### Build 3.0.34

1. Performance application fix for _uuid issue.
2. Minor UI fixes.

### Build 3.0.33

1. EPWP service fix.
2. Only if condition fix.

### Build 3.0.32

1. Titles alignment across UI.
2. Icons messages aligned.
3. Repeat form validation fixes.
4. Community level external pages support.
5. Support for multiple external pages at one level. (for all community/profile/subprofile/application)
6. Notifications alignment.
7. Minor fixes.

Rollout: 
1. Node build.
2. Performance app config release as needed.


### Build 3.0.31

1. Unique validation issue fixed.
2. Icons messages aligned.
3. New instance title issue fixed.
4. Notification mark all read functionality added.

Rollout: 
1. Node build
2. Electron rollout.


### Build 3.0.30

1. Link SDO service fix to deal with double entry.
2. Icons messages updated.

Rollout: 
1. Node build



### Build 3.0.29

1. Verify password Modal dialog fix.
2. Force password change dialog fixed.
3. Build download link fixed for electron applications.

Rollout: 
1. Node build
2. Electron rollout.



### Build 3.0.28

1. Force PW change fix.
2. Icons to indicate sync status.
3. Performance app half yearly support.
4. Performance app audit on separate frequency.

Rollout: 
1. Node build
2. For Performance plan folders add the following in the {profile}:variables: "audit":"monthly/quarterly/halfYearly/yearly




### Builds up to 3.0.23
1. eXist build.
2. Please run following attached (tables.sql) sql statements on all mysql servers.
3. inside   /opt/couchdb/etc/local.ini under section
```ini
[httpd]
;add line below
changes_timeout = 300000
```
4. restart CouchDB
5. Clear Redis data
```bash
redis-cli
127.0.0.1:6379> flushall
OK
127.0.0.1:6379>
```
6. Clear kwantu_transactions bucket. Open the database in fauxton, delete and recreate the kwantu_transactions bucket.
7. Migrate System_Settings in the configs bucket
8. Do config builds (EPWP and others as needed)7. Node build
9. Run script https://{servername}/exist/rest/db/kwantu-resource/api/build-script-23.xq
10. Do node build

### Release 3.0.0
1. Build steps
1. GitHub branch
1. BuildCode
1. Redis installation
1. Lucene installation
1. MySQL Schema build
1. Redis configured
1. Make sure Lucene configured properly
1. eXist build for /db/kwantu-resource folder
1. mod-server file merge
1. Mysql buildAccess = 0 in user_ table
1. Verify that all couchdb installations are on v2.3.1
1. create kwantu_geo bucket
1. create kwantu_transactions bucket
1. run createIndex for all communities
1. Configure server.js in github production01
1. Update System_Settings document to kwantu_configs bucket
1. cd /opt/betterdata-mobile/mobile1.8
1. npm install redis
1. npm install request
1. Now do Node build using build code
1. Do config build for communities
1. SET port and network performance parameters on all servers
1. Release cordova apps
1. Update release lisk in mysql