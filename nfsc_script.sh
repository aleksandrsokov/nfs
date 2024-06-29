#! /bin/bash
hostnamectl set-hostname nfsc.alex.lan
echo "192.168.0.181 nfss.alex.lan nfss" >> /etc/hosts
echo "192.168.0.182 nfsc.alex.lan nfsc" >> /etc/hosts
apt update && apt install -y nfs-common 
mkdir /nfsClient
echo "nfss.alex.lan:/nfsShare /nfsClient nfs vers=3,noauto,x-systemd.automount 0 0" >> /etc/fstab
systemctl daemon-reload
systemctl restart remote-fs.target