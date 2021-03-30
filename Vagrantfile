# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 8192
    vb.cpus = 4
  end

  # For remote access to web UI
  config.vm.network "forwarded_port", guest: 30300, host: 30300, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 30080, host: 30080, host_ip: "127.0.0.1"

  # Install Docker and setup a Kubernetes cluster
  config.vm.provision "docker"
end
