#!/bin/bash
DOMAIN="__DOMAIN__"
EMAIL="__EMAIL__"
staging=0  # Set to 1 for testing with Let's Encrypt staging

echo "==> Starting nginx for certbot challenge..."
docker compose up -d nakout
sleep 5

echo "==> Requesting SSL certificate..."
docker compose run --rm certbot certonly \
  --webroot \
  --webroot-path=/var/www/certbot \
  --email "$EMAIL" \
  --agree-tos \
  --no-eff-email \
  -d "$DOMAIN" \
  $( [ "$staging" != "0" ] && echo "--staging" )

echo "==> Certificate issued. Now update nginx.conf with SSL config and restart:"
echo "    1. Edit nginx.conf — replace the HTTP block with the SSL version"
echo "    2. Run: docker compose down && docker compose up -d"
