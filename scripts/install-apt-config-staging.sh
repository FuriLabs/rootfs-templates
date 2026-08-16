#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

apt-get -o "Acquire::https::Verify-Peer=false" update
apt-get -o "Acquire::https::Verify-Peer=false" install furios-apt-config-staging furios-apt-config-debian-staging furios-apt-config-sync-staging -y
apt-get -o "Acquire::https::Verify-Peer=false" update

exit 0
