#!/bin/bash
source ./main.sh
source ./site.sh
source ./wifi.sh

# Uses Controller Url, Api Key, (Optional) Site
query_site_id # sets ${site_id}

# Uses Controller Url, Api Key, site_id
query_wifi_id # sets ${wifi_id}

# Uses Controller Url, Api Key, site_id, wifi_id
query_wifi # sets ${wifi}

# Uses Controller Url, Api Key, site_id, wifi_id, wifi
wifi_password # sets ${wifi_password}

# Generate the QR Code
qrencode --output=/usr/local/apache2/htdocs/qr-code.png \
    --size=6 \
    --margin=0 \
    "WIFI:T:WPA;S:${WIFI_SID};P:${wifi_password};;"

# Copy the template and fill it
cp /usr/local/apache2/htdocs/index.html.template /usr/local/apache2/htdocs/index.html

sed -i -e 's/{WIFI-SID}/'"${WIFI_SID}"'/g' /usr/local/apache2/htdocs/index.html
sed -i -e 's/{WIFI-PASSWORD}/'${wifi_password}'/g' /usr/local/apache2/htdocs/index.html

httpd-foreground