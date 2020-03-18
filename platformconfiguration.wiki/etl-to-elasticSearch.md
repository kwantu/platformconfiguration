[back to main ...](https://github.com/kwantu/platformconfiguration/wiki)

# ETL to Elasticsearch configuration

The process is managed by some exist services and MySQL tables. See at the bottom for the MySQL details.

## Service to track global database changes
There is a service managed by the etl_type = "all_dbs" that prioritises the trigger of updates. There is a service in exist-db that runs this process. 

For each type of process to run, there is an etl_type that manages the process. This maps to the etl service in exist-db that knows how to deal with it.

## The services

### 1. "elasticSpInstance" that processes all work flow instance changes to Elastic search
The process creates the following elasticSearch indexes that tracks each workflow instance:
 

### 2. "elasticWorkerObject" that processes all worker object instances changes to Elastic search
The process creates the following elasticSearch indexes that tracks each workflow instance. 

### 3. "elasticRoles" that processes all the user assignment actions to Elastic search
The process creates the following elasticSearch indexes that tracks each workflow instance. 


## The scheduler

There is a cron that drives the process
```bash
#process the global database changes feed
*/5 * * * * /Script/etl/runAllDBprocess.sh > /dev/null 2>&1

#process the individual etl processes
* * * * * /Script/etl/runETLprocess00.sh > /dev/null 2>&1
* * * * * /Script/etl/runETLprocess01.sh > /dev/null 2>&1
* * * * * /Script/etl/runETLprocess02.sh > /dev/null 2>&1
* * * * * /Script/etl/runETLprocess03.sh > /dev/null 2>&1
* * * * * /Script/etl/runETLprocess04.sh > /dev/null 2>&1
* * * * * /Script/etl/runETLprocess05.sh > /dev/null 2>&1
* * * * * /Script/etl/runETLprocess06.sh > /dev/null 2>&1
* * * * * /Script/etl/runETLprocess07.sh > /dev/null 2>&1
* * * * * /Script/etl/runETLprocess08.sh > /dev/null 2>&1
* * * * * /Script/etl/runETLprocess09.sh > /dev/null 2>&1
```

This execute the script in the /Script/etl folder with the following content
```bash

```

## Setup the mysql tables to manage the process

```sql

CREATE TABLE `etl_types` (
  `etl_type` varchar(20) NOT NULL,
  `elt_type_function` varchar(20) DEFAULT NULL,
  `is_active` char(1) DEFAULT 'T',
  PRIMARY KEY (`etl_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `etl_appcodes` (
  `uuid` varchar(50) NOT NULL,
  `appCode` varchar(20) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `etl_control` (
  `etl_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `communityId` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `bookmark` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recordsRetured` int(11) DEFAULT NULL,
  `totalRecords` int(11) DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'notStarted',
  `lastRun` datetime DEFAULT NULL,
  `result` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pending` int(11) DEFAULT NULL,
  `processedTo` bigint(20) DEFAULT '0',
  `serverSince` bigint(20) DEFAULT '0',
  `serverBookmark` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`etl_type`,`communityId`),
  KEY `lastRun` (`lastRun`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `etl_log` (
  `etl_key` bigint(20) NOT NULL AUTO_INCREMENT,
  `etl_type` varchar(20) DEFAULT NULL,
  `communityId` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `processIdRequested` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `processIdResult` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `validDate` date DEFAULT NULL,
  `dateTimeCreated` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `profileId` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `spStatus` varchar(20) DEFAULT NULL,
  `currentStep` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `insertError` char(5) DEFAULT NULL,
  PRIMARY KEY (`etl_key`),
  KEY `eltType_prcessType` (`etl_type`,`type`,`etl_key`),
  KEY `insertError` (`insertError`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO `etl_types` (`etl_type`, `elt_type_function`, `is_active`) VALUES('elasticSpInstance','elasticSpInstance','T');
INSERT INTO `etl_types` (`etl_type`, `elt_type_function`, `is_active`) VALUES('elasticWorkerObject','elasticWorkerObject','T');

INSERT INTO `etl_control` (`etl_type`,`communityId`,`serverSince`,`serverBookmark`)
SELECT etl_type,`communityId`,0,"" FROM `etl_types` JOIN community WHERE `accessType` = '1';
`etl_appcodes`;

INSERT INTO `etl_control` (`etl_type`,`communityId`) VALUES ('all_dbs','all_dbs');