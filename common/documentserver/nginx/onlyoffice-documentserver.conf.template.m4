include NGINX_CONF/onlyoffice-http.conf;
server {
  listen 0.0.0.0:80;
  listen [::]:80 default_server;
  server_tokens off;
  
  include NGINX_CONF/onlyoffice-documentserver-*.conf;
}