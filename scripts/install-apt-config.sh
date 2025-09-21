#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

apt-get -o "Acquire::https::Verify-Peer=false" update
apt-get -o "Acquire::https::Verify-Peer=false" install -y \
    ca-certificates \
    furios-apt-config \
    furios-apt-config-staging \
    furios-apt-config-krypton \
    furios-apt-config-krypton-staging \
    furios-apt-config-debian-staging \
    furios-archive-keyring

exit 0
