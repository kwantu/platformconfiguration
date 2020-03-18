[back to installation](https://github.com/kwantu/platformconfiguration/wiki/Installation)

# Configure iptables on the Application server

```bash
# Ansible managed: ( not {time,uid,host}stamped to avoid needless restart triggering )
# Manual customization of this file is not recommended.
*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT DROP [0:0]
:LOGDROP - [0:0]

# for mosh
-I INPUT -p udp -m udp --dport 60000:61000 -j ACCEPT

# allow certain ICMP types in
-A INPUT -p icmp -m icmp --icmp-type 0 -j ACCEPT
-A INPUT -p icmp -m icmp --icmp-type 3 -j ACCEPT
-A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT
-A INPUT -p icmp -m icmp --icmp-type 11 -j ACCEPT

# allow all on loopback
-A INPUT -i lo -j ACCEPT

# allow all inbound for RELATED and ESTABLISHED connections
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# allow inbound SSH
-A INPUT -p tcp -m tcp --dport 22 -m state --state NEW -j ACCEPT

# allow inbound http
-A INPUT -p tcp -m tcp --dport 80 -m state --state NEW -j ACCEPT

# allow inbound exist-db (only till everything is working)
-A INPUT -p tcp -m tcp --dport 8080 -m state --state NEW -j ACCEPT


# allow all on loopback
-A FORWARD -i lo -j ACCEPT
-A FORWARD -o lo -j ACCEPT
-A OUTPUT -o lo -j ACCEPT

# allow certain ICMP types out
-A OUTPUT -p icmp -m icmp --icmp-type 0 -j ACCEPT
-A OUTPUT -p icmp -m icmp --icmp-type 3 -j ACCEPT
-A OUTPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT
-A OUTPUT -p icmp -m icmp --icmp-type 11 -j ACCEPT

# allow outbound NTP
```
## For RedHad using firewalld
```bash
# for mosh
firewall-cmd --permanent --add-service=mosh 

# allow certain ICMP types in/ out
firewall-cmd --permanent --add-icmp-block={echo-request,echo-reply,destination-unreachable,time-exceeded}
firewall-cmd --permanent --add-icmp-block-inversion

# allow all on loopback
firewall-cmd --permanent --add-interface=lo

# allow inbound/outbound SSH
firewall-cmd --permanent --add-service=ssh

# allow inbound/outbound web
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --permanent --add-port=443/tcp

# allow inbound monitoring checks
firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="213.138.111.110" port protocol="tcp" port="5666" accept'
firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="213.138.111.110" port protocol="tcp" port="4949" accept'

# couchdb - these should later be removed
firewall-cmd --permanent --add-port=6984/tcp
firewall-cmd --permanent --add-port=8003/tcp
firewall-cmd --permanent --add-port=8080/tcp

# allow NTP
firewall-cmd --permanent --add-port=123/tcp
firewall-cmd --permanent --add-port=123/udp

# allow outbound DNS
firewall-cmd --permanent --add-port=53/tcp
firewall-cmd --permanent --add-port=53/tcp

#allow mail
firewall-cmd --permanent --add-port=25/tcp
firewall-cmd --permanent --add-port=110/tcp
firewall-cmd --permanent --add-port=143/tcp
firewall-cmd --permanent --add-port=465/tcp
firewall-cmd --permanent --add-port=587/tcp
firewall-cmd --permanent --add-port=993/tcp
firewall-cmd --permanent --add-port=995/tcp

#allow ftp
firewall-cmd --permanent --add-port=21/tcp
firewall-cmd --permanent --add-port=1024/tcp

```