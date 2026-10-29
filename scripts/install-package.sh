#!/bin/bash

set -e

export DEBIAN_FRONTEND=noninteractive

if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <package1> [package2 ...]" >&2
    exit 1
fi

echo "Updating package lists..."
apt-get -o "Acquire::https::Verify-Peer=false" update

echo "Installing packages: $*"
apt-get \
    -o "Acquire::https::Verify-Peer=false" \
    --assume-yes \
    --allow-downgrades \
    --reinstall \
    install "$@"
