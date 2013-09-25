#!/usr/bin/env bash

# Disable IPv6 support in CentOS.

# Disable IPv6 on en0 interface.
SEARCH="IPV6INIT=\"yes\""
REPLACEMENT="IPV6INIT=\"no\""
sed -i.bak "s/${SEARCH}/${REPLACEMENT}/g" /etc/sysconfig/network-scripts/ifcfg-eth0

# Disable IPv6 in sysctl.conf.
echo "# Disable IPv6 functionality." >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf

# Restart networking.
service network restart
