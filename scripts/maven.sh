#!/usr/bin/env bash

wget --quiet http://mirrors.ibiblio.org/apache/maven/maven-3/3.2.3/binaries/apache-maven-3.2.3-bin.tar.gz
/bin/tar xzf apache-maven-3.2.3-bin.tar.gz
mkdir /usr/local/apache-maven
mv apache-maven-3.2.3 /usr/local/apache-maven
echo "# maven environment variables" > /etc/profile.d/maven.sh
echo "export M2_HOME=/usr/local/apache-maven/apache-maven-3.2.3" >> /etc/profile.d/maven.sh
echo "export PATH=\$M2_HOME/bin:\$PATH" >> /etc/profile.d/maven.sh
chmod +x /etc/profile.d/maven.sh

echo "Installed Maven 3.2."
