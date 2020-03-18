[back to install](https://github.com/kwantu/platformconfiguration/wiki/Installation)

## Install the nginx application.
Use the normal package manager to install nginx
```
yum install nginx
```

## Set the default config file
Then use the following config file as a basis for the installation.
1. Firstly create a new folder `/etc/nginx/vhosts.d`. Nginx will read this folder for any `.conf` files and include them.
2. Place the following config file in `/etc/nginx/vhosts.d` It does not matter which name it is given, as long as it ends with `.conf` . We will use kwantu.conf by default for now. <br>

```bash
upstream mobile {
    server 127.0.0.1:5002;
}
upstream exist8080 {
    server 127.0.0.1:8080;
}
upstream couchdb8003 {
    server 197.242.156.122:8003;
}
upstream lucene5985 {
    server 197.242.156.122:5985;
}

server {

        listen 80;
        server_name couchp03.kwantu.net www.kwantu.org *.kwantu.org kwantu.org;

        # This call blocks all non ssl access to this server.
        return 301  https://$host$request_uri;

        access_log  /var/log/nginx/access_80.log;
        error_log  /var/log/nginx/error_80.log;

        client_max_body_size 20M;

        ignore_invalid_headers off;

  # for LetsEncrypt auth
  location ^~ /.well-known/acme-challenge {
    alias /var/www/letsencrypt;
    allow all;
  }

        location / {
                proxy_pass        http://mobile;
                proxy_set_header        ns_server-ui yes;
                include /etc/nginx/proxy_default.conf;
	}




}

server {
        listen 443;
        server_name kwantu.org *.kwantu.org;

        access_log  /var/log/nginx/access.log;
        error_log  /var/log/nginx/error.log;

        client_max_body_size 20M;

        ignore_invalid_headers off;


  # for LetsEncrypt auth
  location ^~ /.well-known/acme-challenge {
    alias /var/www/letsencrypt;
    allow all;
  }

  ssl on;
  ssl_certificate /etc/nginx/ssl/kwantu.org.pem;
  ssl_certificate_key /etc/nginx/ssl/kwantu.org.key;
  ssl_session_cache   shared:SSL:10m;
  ssl_session_timeout 10m;
  ssl_protocols TLSv1;

        # any call coming in with the /exist first part redirect it to the exist server
        location /exist {
                proxy_pass              http://exist8080/exist;
                include /etc/nginx/proxy_default.conf;
        }
        # any call coming in with the /local first part redirect it to the lucene server
        location /local {
                proxy_pass              http://lucene5985;
                include /etc/nginx/proxy_default.conf;
        }

        location /kwantu_ {
                proxy_set_header        ns_server-ui yes;
                proxy_pass        http://couchdb8003;
                include /etc/nginx/proxy_default.conf;
        }

        location /lucene {
                proxy_set_header        ns_server-ui yes;
                proxy_pass              http://lucene5985;
                include /etc/nginx/proxy_default.conf;
        }

        location /_utils {
                proxy_set_header        ns_server-ui yes;
                proxy_pass        http://couchdb8003;
                include /etc/nginx/proxy_default.conf;
        }

        location /_session{
                proxy_set_header        ns_server-ui yes;
                proxy_pass        http://couchdb8003;
                include /etc/nginx/proxy_default.conf;
        }

        location /_all_dbs{
                proxy_set_header        ns_server-ui yes;
                proxy_pass        http://couchdb8003;
                include /etc/nginx/proxy_default.conf;
        }

        location /_find{
                proxy_set_header        ns_server-ui yes;
                proxy_pass        http://couchdb8003;
                include /etc/nginx/proxy_default.conf;
        }

        location / {
                proxy_pass        http://mobile;
                proxy_set_header        ns_server-ui yes;
                include /etc/nginx/proxy_default.conf;
        }


}


server {
        listen 9443;
        server_name  couchp03.kwantu.net www.kwantu.org *.kwantu.org kwantu.org epwprs.co.za *.epwprs.co.za;

        access_log  /var/log/nginx/access_9443.log;
        error_log  /var/log/nginx/error_9443.log;

        client_max_body_size 20M;

        ignore_invalid_headers off;
        #proxy_redirect http://$proxy_host/8091 http://localhost:8091;

  # for LetsEncrypt auth
  location ^~ /.well-known/acme-challenge {
    alias /var/www/letsencrypt;
    allow all;
  }

  ssl on;
  ssl_certificate /etc/nginx/ssl/kwantu.org.pem;
  ssl_certificate_key /etc/nginx/ssl/kwantu.org.key;
  ssl_session_cache   shared:SSL:10m;
  ssl_session_timeout 10m;
  ssl_protocols TLSv1;


        location / {
                proxy_pass        http://couchdb8003;
                proxy_set_header        ns_server-ui yes;
                include /etc/nginx/proxy_default.conf;
	}
}

## Prepare for the installation of the letsEncrypt script

1. create a folder in the following location: `/var/www/letsencrypt`
2. create a folder `/etc/nginx/ssl`
3. clone the letsencrypt into `/root/work/letsencrypt.sh` destination


- name: clone letsencrypt.sh repo
  git: repo=https://github.com/lukas2511/letsencrypt.sh.git
       dest=/root/work/letsencrypt.sh
update=no
