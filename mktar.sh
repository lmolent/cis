#!/bin/bash

MNTDIR=$(mktemp -d)

sudo losetup -P /dev/loop99 desktop.raw 

sudo mount /dev/loop99p3 $MNTDIR
sudo mount /dev/loop99p2 $MNTDIR/boot/efi

sudo tar -Szcpf desktop.tgz --acls --selinux --xattrs -C ./scripts . -C $MNTDIR .

#sudo tar -rvf desktop.tar curtin

#sudo gzip desktop.tar

sudo umount $MNTDIR/boot/efi
sudo umount $MNTDIR

sudo losetup -d /dev/loop99

rmdir $MNTDIR
