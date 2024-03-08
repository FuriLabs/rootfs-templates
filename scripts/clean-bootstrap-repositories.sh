#!/bin/bash

# Remove extrepos
rm -f /etc/apt/sources.list.d/extrepo_furilabs.sources
rm -f /etc/apt/sources.list.d/extrepo_mobian.sources
rm -f /var/lib/extrepo/keys/furilabs.asc
rm -f /var/lib/extrepo/keys/mobian.asc

# Nuke /etc/apt/sources.list
> /etc/apt/sources.list

# Finally update again
apt update

exit 0
