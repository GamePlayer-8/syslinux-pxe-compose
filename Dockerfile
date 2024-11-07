############################################################
# Dockerfile for pxe-server serving ubuntu netboot
# Based on alpine
############################################################
ARG VERSION=3.20.3
FROM alpine:$VERSION AS app
RUN apk add --no-cache dnsmasq tar \
    syslinux
COPY dnsmasq.conf /etc/dnsmasq.conf
COPY cmd.sh /
RUN chmod 755 /cmd.sh
EXPOSE 69/udp
CMD ["/cmd.sh"]
