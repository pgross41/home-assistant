#!/bin/bash

################################################################################
# Note: this must be run from the addon container, it is useless within hass
# Every Sunday (well... Monday) at midnight 
# 0 0 * * 1  /usr/share/hassio/homeassistant/shell/purge_pihole_log.sh
################################################################################

# Actually these 2 commands are in a file in the /etc/periodic/weekly directory

sudo rm /data/databases/core-mariadb.err
sudo touch /data/databases/core-mariadb.err