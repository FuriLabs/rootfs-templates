#!/bin/bash

# initialize flatpak
if [ -f "/usr/bin/flatpak" ]; then
   flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
   flatpak remote-modify --enable flathub
fi

# furios-initial-setup needs this
dpkg-reconfigure furios-quirks-polkit

exit 0
