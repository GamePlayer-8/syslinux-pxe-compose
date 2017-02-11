# docker-pxe - a Docker container running a continuous PXE server

# DOCKER HUB

https://registry.hub.docker.com/u/reapsz/alpine-pxe/

# EXAMPLE

```
$ docker run -d -p 69:69/udp --restart=always --privileged --cap-add=NET_ADMIN reapsz/alpine-pxe

$ docker run -d -p 69:69/udp --cap-add=NET_ADMIN reapsz/alpine-pxe
```
For use with Pfsense/opnsense add the ip of the docker host and add "pxelinux.0" to "Set default bios filename".

# REQUIREMENTS

* [Docker](https://www.docker.com/)

#Based on:
$ https://registry.hub.docker.com/u/mcandre/docker-pxe/
$ https://github.com/mcandre/docker-pxe
