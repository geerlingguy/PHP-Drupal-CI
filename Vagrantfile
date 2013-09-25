# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. See: vagrantup.com.

  # Build against CentOS 6.4 minimal, without any config management utilities.
  config.vm.box = "centos64"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210-nocm.box"

  # Enable host-only access to the machine using a specific IP.
  config.vm.network :private_network, ip: "192.168.33.10"

  # Alternatively, you can use NAT/bridged networking by using :public_network
  # config.vm.network :public_network

  # You can share additional folders to the guest VM; the first argument is the
  # path to the folder on the host, the second is the path on the guest on which
  # to mount the folder.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Uncomment the line below to use NFS for the default synced folder on non-
  # Windows platforms. This should speed up filesystem access considerably.
  # config.vm.synced_folder ".", "/vagrant", :nfs => !RUBY_PLATFORM.downcase.include?("w32")

  # Configuration for the VirtualBox provider.
  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--name", "jenkins-sandbox"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 512]
    v.customize ["modifyvm", :id, "--cpus", 2]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
    # Uncomment this line to boot into the GUI to show console output.
    #v.gui = true
  end

  # Set the name of the VM. See: http://stackoverflow.com/a/17864388/100134
  config.vm.define :jenkins do |jenkins_config|
  end

  # Run setup.sh shell script to install required packages.
  config.vm.provision :shell, :path => "scripts/setup.sh"

end
