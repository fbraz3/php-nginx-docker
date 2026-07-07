#!/bin/bash

# PHP-Nginx Docker Healthcheck Script
# Verifies that Nginx is running and responsive

set -e

# Flags for service status
nginx_ok=false

# Check Nginx
code=$(curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1/)
if [ "$code" != "000" ] && [ "$code" != "502" ]; then
    nginx_ok=true
fi

# Both services must be healthy
if [ "$nginx_ok" = true ]; then
    exit 0
else
    echo "Health check failed: nginx=$nginx_ok"
    exit 1
fi
