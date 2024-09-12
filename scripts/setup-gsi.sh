#!/bin/sh

# create android users and groups
systemd-sysusers

# enable android LXC service
systemctl enable lxc@android

