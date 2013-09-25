#!/usr/bin/env bash

# Set up Jenkins, PHP, MySQL, SonarQube, and SonarQube Runner for a full-fledged
# Continuous Integration server for PHP projects (especially Drupal projects).
#
# App config files are stored in the config directory, and are copied into their
# respective locations as part of this script.
#
# The following is a list of some packages that must be installed on the system
# prior to running this script (usually they're installed in the minimal CentOS
# environment, but just in case...): man nano gcc rsync mlocate
#
# Author: Jeff Geerling
# Date: 2013-09-25

# Add configuration.
source /vagrant/config/config.sh

# Make sure permissions are correct for all the setup scripts.
chmod u+x /vagrant/scripts/*

# If provisioning has already been done once, exit.
if [ -f /var/log/setup-complete ];
then
  exit 0
else
  echo -e "\nProvisioning CentOS environment... go grab some caffeine.\n"
fi

# Set up proxy config for CentOS if the HTTP_PROXY variable is set.
if [[ -n "$HTTP_PROXY" ]];
then
  export http_proxy=$HTTP_PROXY
fi

# Disable IPv6 if configured.
if ! $ENABLE_IPV6 ; then
  source /vagrant/scripts/disable-ipv6.sh
fi

# Set the server hostname.
sed -i -e "s/HOSTNAME.*/HOSTNAME=$HOSTNAME/" /etc/sysconfig/network
echo "$( ifconfig eth1 | awk '/inet addr:/{ sub(/addr:/, ""); print $2}' ) $HOSTNAME" >> /etc/hosts
echo "127.0.0.1 $HOSTNAME" >> /etc/hosts
hostname "$HOSTNAME"

# Set the timezone and date sync via NTP.
rm -f /etc/localtime
ln -s /usr/share/zoneinfo/$TIMEZONE /etc/localtime
yum install --quiet ntp
chkconfig ntpd on
ntpdate pool.ntp.org
service ntpd start

# Do extra repo setup so yum works better.
source /vagrant/scripts/repo.sh

# Install generic packages.
yum install --quiet -y rpcbind nfs-utils git
if [ "$?" = "0" ]; then
  echo "Installed generic packages."
fi

# Install Java (openJDK) for Jenkins.
yum install --quiet -y java-1.6.0-openjdk
if [ "$?" = "0" ]; then
  echo "Installed Java."
fi

# Install Jenkins.
source /vagrant/scripts/jenkins.sh

# Install PHP.
source /vagrant/scripts/php.sh

# Install MySQL.
source /vagrant/scripts/mysql.sh

# Install Sonar.
source /vagrant/scripts/sonar.sh

# Configure iptables firewall.
source /vagrant/scripts/iptables.sh

# Create a log file so future reboots won't run this script.
touch /var/log/setup-complete

# Congratulations, we're done!
echo -e "\nCentOS Provisioning complete; enjoy your brand-spanking-new VM!\n"
