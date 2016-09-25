# armhf-sabnzbd-openvpn
Armhf docker with sabnzbd and openvpn, forked and altered from https://github.com/haugene/docker-transmission-openvpn

IMPORTANT
=========
PROBABLY DOES NOT FULLY WORK YET

CHANGES
=======
Removed transmission
Added sabnzbd
Based on pietervandereems/armhf-debian:testing (debian testing, main&contrib&non-free)


BUILD
=====
./build.sh

START
=====
docker run --privileged -v /mnt/sabnzb:/data -v /etc/localtime:/etc/localtime:ro -e "OPENVPN_PROVIDER=IPVANISH" -e "OPENVPN_CONFIG=ipvanish-NL-Amsterdam-ams-a03" -e "OPENVPN_USERNAME=CHANGEME" -e "OPENVPN_PASSWORD=CHANGEME" -e "LOCAL_NETWORK=192.168.0.0/24" -p 8080:8080  pietervandereems/armhf-sabnzb-openvpn
