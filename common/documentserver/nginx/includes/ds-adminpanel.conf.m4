# Admin API: proxy as-is (do not strip prefix)
location /api/v1/admin {
  proxy_pass http://adminpanel;
}

# Normalize /admin -> /admin/
location = /admin {
  # Consider possible ds-vpath prefix
  return 301 $the_scheme://$the_host$the_prefix/admin/$is_args$args;
}

# Admin SPA under /admin prefix with history fallback
location ^~ /admin/ {
  # Serve built static files directly; trailing slash on alias is required
  alias M4_DS_ROOT/server/AdminPanel/client/build/;
  # SPA history fallback: serve index.html for unknown routes
  try_files $uri $uri/ /admin/index.html;
}
