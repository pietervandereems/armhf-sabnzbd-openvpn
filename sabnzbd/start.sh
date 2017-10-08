#!/bin/sh

# Source our persisted env variables from container startup
#. /etc/transmission/environment-variables.sh

# This script will be called with tun/tap device name as parameter 1, and local IP as parameter 4
# See https://openvpn.net/index.php/open-source/documentation/manuals/65-openvpn-20x-manpage.html (--up cmd)
#echo "Updating TRANSMISSION_BIND_ADDRESS_IPV4 to the ip of $1 : $4"
#export TRANSMISSION_BIND_ADDRESS_IPV4=$4

#echo "Generating transmission settings.json from env variables"
# Ensure TRANSMISSION_HOME is created
#mkdir -p ${TRANSMISSION_HOME}
#dockerize -template /etc/transmission/settings.tmpl:${TRANSMISSION_HOME}/settings.json /bin/true

#if [ ! -e "/dev/random" ]; then
#  # Avoid "Fatal: no entropy gathering module detected" error
#  echo "INFO: /dev/random not found - symlink to /dev/urandom"
#  ln -s /dev/urandom /dev/random
#fi

#echo "STARTING TRANSMISSION"
#exec /usr/bin/transmission-daemon -g ${TRANSMISSION_HOME} --logfile ${TRANSMISSION_HOME}/transmission.log &

#echo "Transmission startup script complete."

echo "Starting sabnzbd"
echo /usr/bin/python /usr/bin/sabnzbdplus --daemon --config-file /etc/sabnzbd/sabnzbd.ini --server `/bin/hostname --ip-addres`:8080
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
EXPORT LANG=en_US.UTF-8
#exec /usr/bin/python /usr/bin/sabnzbdplus --deamon -f /etc/sabnzbd/sabnzbd.ini --server `/bin/hostname --ip-addres`:8080 
exec /usr/bin/python /usr/bin/sabnzbdplus --daemon --config-file /etc/sabnzbd/sabnzbd.ini --server `/bin/hostname --ip-addres`:8080

echo "Sabnzbd started"
