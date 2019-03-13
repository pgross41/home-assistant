#!/bin/bash

################################################################################
# Note: this must be run from the addon container, it is useless within hass
# Every Sunday (well... Monday) at midnight 
# 0 0 * * 1  /usr/share/hassio/homeassistant/shell/purge_pihole_log.sh
################################################################################

sudo service pihole-FTL stop
sudo rm /etc/pihole/pihole-FTL.db
sudo rm /data/log/pihole.log
sudo service pihole-FTL start