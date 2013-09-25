# Vagrant profile for Drupal/PHP CI

## Background

Vagrant and VirtualBox (or some other VM provider) can be used to quickly build or rebuild virtual servers used for Continuous Integration (CI) and static code analysis.

This Vagrant profile installs Java, Jenkins, PHP, MySQL, and SonarQube to assist with deployments, continuous integration, and static code analysis for PHP-based projects, especially those written on top of Drupal.

## Getting Started

This README file is inside a folder that contains a `Vagrantfile` (hereafter this folder shall be called the [vagrant_root]), which tells Vagrant how to set up your virtual machine in VirtualBox.

To use the vagrant file, you will need to have done the following:

  1. Download and Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
  2. Download and Install [Vagrant](http://downloads.vagrantup.com/)
  3. Open a shell prompt (like Terminal on a Mac or cmd or PowerShell on Windows) and cd into the folder containing the `Vagrantfile`.

Once all of that is done, you can simply type in `vagrant up`, and Vagrant will create a new VM, install the centos64 base box, and configure it as a CI server with Jenkins, PHP, MySQL, SonarQube and SonarQube Runner.

Some things to note:

  1. You can set your hostname, and whether or not to use a proxy server inside `[vagrant_root]/config/config.sh`.

Once the new VM is up and running (after `vagrant up` is complete and you're back at the command prompt), you can log into it via SSH if you'd like by typing in `vagrant ssh`. Otherwise, the next steps are below:

### Setting up your hosts file

You need to modify your host machine's hosts file (Mac/Linux: `/etc/hosts`; Windows: `%systemroot%\system32\drivers\etc\hosts`), adding the line below:

    192.168.33.10  jenkins-sandbox

(Where `jenkins-sandbox`) is the hostname you have configured in `[vagrant_root]/config/config.sh` and in the `Vagrantfile`).

After that is configured, you could visit http://jenkins-sandbox:8080/ in a browser, and you'll see the Jenkins home page. Nice!

If you'd like additional assistance editing your hosts file, please read [How do I modify my hosts file?](http://www.rackspace.com/knowledge_center/article/how-do-i-modify-my-hosts-file) from Rackspace.
