# nfs

root@nfss:~# grep -i "udp" /boot/config-5.15.0-107-generic | grep -i dis
CONFIG_NFS_DISABLE_UDP_SUPPORT=y  
Для подключения по протоколу UPD необходимо пересобирать ядро  

root@nfsc:~# mount -t nfs -o vers=4 nfss.alex.lan:/nfsShare /mnt
mount.nfs: Protocol not supported