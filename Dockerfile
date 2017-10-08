# Sabnzb and OpenVPN
#
# Version 0.2

#FROM pietervandereems/armhf-debian:testing
FROM pietervandereems/armhf-debian:17.03-testing
MAINTAINER Pieter van der Eems

VOLUME /data
VOLUME /config

# Update packages and install software
RUN echo "deb http://ppa.launchpad.net/jcfp/ppa/ubuntu xenial main" | tee -a /etc/apt/sources.list
RUN echo "deb http://ppa.launchpad.net/jcfp/sab-addons/ubuntu xenial main" | tee -a /etc/apt/sources.list
RUN apt-get update \
    && apt-get install -y --allow-unauthenticated sabnzbdplus par2 unrar python-sabyenc\
    && apt-get install -y --allow-unauthenticated openvpn curl procps\
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
