# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.



# Configurable variables

## Common configuration

boxVersion = "ubuntu/focal64"

## Master Configuration

masterName = "dmaster"
masterIp = "192.168.56.10"
masterCpus = 2
masterMemory = 2048

## Node Configuration

numberOfNodes = 2
nodeNamePrefix = "dnode"
nodeIpPrefix = "192.168.56.1"
nodeCpus = 1
nodeMemory = 1024

# Main Script

Vagrant.configure("2") do |config|
  # master server
  config.vm.define masterName do |dmaster|
    dmaster.vm.box = boxVersion
    dmaster.vm.hostname = masterName
    dmaster.vm.box_url = boxVersion
    dmaster.vm.network :private_network, ip: masterIp
    dmaster.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", masterMemory]
      v.customize ["modifyvm", :id, "--name", masterName]
      v.customize ["modifyvm", :id, "--cpus", masterCpus]
    end
    config.vm.provision "shell", inline: <<-SHELL
      sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config    
      service ssh restart
    SHELL
    dmaster.vm.provision "shell", path: "install_common.sh"
  end

  # slave server
  (1..numberOfNodes).each do |i|
    nodeName = nodeNamePrefix + i.to_s
    nodeIp = nodeIpPrefix + i.to_s
    config.vm.define nodeName do |dnode|
      dnode.vm.box = boxVersion
      dnode.vm.hostname = nodeName
      dnode.vm.network "private_network", ip: nodeIp
      dnode.vm.provider "virtualbox" do |v|
        v.name = nodeName
        v.memory = nodeMemory
        v.cpus = nodeCpus
      end
      config.vm.provision "shell", inline: <<-SHELL
        sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config    
        service ssh restart
      SHELL
      dnode.vm.provision "shell", path: "install_common.sh"
    end
  end
end
