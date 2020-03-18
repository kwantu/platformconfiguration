
## Here is a general tutorial
https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-centos-7 <br>
https://certbot.eff.org/lets-encrypt/centosrhel7-nginx <br>

## This resolves a specific problem that we had on Couchp03 to run certbot
https://github.com/certbot/certbot/issues/3944

```bash
yum remove python-requests python-urllib3
pip uninstall requests urllib3
pip install requests==2.11.1 urllib3
yum install certbot
yum install python2-certbot-nginx
certbot --nginx -d epwprs.co.za -d www.epwprs.co.za
```


```
IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/epwprs.co.za/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/epwprs.co.za/privkey.pem
   Your cert will expire on 2019-05-17. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot again
   with the "certonly" option. To non-interactively renew *all* of
   your certificates, run "certbot renew"
 - Your account credentials have been saved in your Certbot
   configuration directory at /etc/letsencrypt. You should make a
   secure backup of this folder now. This configuration directory will
   also contain certificates and private keys obtained by Certbot so
   making regular backups of this folder is ideal.
```