[back to Installation](https://github.com/kwantu/platformconfiguration/wiki/Installation)

## Install Node

First install the node application

```bash
cd /opt
mkdir betterdata-mobile
cd betterdata-mobile
```
Then install the betterdata app from github
```bash
git clone https://kwantuBuildUser:SOD96BRu1FcN@github.com/kwantu/mobile1.8.git
```
Note if there is a proxy server present, then tell github where to find it.
```bash
#DRDLR
git config --global http.proxy http://10.131.100.135:3128
#DPW
git config --global http.proxy http://10.123.227.33:3128
```
Then install npm<br>
```bash
yum install npm
```
Once again, if there is a proxy then tell npm where to find it.<br>
```bash
#DRDLR
npm config set proxy http://10.131.100.135:3128
#DPW
npm config set proxy http://10.123.227.33:3128
```

## Now we install all the node packages needed in npm
```bash
npm install
npm install -g bower
bower install --allow-root
npm install gulp-imagemin
npm install express
npm install -g gulp

#To install pm2 as global service
npm install -g pm2
npm install node-jpath
npm install json2csv
npm install csvtojson
npm install threads
npm install node-schedule
npm install mysql	
npm install redis
npm install is-empty
npm install stringutils
npm install str-utils
npm install request
```
If you have a problem with bower requiring a proxy server then create the following `.bowerrc` is next to the `bower.json`. And if there is no .bowerrc file near the bower.json file, you can create one by yourself.

```bash
vim /opt/betterdata-mobile/mobile1.8/.bowerrc
```
Insert the following lines
```js
#for EPWP
{
    "proxy":"http://10.123.227.33:3128",
    "https-proxy":"http://10.123.227.33:3128"
}
```

## Prepare to start the application
We need to update the startup script to make sure that it will pull the correct version of the built application. And then start it and monitor the logs to make sure that it starts. 
But before we do that, we need to complete the DB server installation.
```bash
cd /opt/betterdata-mobile/mobile1.8 
sh /opt/betterdata-mobile/mobile1.8/installation/build.sh PROD01
tail -f ~/.pm2/logs/mobile1-8-out-0.log
```
Note that the parameter 'PROD01' should be the correct one for the version of the code that you are running.

DEV - Development build <br>
PROD01 - Production build <br>
EPWPRS - EPWPRS build <br>
DRDLR - DRDLR buiild <br>
...

To stop the application
```bash
pm2 stop all
```
