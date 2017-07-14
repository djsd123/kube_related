# -*- mode: ruby -*-
# vi: set ft=ruby :
ENV["LC_ALL"] = "en_US.UTF-8"

Vagrant.configure(2) do |config|

  #kubernetes_ports = %w()

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true

  (1..3).each do |u|
   config.vm.define "xenial#{u}" do |ubuntu|
    ubuntu.vm.box = "ubuntu/xenial64"
    ubuntu.vm.hostname = "xenial#{u}.example.com"
    ubuntu.vm.network "private_network", ip: "172.28.128.3#{u}"
    ubuntu.vm.provision "shell", path: "kubeadm.sh"
    ubuntu.vm.synced_folder ".", "/vagrant", type: "nfs"
 #  kubernetes_ports.each do |kp|
 #    ubuntu.vm.network "forwarded_port", guest: "#{kp}", host: "#{kp}"
 #   end
    ubuntu.vm.provider "virtualbox" do |v|
       v.memory = 1024
    end
   end
  end

end
