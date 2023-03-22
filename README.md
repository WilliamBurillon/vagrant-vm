# Vagrant-vm

This repo aims to use Vagrant in order to create a couple of Virtual Machine under Ubuntu Focal. It also allows you to use SSH directly from the commandline, without using `vagrant ssh`. This feature can be useful with Ansible because it use SSH to achieve action on the servers / VMs. 

## Prerequisites

- [Vagrant](https://www.vagrantup.com/downloads.html)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

## Usefull commands

- `vagrant up` : Create and configure guest machines according to your Vagrantfile.
- `vagrant ssh` : Connect to machine via SSH.
- `vagrant status` : List all running virtual machines.
- `vagrant halt` : Gracefully stop the running machine Vagrant is managing.
- `vagrant destroy` : Stops and deletes all traces of the vagrant machine.

## How to use

- Clone this repo
- Go to the folder where you cloned the repo
- Run `vagrant up`

Then you can access directly to your VM with `ssh vagrant@<VM-IP>`. The password is `vagrant`.