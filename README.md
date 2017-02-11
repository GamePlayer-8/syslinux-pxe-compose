# docker-pxe - a Docker container running a continuous PXE server

# DOCKER HUB

https://registry.hub.docker.com/u/thereapsz/docker-pxe/

# EXAMPLE

```
$ docker run -d -p 69:69/udp --restart=always --privileged --cap-add=NET_ADMIN mcandre/docker-pxe

$ docker run -d -p 69:69/udp --cap-add=NET_ADMIN mcandre/docker-pxe

$ qemu-system-x86_64 -no-acpi -boot n -bootp tftp://$(docker-machine ip default)/pxelinux.0
```

# REQUIREMENTS

* [Docker](https://www.docker.com/)

#Based on:
https://registry.hub.docker.com/u/mcandre/docker-pxe/
