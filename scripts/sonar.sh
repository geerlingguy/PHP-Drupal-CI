#!/usr/bin/env bash

##
# Install SonarQube server.
##

# Download and unzip sonar.
wget --quiet http://dist.sonar.codehaus.org/sonar-3.7.1.zip
unzip -q sonar-3.7.1.zip
rm -f sonar-3.7.1.zip
mv sonar-3.7.1 /usr/local/sonar

# Copy over our sonar properties.
cp /vagrant/config/sonar/sonar.properties /usr/local/sonar/conf/sonar.properties

# Install Sonar PHP plugin.
wget --quiet http://repository.codehaus.org/org/codehaus/sonar-plugins/php/sonar-php-plugin/1.2/sonar-php-plugin-1.2.jar
mv sonar-php-plugin-1.2.jar /usr/local/sonar/extensions/plugins/

# Allow sonar to be managed like a normal application.
cp /vagrant/config/sonar/sonar-init_d.txt /etc/init.d/sonar
ln -s /usr/local/sonar/bin/linux-x86-64/sonar.sh /usr/bin/sonar
chmod 755 /etc/init.d/sonar
chkconfig --add sonar

# Start sonar then wait until startup has completed (can take some time!).
service sonar start
sleep 45

# Set up sonar database.
# TODO: Is there some sort of sonar cli or something so we don't need to do a
# bunch of custom db queries? Any other easy way to override stuff?
mysql -u root -p$ROOTPW sonar < /vagrant/config/sonar/sonar-php-custom-rules.sql

# Restart sonar to pick up the new rules.
service sonar restart

##
# Install SonarQube runner.
##

# Download and unzip sonar-runner.
wget --quiet http://repo1.maven.org/maven2/org/codehaus/sonar/runner/sonar-runner-dist/2.3/sonar-runner-dist-2.3.zip
unzip -q sonar-runner-dist-2.3.zip
rm -f sonar-runner-dist-2.3.zip
mv sonar-runner-2.3 /usr/local/sonar-runner

# Copy over our sonar-runner properties.
cp /vagrant/config/sonar/sonar-runner.properties /usr/local/sonar-runner/conf/sonar-runner.properties

# Configure sonar-runner bash settings by copying script into /etc/profile.d/.
cp /vagrant/config/sonar/sonar.sh /etc/profile.d/sonar.sh

echo "Sonar installation complete."
