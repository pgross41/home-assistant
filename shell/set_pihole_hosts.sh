#!/bin/bash

################################################################################
# Note: this must be run from the host, it is useless within hass
# Every 6 hours with sudo crontab -e: 
# 0 */6 * * *  /usr/share/hassio/homeassistant/shell/set_pihole_hosts.sh
################################################################################

leases=`docker exec addon_a0d7b954_pi-hole cat /etc/pihole/dhcp.leases`
hostspath=$(docker inspect -f '{{.HostsPath}}' addon_a0d7b954_pi-hole)
hosts=$(cat "$hostspath" | sed -n '/#DHCP/q;p')
echo "$hosts" > $hostspath
echo "#DHCP" >> $hostspath
echo "$leases" | sed "s/ /,/g" | xargs -n1 echo | cut -d , -f3,4 | sed "s/,/ /" | sed -E "s/(.+) (\*)/\1 \1/" >> $hostspath 
docker exec addon_a0d7b954_pi-hole service pihole-FTL restart


#################################################################
# Use static list
#################################################################
# dhcpconfig=`docker exec addon_a0d7b954_pi-hole < /data/dnsmasq.d/04-pihole-static-dhcp.conf`
# hostspath=$(docker inspect -f '{{.HostsPath}}' addon_a0d7b954_pi-hole)
# echo $dhcpconfig | xargs -n1 echo | cut -d = -f2 | cut -d , -f2,3 | sed 's/,/ /' >> $hostspath 
# service pihole-FTL restart