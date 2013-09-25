#!/usr/bin/env bash

# Set up iptables for Vagrant VM.

# For now, just flush all rules. Someday, set up iptables properly to restrict
# access to MySQL and other services which shouldn't be public.
iptables -F
service iptables save
