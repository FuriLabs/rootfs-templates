#!/bin/bash

# Remove extrepos
rm -f /etc/apt/sources.list.d/extrepo_furilabs.sources
rm -f /var/lib/extrepo/keys/furilabs.asc

# Nuke /etc/apt/sources.list
> /etc/apt/sources.list

# Finally update again
apt update

exit 0
