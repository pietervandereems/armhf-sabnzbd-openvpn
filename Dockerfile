# Sabnzb and OpenVPN
#
# Version 0.2

FROM pietervandereems/armhf-debian:testing
MAINTAINER Pieter van der Eems

VOLUME /data
VOLUME /config

# Update packages and install software
RUN apt-get update \
    && apt-get install -t testing -y sabnzbdplus par2 unrar \
    && apt-get install -y openvpn curl procps\
    && curl -sLO https://archive.raspbian.org/raspbian/pool/main/d/dumb-init/dumb-init_1.0.3-1_armhf.deb \
    && dpkg -i dumb-init_*.deb \
    && rm -rf dumb-init_*.deb \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && curl -L https://github.com/jwilder/dockerize/releases/download/v0.2.0/dockerize-linux-armhf-v0.2.0.tar.gz | tar -C /usr/local/bin -xzv

# Add configuration and scripts
ADD openvpn/ /etc/openvpn/
ADD sabnzbd/ /etc/sabnzbd/

ENV OPENVPN_USERNAME=**None** \
    OPENVPN_PASSWORD=**None** \
    OPENVPN_PROVIDER=**None** 

# Expose port and run
CMD ["dumb-init", "/etc/openvpn/start.sh"]
