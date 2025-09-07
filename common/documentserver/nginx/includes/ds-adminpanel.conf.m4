location /api/v1/admin {
  proxy_pass http://adminpanel;
}

location /admin {
  proxy_pass http://adminpanel/;
}