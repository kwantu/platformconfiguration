[Back to the EPWP page](https://github.com/kwantu/platformconfiguration/wiki/EPWP_Setup)
# Setup of the EPWP Oracle server

## Firewall settings
1. Open port 3306 to the app server (Remember to do the same on the AppServer)

```bash
firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="10.155.78.82" port protocol="tcp" port="3306" accept'
firewall-cmd --reload
```