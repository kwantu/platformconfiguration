[Back to the EPWP page](https://github.com/kwantu/platformconfiguration/wiki/EPWP_Setup)
# Setup of the EPWP AppServer

## Checking that the firewall is up
```bash
service firewalld start

firewall-cmd --state
firewall-cmd --reload
```


## Firewall settings
1. Open port 3306 to the Oracle server (Remember to do the same on the AppServer)

```bash
firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="10.155.78.99" port protocol="tcp" port="3306" accept'
firewall-cmd --reload
```