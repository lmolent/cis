#!/bin/bash



#RAW=./output-qemu/packer-qemu
#TAR=./ubuntu-cis.tar.gz

[ -z $RAW ] && exit 0
[ -z $TAR ] && exit 0

MNTDIR=$(mktemp -d)

sudo losetup -P /dev/loop99 $RAW

sudo mount /dev/loop99p2 $MNTDIR
sudo mount /dev/loop99p1 $MNTDIR/boot/efi

sudo tar -Szcpf $TAR --acls --selinux --xattrs -C ./scripts curtin -C $MNTDIR .

sudo umount $MNTDIR/boot/efi
sudo umount $MNTDIR

sudo losetup -d /dev/loop99

rmdir $MNTDIR
