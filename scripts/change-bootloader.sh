#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
apt-get install -qy grub-pc # --no-install-recommends

if [ -b /dev/vda ]; then
	grub-install --boot-directory=/boot /dev/vda
elif [ -b /dev/sda ]; then
	grub-install --boot-directory=/boot /dev/sda
fi
update-grub


