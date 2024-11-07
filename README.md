# Syslinux PXE Compose

The repository is about deploying multiple netboot distros over network, using dnsmasq, tftpd & syslinux.
Can be easily automated and autoscalled with Docker SWARM / Kubernetes. Does **not** provide DHCP *unless* `dnsmasq.conf` 
has been modified to do so.

## GitHub

https://github.com/GamePlayer-8/syslinux-pxe-compose/

## EXAMPLE
```
$ docker compose up -d
```
It starts with 69/udp port. Uses ./netboot directory as a place for getting the netboot distros.
Packaging `*.tar.gz` - searches for `*linu*` as KERNEL and `initr*` as INITRAMFS.

## REQUIREMENTS

* [Docker](https://www.docker.com/)

## Based on:
https://github.com/thereapsz/alpine-pxe/

https://registry.hub.docker.com/u/mcandre/docker-pxe/

https://github.com/mcandre/docker-pxe/

# License

[MIT](LICENSE.md)
