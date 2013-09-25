#!/usr/bin/env bash

# Install PHP and related tools via PEAR/PECL.
#
# Note 2: pear/pecl is really noisy, and has no -q or --quiet option, so we use
# `> /dev/null 2>&1` after those commands to make sure errors don't get lost
# in the morass of status information.
#
# See: http://pear.php.net/bugs/bug.php?id=18461

# Install PHP and PEAR.
yum install --quiet -y php php-devel php-xml php-pear ImageMagick

# If PHP and PEAR installed without errors, configure them.
if [ "$?" = "0" ]; then
  echo "Installed PHP."

  # Update pear.php.net channel.
  pear channel-update pear.php.net

  # Enable auto_discover so we don't need to discover required channels.
  pear config-set auto_discover 1

  # Install PHPUnit.
  pear channel-discover pear.phpunit.de
  pear channel-discover pear.symfony.com
  pear install phpunit/PHPUnit > /dev/null 2>&1

  # Install PHP Copy/Paste detector.
  pear install pear.phpunit.de/phpcpd > /dev/null 2>&1

  # Install PHPMD.
  pear channel-discover pear.phpmd.org
  pear channel-discover pear.pdepend.org
  pear install phpmd/PHP_PMD > /dev/null 2>&1

  # Install PHP_CodeSniffer.
  pear install PHP_CodeSniffer > /dev/null 2>&1

  # Install Xdebug.
  pecl install xdebug > /dev/null 2>&1

  # Install VCS extensions.
  # pear install VersionControl_SVN-alpha
  # pear install VersionControl_Git

  # Install phing.
  pear channel-discover pear.phing.info
  pear install phing/phing > /dev/null 2>&1

  # Copy Drupal Coding Standards into Code Sniffer directory.
  wget --quiet http://ftp.drupal.org/files/projects/coder-7.x-2.x-dev.tar.gz
  tar -zxf coder-7.x-2.x-dev.tar.gz
  mv coder/coder_sniffer/Drupal $(pear config-get php_dir)/PHP/CodeSniffer/Standards/Drupal
  rm coder-7.x-2.x-dev.tar.gz
  rm -rf coder

  # Copy our own php.ini.
  cp /vagrant/config/php.ini /etc/php.ini
fi
