#!/bin/bash

RAW=$1
MNTDIR=$(mktemp -d)

sudo losetup -P /dev/loop99 $RAW

sudo mount /dev/loop99p3 $MNTDIR
sudo mount /dev/loop99p2 $MNTDIR/boot/efi

sudo tar -Szcpf desktop.tgz --acls --selinux --xattrs -C ./scripts . -C $MNTDIR .

sudo umount $MNTDIR/boot/efi
sudo umount $MNTDIR

sudo losetup -d /dev/loop99

rmdir $MNTDIR
