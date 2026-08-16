#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

apt-get -o "Acquire::https::Verify-Peer=false" update
apt-get -o "Acquire::https::Verify-Peer=false" install ca-certificates furios-apt-config furios-apt-config-sync furios-archive-keyring -y

exit 0
