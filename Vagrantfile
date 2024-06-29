# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
 config.vm.box = "ubuntu/jammy64"

 config.vm.provider "virtualbox" do |v|
   v.memory = 1024
   v.cpus = 1
 end

 config.vm.define "nfss" do |nfss|
   nfss.vm.network "public_network", ip: "192.168.0.181"
   nfss.vm.hostname = "nfss"

   nfss.vm.provision "shell", inline: <<-SHELL
    mkdir -p ~root/.ssh
    cp ~vagrant/.ssh/auth* ~root/.ssh
    sudo sed -i 's/\PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
    sudo sed -i 's/KbdInteractiveAuthentication no/\#KbdInteractiveAuthentication no/g' /etc/ssh/sshd_config
    systemctl restart sshd
   SHELL

   nfss.vm.provision "shell", path: "nfss_script.sh"
 end


 config.vm.define "nfsc" do |nfsc|
   nfsc.vm.network "public_network", ip: "192.168.0.182"
   nfsc.vm.hostname = "nfsc"

  nfsc.vm.provision "shell", inline: <<-SHELL
    mkdir -p ~root/.ssh
    cp ~vagrant/.ssh/auth* ~root/.ssh
    sudo sed -i 's/\PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
    sudo sed -i 's/KbdInteractiveAuthentication no/\#KbdInteractiveAuthentication no/g' /etc/ssh/sshd_config
    systemctl restart sshd
   SHELL

   nfsc.vm.provision "shell", path: "nfsc_script.sh"
 end


end