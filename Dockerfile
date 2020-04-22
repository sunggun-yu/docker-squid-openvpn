FROM alpine
RUN apk add --no-cache squid openvpn
EXPOSE 3128 3130
ADD script /
CMD tail -f /dev/null
