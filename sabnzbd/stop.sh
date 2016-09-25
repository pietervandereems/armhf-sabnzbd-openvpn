#! /bin/sh

#kill $(ps aux | grep transmission-daemon | grep -v grep | awk '{print $2}')
echo "Stopping"
#exec /etc/init.d/sabnzbdplus stop
#/bin/ps ax | /bin/grep sabnzbdplus | /bin/grep -v grep | /usr/bin/xargs | /usr/bin/cut -d\  -f1 | /usr/bin/xargs kill
kill $(ps aux | grep sabnzbdplus | grep -v grep | awk '{print $2}')
echo "Sabnzbd stopped"
