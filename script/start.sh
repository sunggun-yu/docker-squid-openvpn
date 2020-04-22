#!/bin/sh

openvpn --config /config.ovpn \
 --auth-user-pass ${USER_PASS_FILE} \
 --daemon \
 --log /var/log/openvpn.log && \
 timeout 30 \
  sh -c 'until cat /var/log/openvpn.log | grep "Initialization Sequence Completed" > /dev/null; do sleep 1 | echo "connecting vpn..." ; done' || \
  timeout_rtrn_code=$? && \
 squid -YCd1

