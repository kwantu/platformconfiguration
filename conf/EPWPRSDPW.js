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


var EPWPRSDPW = {
    "scheduler": true, 
    "encrypt": true,
    "backupReplication": false,
    "exist": "http://localhost:8080/exist/rest",
    "reportingServer": "http://localhost:8080/exist/rest",
    "couchDB": {
        "url": "http://10.155.78.84:8003",
        "username": "Administrator",
        "password": "Ca1268vMQlo0"
    },
    "elastic": {
        "url": "http://10.155.78.83:9200",
        "username": "elastic",
        "password": "uXQ1D@xTV5XG"
    },
    "publicDomains": {
        "default": "https://epwprs.dpw.gov.za"
    },
    "mysql": {
        "url": "localhost",
        "username": "root",
        "password": "MySQLConfDB@989",
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
        "URL":"https://ws.hyphen.co.za/webservice/avs/avsRequest"
    }
};


module.exports = {
   
    "EPWPRSDPW": EPWPRSDPW
};

