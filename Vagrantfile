# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.disksize.size = '32GB'

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 8192
    vb.cpus = 4
  end

  # For remote access to web UI
  config.vm.network "forwarded_port", guest: 30300, host: 30300, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 30080, host: 30080, host_ip: "127.0.0.1"

  # Upgrade kernel
  config.vm.provision "shell", inline: <<-SCRIPT
    sudo apt-get -y update
    sudo apt-get -y install linux-image-5.0.0-23-generic linux-headers-5.0.0-23-generic
    sudo update-initramfs -u -k all
    sudo update-grub
  SCRIPT
  config.vm.provision "reload"

  # Install Docker and setup a Kubernetes cluster
  config.vm.provision "docker"
  config.vm.provision "shell", path: "setup.sh", privileged: false
end
