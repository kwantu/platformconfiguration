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
var PROD01 = {
    "scheduler": true, 
    "encrypt": true,
    "backupReplication": false,
    "exist": "http://41.76.208.248:8888/exist/rest",
    "reportingServer": "http://41.76.208.144:8080/exist/rest",
    "couchDB": {
        "url": "http://localhost:8003",
        "username": "Administrator",
        "password": "aYv16eTzppUp92SY8uMh"
    },
    "elastic": {
        "url": "http://41.76.208.144:9200",
        "username": "elastic",
        "password": "vB9x1TBboq2EIYvTOYwO"
    },
    "publicDomains": {
        "default": "https://kwantu.me"
    },
    "mysql": {
        "url": "41.76.208.248",
        "username": "node",
        "password": "Y1tS9QFlQj@2MF55H1E31",
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

var GOPROD = {
    "scheduler": false, 
    "encrypt": true,
    "backupReplication": false,
    "exist": "http://41.76.208.248:8888/exist/rest",
    "reportingServer": "http://41.76.208.144:8080/exist/rest",
    "couchDB": {
        "url": "http://localhost:8003",
        "username": "Administrator",
        "password": "aYv16eTzppUp92SY8uMh"
    },
    "elastic": {
        "url": "http://41.76.208.144:9200",
        "username": "elastic",
        "password": "vB9x1TBboq2EIYvTOYwO"
    },
    "publicDomains": {
        "default": "https://kwantugo.com"
    },
    "mysql": {
        "url": "41.76.208.248",
        "username": "node",
        "password": "Y1tS9QFlQj@2MF55H1E31",
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
    
    "GOPROD": GOPROD,
    "PROD01": PROD01
};

