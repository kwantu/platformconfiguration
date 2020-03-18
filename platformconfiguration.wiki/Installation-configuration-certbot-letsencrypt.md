[back to installation](https://github.com/kwantu/platformconfiguration/wiki/Installation)

# Installation of letsEncrypt.
Note that this could be done using certbot, or the scripts provided below.

[See the Certbot documentation here](https://certbot.eff.org/lets-encrypt/centosrhel7-nginx)


## Steps to implement the certificate.

1. Create the directory in nginx that will host the ssl details
```bash
sudo mkdir /etc/nginx/ssl/
sudo chmod 2750 /etc/nginx/ssl/
```
2. Clone letsencrypt.sh repo
```bash
mkdir /root/work
cd /root/work
git clone https://github.com/lukas2511/letsencrypt.sh.git
```
3. Install letsencrypt.sh script
```bash
cp /root/work/letsencrypt.sh/dehydrated /usr/local/bin/letsencrypt.sh 
chown root:root /usr/local/bin/letsencrypt.sh 
chmod 0750 /usr/local/bin/letsencrypt.sh
```
4. Install letsencrypt.sh update script
  template: src=${inventory_dir}/roles/apache2/templates/update_letsencrypt.sh.j2 dest=/usr/local/bin/update_letsencrypt.sh
            owner=root group=root mode=0750

```bash
#!/bin/bash
#
# script to update letsencrypt.sh
# and optionally show diffs
# and optionally renew certs
# by running 'create_crt_for_www.example.com.sh renew',
# checking the logs and restarting apache if successful

# example successful output in log from running 'create_crt_for_www.example.com.sh renew':

## INFO: Using main config file letsencrypt_config.sh
#+ Generating account key...
#+ Registering account key with letsencrypt...
# + Requesting challenge for www.example.com...
# + Responding to challenge for www.example.com...
# + Challenge is valid!
# + Requesting certificate...
# + Checking certificate...
# + Done!

me="$( basename $0 )"

die () {
  echo -e "\n${1}, exitting...\n" >&2
  exit 1
}

usage () {
  echo -e "\nusage: $me [--diff|--update|--renew <FQDN>]\n"
  exit
}

ssldir='/etc/nginx/ssl'
script='letsencrypt.sh'
srcdir='/root/work/letsencrypt.sh'
dstdir='/usr/local/bin'
#src="${srcdir}/${script}" # the name had to change, see note on 'https://github.com/lukas2511/dehydrated'
src="${srcdir}/dehydrated"
dst="${dstdir}/${script}"
log="${ssldir}/letsencrypt_lastrun_stderr.log"

update_repo () {
  cd $srcdir && git pull &>/dev/null || die "failed to update repo"
  cd - &>/dev/null
}

update_script () {
  diff -q $dst $src || { cat $src > $dst ; echo "'${dst}' updated!" ; } | logger -t $me
}

renew () {
  [ $1 ] && cert_script="${ssldir}/create_crt_for_${1}.sh" || usage
  [ -r $cert_script ] || die "script '${cert_script}' is not readable"
  [ -x $cert_script ] || die "script '${cert_script}' is not executable"
  /usr/lib64/nagios/plugins/check_http -4 -H $1 -S -f follow -e 200,301,302,303,401,403 --sni \
    || die "failed to check cert for '${1}'"
  /usr/lib64/nagios/plugins/check_http -4 -H $1 -S -C 7 --sni \
    && echo "cert for '${1}' is still valid!" | logger -t $me \
    && exit
  # set path for use in cron, so letsencrypt.sh is found by the cert script
  PATH=/usr/local/bin:$PATH $cert_script renew
  # move log to a domain named log, incase there are multiple certs
  lastlog="${log}" ; log="${ssldir}/letsencrypt_lastrun_stderr_${1}.log"
  mv $lastlog $log
  grep -q 'Done!' ${log} \
    && /sbin/service nginx reload \
    && echo "cert for '${1}' renewed!" | logger -t $me \
    || die "failed to renew cert for '${1}'\n\n$( cat $log )\n"
}

[ $1 ] || usage
while [ $# -gt 0 ]
do
  case $1 in
    -d|--diff)          update_repo && diff -u $dst $src ;      shift ;;
    -u|--update)        update_repo && update_script ;          shift ;;
    -r|--renew)         renew $2 ;                              shift 2 ;;
    *)                  usage ;;
  esac
done

```
5. Install letsencrypt.sh config

```bash
vim /etc/nginx/ssl/letsencrypt_config.sh
```
and insert the following details
```bash
WELLKNOWN="/var/www/letsencrypt"
# for testing
#CA="https://acme-staging.api.letsencrypt.org/directory"
```
6. Install letsencryptaintermediate CA cert
```bash
vim /etc/nginx/ssl/lets-encrypt-x3-cross-signed.pem
```
Then insert the certificate
```bash
-----BEGIN CERTIFICATE-----
MIIEkjCCA3qgAwIBAgIQCgFBQgAAAVOFc2oLheynCDANBgkqhkiG9w0BAQsFADA/
MSQwIgYDVQQKExtEaWdpdGFsIFNpZ25hdHVyZSBUcnVzdCBDby4xFzAVBgNVBAMT
DkRTVCBSb290IENBIFgzMB4XDTE2MDMxNzE2NDA0NloXDTIxMDMxNzE2NDA0Nlow
SjELMAkGA1UEBhMCVVMxFjAUBgNVBAoTDUxldCdzIEVuY3J5cHQxIzAhBgNVBAMT
GkxldCdzIEVuY3J5cHQgQXV0aG9yaXR5IFgzMIIBIjANBgkqhkiG9w0BAQEFAAOC
AQ8AMIIBCgKCAQEAnNMM8FrlLke3cl03g7NoYzDq1zUmGSXhvb418XCSL7e4S0EF
q6meNQhY7LEqxGiHC6PjdeTm86dicbp5gWAf15Gan/PQeGdxyGkOlZHP/uaZ6WA8
SMx+yk13EiSdRxta67nsHjcAHJyse6cF6s5K671B5TaYucv9bTyWaN8jKkKQDIZ0
Z8h/pZq4UmEUEz9l6YKHy9v6Dlb2honzhT+Xhq+w3Brvaw2VFn3EK6BlspkENnWA
a6xK8xuQSXgvopZPKiAlKQTGdMDQMc2PMTiVFrqoM7hD8bEfwzB/onkxEz0tNvjj
/PIzark5McWvxI0NHWQWM6r6hCm21AvA2H3DkwIDAQABo4IBfTCCAXkwEgYDVR0T
AQH/BAgwBgEB/wIBADAOBgNVHQ8BAf8EBAMCAYYwfwYIKwYBBQUHAQEEczBxMDIG
CCsGAQUFBzABhiZodHRwOi8vaXNyZy50cnVzdGlkLm9jc3AuaWRlbnRydXN0LmNv
bTA7BggrBgEFBQcwAoYvaHR0cDovL2FwcHMuaWRlbnRydXN0LmNvbS9yb290cy9k
c3Ryb290Y2F4My5wN2MwHwYDVR0jBBgwFoAUxKexpHsscfrb4UuQdf/EFWCFiRAw
VAYDVR0gBE0wSzAIBgZngQwBAgEwPwYLKwYBBAGC3xMBAQEwMDAuBggrBgEFBQcC
ARYiaHR0cDovL2Nwcy5yb290LXgxLmxldHNlbmNyeXB0Lm9yZzA8BgNVHR8ENTAz
MDGgL6AthitodHRwOi8vY3JsLmlkZW50cnVzdC5jb20vRFNUUk9PVENBWDNDUkwu
Y3JsMB0GA1UdDgQWBBSoSmpjBH3duubRObemRWXv86jsoTANBgkqhkiG9w0BAQsF
AAOCAQEA3TPXEfNjWDjdGBX7CVW+dla5cEilaUcne8IkCJLxWh9KEik3JHRRHGJo
uM2VcGfl96S8TihRzZvoroed6ti6WqEBmtzw3Wodatg+VyOeph4EYpr/1wXKtx8/
wApIvJSwtmVi4MFU5aMqrSDE6ea73Mj2tcMyo5jMd6jmeWUHK8so/joWUoHOUgwu
X4Po1QYz+3dszkDqMp4fklxBwXRsW10KXzPMTZ+sOPAveyxindmjkW8lGy+QsRlG
PfZ+G6Z6h7mjem0Y+iWlkYcV4PIWL1iwBi8saCbGS5jN2p8M+X+Q7UNKEkROb3N6
KOqkqm57TH2H3eDJAkSnh6/DNFu0Qg==
-----END CERTIFICATE-----
```
Then set its permissiions
```bash
chmod 0640 /etc/nginx/ssl/lets-encrypt-x3-cross-signed.pem
```
7. Create '/var/www/letsencrypt' dir
```bash
mkdir /var/www/letsencrypt
chmod 0755 /var/www/letsencrypt
```

8. If there is a proxy server present, then tell letsencrypt where to find it.
```bash
#for DPW the following applies
export http_proxy=http://10.123.227.33:3128
export https_proxy=http://10.123.227.33:3128
export HTTP_PROXY=http://10.123.227.33:3128
export HTTPS_PROXY=http://10.123.227.33:3128
``` 
9. Run the update script (except if you are behind a reverse proxy where it will be more difficult)
20 2 * * * /usr/local/bin/lockrun.sh -m 60 -- /usr/local/bin/update_letsencrypt.sh --update --renew kwantu.me >/dev/null

### Run certbot if there are virtual hosts and reverse proxies.

Note that if there are virtual hosts and reverse proxies, then the normal certbot process will not work, and the webroot method should be followed.
https://community.letsencrypt.org/t/how-to-nginx-configuration-to-enable-acme-challenge-support-on-all-http-virtual-hosts/5622
For that method, the nginx configuration must be sligthly different:
```bash
location ^~ /.well-known/acme-challenge/ {

    # Set correct content type. According to this:
    # https://community.letsencrypt.org/t/using-the-webroot-domain-verification-method/1445/29
    # Current specification requires "text/plain" or no content header at all.
    # It seems that "text/plain" is a safe option.
    default_type "text/plain";

    # This directory must be the same as in /etc/letsencrypt/cli.ini
    # as "webroot-path" parameter. Also don't forget to set "authenticator" parameter
    # there to "webroot".
    # Do NOT use alias, use root! Target directory is located here:
    # /var/www/common/letsencrypt/.well-known/acme-challenge/
    root         /var/www/letsencrypt;
}
```
Run the certbot utility, but remove the --test-cert once all is working.
```bash
certbot run -a webroot -i nginx -w /var/www/letsencrypt -d epwprs.dpw.gov.za --test-cert
```

