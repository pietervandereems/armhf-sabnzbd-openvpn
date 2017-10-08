#!/bin/bash

cd openvpn/ipvanish
for i in ipvanish*.ovpn; do sed -i 's/^auth-user-pass/auth-user-pass\ \/config\/openvpn-credentials.txt/' $i; done
for i in ipvanish*.ovpn; do sed -i 's/^ca\ /ca\ \/etc\/openvpn\/ipvanish\//' $i; done
cd -
