#!/usr/bin/env bash

# Configuration for the Vagrant VM.

# The server's hostname. You will need to add a line for this in your host
# machine's hosts file.
HOSTNAME="jenkins-sandbox"

# System timezone (the path to your local timezone inside /usr/share/zoneinfo).
TIMEZONE="America/Chicago"

# Whether or not IPv6 should be enabled.
ENABLE_IPV6=false

# If you're connected to the Internet through a proxy server, uncomment the line
# below and enter your proxy server details. Example:
#   HTTP_PROXY=http://user:password@hostname:80
#HTTP_PROXY=http://hostname:80
