[back to installation ...](https://github.com/kwantu/platformconfiguration/wiki/Installation)<br>

# Items to consider

### eXist build.
### mod-server.xqm merge.
### Running "createIndex.xq" service for any additional indexes added so far.
### Running build script to push latest node.js code.

In point 4, please monitor "pm2 logs" for server startup.... as moving with different things some of the new node packages were added... so on starting it might complaint for "missing package"... if so the do following..

```bash
pm2 stop all
cd /opt/betterdata-mobile/mobile1.8
npm install <MISSING PACKAGE>
pm2 flush
```
then run build script again... it might complain for any other package if missing... otherwise it will start smooth...<br>

**On adding new server details**<br>
We need to add these settings in init.js and server.js... and also we need to rectify the mod-server.xqm on corresponding server for different URLs.
(Note we need to document how to do this in github)