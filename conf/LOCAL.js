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

var LOCAL = {
    "scheduler": false,
    "encrypt": true,
    "backupReplication": false,
    "exist": "https://staging.kwantu.net/exist/rest",
    "reportingServer": "https://staging.kwantu.net/exist/rest",
    "couchDB": {
        "url": "https://staging.kwantu.net",
        "username": "Administrator",
        "password": "En7BS0Sb9CjOwcKBHkpw"
    },
    "elastic": {
        "url": "http://127.0.0.1:9200",
        "username": "elastic",
        "password": "EUBpIM6kCXOSp66V9ozL"
    },
    "publicDomains": {
        "default": "https://staging.kwantu.net"
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
    "basepath": "/Users/satinders/Development/mobile1.8/",
    "bankVerification":{
        "AccessKey": "A76140OQ70",
        "SecretKey": "qTjyZmVVP9xvKneR",
        "URL":"https://qaws.hyphen.co.za/webservice/avs/avsRequest"
    }
};



module.exports = {
    "LOCAL": LOCAL
};

