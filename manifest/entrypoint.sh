#!/bin/bash
set -e

function copyTemplates() {
  echo "# Copy Templates Start"

  find /etc/templates/nginx/ -type f -iname "*.conf" -print0 | while IFS= read -r -d '' filename
  do
    if [ -f "/etc/conf.d/nginx/${filename##*/}" ]; then
      echo "    ${filename##*/} already exists"
    else
      echo "    Copy ${filename##*/}"
      cp /etc/templates/nginx/${filename##*/} /etc/conf.d/nginx/
    fi
  done

  echo "# Copy Templates Done"
  echo " "
}

function generateThings() {
  echo "# Generate Things Start"

  if [ -f "/var/www/index.html" ]; then
    echo "    index.html already exists"
  else
    echo "    Create index.html"
    echo "Hello, nginx!" > /var/www/index.html
  fi

  mkdir -p /var/log/nginx

  echo "# Generate Things Done"
  echo " "
}

copyTemplates
generateThings

echo "# nginx Start"
echo " "
exec /usr/sbin/nginx
