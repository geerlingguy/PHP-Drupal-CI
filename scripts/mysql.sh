#!/usr/bin/env bash

# Install and configure MySQL server.

# The root user password for MySQL. Note that this virtual machine is meant for
# local development. If you plan on building a server for more public access,
# security is *your* responsibility. Use secure passwords and lock down the
# server with a firewall, etc.
ROOTPW=root

# Install MySQL.
yum install --quiet -y mysql-server mysql
# If MySQL installed without errors, configure it.
if [ "$?" = "0" ]; then
  echo "Installed MySQL."

  # Start MySQL and configure it to turn on during boot.
  service mysqld start > /dev/null 2>&1
  chkconfig mysqld on

  # Configure the root password.
  /usr/bin/mysqladmin -u root password $ROOTPW
  /usr/bin/mysqladmin -u root -h $HOSTNAME password $ROOTPW

  # Delete the anonymous user.
  echo "DELETE FROM mysql.user WHERE User='';" | mysql -u root -p$ROOTPW
  echo "FLUSH PRIVILEGES;" | mysql -u root -p$ROOTPW

  # Delete the test database.
  echo "DROP DATABASE test" | mysql -u root -p$ROOTPW

  # Set up a database and user for sonar.
  mysql -u root -p$ROOTPW < /vagrant/config/sonar/sonar-db-setup.sql

  # Copy our own my.cnf.
  cp /vagrant/config/my.cnf /etc/my.cnf
fi
