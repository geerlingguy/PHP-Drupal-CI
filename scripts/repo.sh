#!/usr/bin/env bash

# Disable fastestmirror. This solves problems behind proxies and speeds up yum.
sed -i -e "s/enabled=1/enabled=0/" /etc/yum/pluginconf.d/fastestmirror.conf
yum --quiet clean all
