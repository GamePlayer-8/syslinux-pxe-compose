# Alpine-pxe
Alpine-pxe is a docker container for serving Ubuntu netboot image for PXE-boot.
this container uses Alpine and dnsmasq in order to serve the image.

## DOCKER HUB

https://registry.hub.docker.com/u/reapsz/alpine-pxe/

## GitHub

https://github.com/thereapsz/alpine-pxe

## EXAMPLE
```
$ docker run -d -p 69:69/udp --restart=always --privileged --cap-add=NET_ADMIN reapsz/alpine-pxe

$ docker run -d -p 69:69/udp --cap-add=NET_ADMIN reapsz/alpine-pxe
```
For use with Pfsense/opnsense add the ip of the docker host and add "pxelinux.0" to "Set default bios filename".

## REQUIREMENTS

* [Docker](https://www.docker.com/)

## Based on:
https://registry.hub.docker.com/u/mcandre/docker-pxe/

https://github.com/mcandre/docker-pxe
