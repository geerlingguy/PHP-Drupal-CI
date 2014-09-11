#!/usr/bin/env bash

# Install Jenkins and required plugins.

# Install and configure Jenkins to start on boot. Use the latest release.
wget --quiet -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --quiet --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
# Alternatively, you can use the LTS stable release by uncommenting these lines.
# wget --quiet -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
# rpm --quiet --import http://pkg.jenkins-ci.org/redhat-stable/jenkins-ci.org.key
yum install --quiet -y jenkins

# If Jenkins installed without errors, configure it.
if [ "$?" = "0" ]; then
  echo "Installed Jenkins."
  service jenkins start
  chkconfig jenkins on

  # Wait for Jenkins to complete startup (it can take some time).
  sleep 45

  # Manually update Jenkins' plugin directory. This is required because Jenkins
  # is silly/GUI-loving. See: https://gist.github.com/rowan-m/1026918
  curl -s -L http://updates.jenkins-ci.org/update-center.json | sed '1d;$d' | curl -s -X POST -H 'Accept: application/json' -d @- http://$HOSTNAME:8080/updateCenter/byId/default/postBack

  # Grab the Jenkins CLI jar from the Jenkins server.
  wget --quiet http://$HOSTNAME:8080/jnlpJars/jenkins-cli.jar

  # Install the Jenkins phing plugin.
  java -jar jenkins-cli.jar -s http://$HOSTNAME:8080/ install-plugin phing

  # Install the Jenkins git plugin.
  java -jar jenkins-cli.jar -s http://$HOSTNAME:8080/ install-plugin git

  # Install the SonarQube plugin and copy across our Sonar configuration.
  java -jar jenkins-cli.jar -s http://$HOSTNAME:8080/ install-plugin sonar
  cp /vagrant/config/jenkins/hudson.plugins.sonar.SonarPublisher.xml /var/lib/jenkins/
  cp /vagrant/config/jenkins/hudson.plugins.sonar.SonarRunnerInstallation.xml /var/lib/jenkins/
  cp /vagrant/config/jenkins/hudson.tasks.Maven.xml /var/lib/jenkins/
  
  # Import the Jenkins job for Drupal7.
  # See: http://stackoverflow.com/a/9954283/100134
  java -jar jenkins-cli.jar -s http://$HOSTNAME:8080/ create-job Drupal7 < /vagrant/config/jenkins/Drupal7.xml

  # Restart Jenkins.
  service jenkins restart
fi
