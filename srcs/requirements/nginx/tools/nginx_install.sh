#!/bin/bash


# Check if certificates exist. Generate if not (useful for initial setup)
if [ ! -f /etc/nginx/ssl/certificate.key ] || [ ! -f /etc/nginx/ssl/certificate.crt ]; then
  echo "Certificates not found. Generating self-signed certificates..."
  openssl req -x509 -sha256 -nodes \
      -newkey rsa:4096 \
      -days 365 \
      -subj "/C=BR/ST=Sao Paulo/L=Sao Paulo/O=42SP/OU=Inception/CN=cado-car.42.fr" \
      -keyout /etc/nginx/ssl/certificate.key \
      -out /etc/nginx/ssl/certificate.crt
fi

# Check if TLSv1.3 is enabled. If not, enable it. 
if ! grep -q "ssl_protocols TLSv1.3" /etc/nginx/nginx.conf; then
  echo "Enabling TLSv1.3 in Nginx configuration..."
  sed -i 's/ssl_protocols.*/ssl_protocols TLSv1.3;/' /etc/nginx/nginx.conf
fi

# Start Nginx in the foreground (CRITICAL for Docker)
echo "Starting Nginx..."
exec nginx -g "daemon off;"
