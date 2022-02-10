#!/bin/bash

export PROFILE=toor

maas $PROFILE boot-resources create \
        name='custom/cisdesktop'  \
        architecture=amd64/generic \
        title='Ubuntu 20.04 CIS' \
        base_image=ubuntu/focal \
        filetype=tgz \
        content@="${1:-ubuntu-cis.tar.gz}"
