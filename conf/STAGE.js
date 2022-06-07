// server.js
// ======== 

'use strict';


var EPWPRS_LOGO="MPlogo.png";
var DRDLRPROD_LOGO="DRDLRlogo.png";
var DRDLRTRAIN_LOGO="DRDLRlogo.png";
var EPWPRSDPW_LOGO="EPWPlogo.png";
var EPWPRS_LOGO="EPWPTraininglogo.png";
// var TBI_LOGO="Logo.png"
// note these are all the settings managing how node
// connecs to the local servers and databases
// the couchdb connection should be the most efficient local connection
var STAGE = {
    "scheduler": true, 
    "encrypt": true,
    "backupReplication": true,
    "exist": "http://localhost:8888/exist/rest",
    "reportingServer": "http://localhost:8888/exist/rest",
    "couchDB": {
        "url": "http://41.76.210.91:8003",
        "username": "Administrator",
        "password": "En7BS0Sb9CjOwcKBHkpw"
    },
    "elastic": {
        "url": "http://127.0.0.1:9200",
        "username": "elastic",
        "password": "vOSOf39Fs7ZkccNLUTom"
    },
    "publicDomains": {
        "default": "https://staging.kwantu.net",
"alternate": "https://go.kwantu.net"
    },
    "mysql": {
        "url": "localhost",
        "username": "root",
        "password": "s0meP@ssword123",
        "database": "mobile1_8",
        "connectionLimit": 50
    },
    "redis":{
        "url":"localhost",
        "port":"6379"
    },
    "basepath": "/opt/betterdata-mobile/mobile1.8/",
    "bankVerification":{
        "AccessKey": "A76140OQ70",
        "SecretKey": "qTjyZmVVP9xvKneR",
        "URL":"https://qaws.hyphen.co.za/webservice/avs/avsRequest"
    }
};

var GOSTAGE = {
    "scheduler": false, 
    "encrypt": false,
    "backupReplication": false,
    "exist": "http://localhost:8888/exist/rest",
    "reportingServer": "http://localhost:8888/exist/rest",
    "couchDB": {
        "url": "http://41.76.210.91:8003",
        "username": "Administrator",
        "password": "En7BS0Sb9CjOwcKBHkpw"
    },
    "elastic": {
        "url": "http://127.0.0.1:9200",
        "username": "elastic",
        "password": "vOSOf39Fs7ZkccNLUTom"
    },
    "publicDomains": {
        "default": "https://go.kwantu.net"
    },
    "mysql": {
        "url": "localhost",
        "username": "root",
        "password": "s0meP@ssword123",
        "database": "mobile1_8",
        "connectionLimit": 50
    },
    "redis":{
        "url":"localhost",
        "port":"6379"
    },
    "basepath": "/opt/betterdata-mobile/mobile1.8/",
    "bankVerification":{
        "AccessKey": "A76140OQ70",
        "SecretKey": "qTjyZmVVP9xvKneR",
        "URL":"https://qaws.hyphen.co.za/webservice/avs/avsRequest"
    }
};


module.exports = {
   
    "GOSTAGE": GOSTAGE,
    "STAGE": STAGE
};

