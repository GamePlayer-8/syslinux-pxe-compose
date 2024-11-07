#!/bin/sh

set -ex

if ! [ -d /tftpboot/pxelinux.cfg ]; then
    mkdir -p /tftpboot/pxelinux.cfg
    copy_blobs="ldlinux.e64 libutil.c32 menu.c32 syslinux.efi"
    for X in $copy_blobs; do
        cp /usr/share/syslinux/efi64/"$X" \
            /tftpboot/
    done
    cat <<EOF >/tftpboot/pxelinux.cfg/default
UI menu.c32
TIMEOUT 100
EOF
    for __ARCHIVE in /netboot/*.tar.gz; do
        __ARCHIVE_FILE="$(basename "$__ARCHIVE")"
        __ARCHIVE_NAME="${__ARCHIVE_FILE%.*}"
        __ARCHIVE_NAME="${__ARCHIVE_NAME%.*}"
        mkdir "/tftpboot/$__ARCHIVE_NAME"
        tar -C "/tftpboot/$__ARCHIVE_NAME" -xvf "$__ARCHIVE"
        __KERNEL="$(find "/tftpboot/$__ARCHIVE_NAME" -name '*linu*' | head -n1 | cut -f 3- -d '/')"
        __INITRD="$(find "/tftpboot/$__ARCHIVE_NAME" -name 'initr*' | head -n1 | cut -f 3- -d '/')"
        cat <<EOF >>/tftpboot/pxelinux.cfg/default
LABEL $__ARCHIVE_NAME
    MENU LABEL $__ARCHIVE_NAME
    KERNEL $__KERNEL
        append initrd=$__INITRD
    TEXT HELP
        $__ARCHIVE_NAME Loader. Uses $__KERNEL:$__INITRD | Archive: $__ARCHIVE_FILE
    ENDTEXT
EOF
    done
    chown -R nobody:nogroup /tftpboot
fi

/usr/sbin/dnsmasq -k
