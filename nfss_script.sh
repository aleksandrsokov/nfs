#! /bin/bash
hostnamectl set-hostname nfss.alex.lan
echo "192.168.0.181 nfss.alex.lan nfss" >> /etc/hosts
echo "192.168.0.182 nfsc.alex.lan nfsc" >> /etc/hosts
apt update 
apt install nfs-kernel-server -y
systemctl enable --now nfs-kernel-server.service
sed -i 's/\# vers3=y/vers3=y/' /etc/nfs.conf
sed -i 's/\# vers4=y/vers4=n/' /etc/nfs.conf
sed -i 's/\# vers4.1=y/vers4.1=n/' /etc/nfs.conf
sed -i 's/\# vers4.2=y/vers4.2=n/' /etc/nfs.conf
systemctl restart nfs-kernel-server.service
mkdir /nfsShare
chown -R nobody:nogroup /nfsShare
chmod 0777 /nfsShare
touch /nfsShare/test.txt
echo '/nfsShare 192.168.0.182/32(rw,async,no_subtree_check,no_root_squash)' >> /etc/exports
exportfs -ra