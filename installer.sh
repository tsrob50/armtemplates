#!/bin/bash

# installer script
# simple but works

date >>/var/log/installoutput.txt
sudo yum -y install fontconfig >>/var/log/installoutput.txt
sudo yum -y install freetype >>/var/log/installoutput.txt
sudo yum -y install gettext >>/var/log/installoutput.txt
sudo yum -y install grub2 >>/var/log/installoutput.txt
sudo yum -y install libjpeg-turbo >>/var/log/installoutput.txt
sudo yum -y install libpng >>/var/log/installoutput.txt
sudo yum -y install libXext >>/var/log/installoutput.txt
sudo yum -y install libXrender >>/var/log/installoutput.txt
sudo yum -y install libxslt >>/var/log/installoutput.txt
sudo yum -y install apr >>/var/log/installoutput.txt
sudo yum -y install apr >>/var/log/installoutput.txt
sudo yum -y install glibc >>/var/log/installoutput.txt
sudo yum -y install libevent >>/var/log/installoutput.txt
sudo yum -y install libselinux >>/var/log/installoutput.txt
sudo yum -y install mailcap >>/var/log/installoutput.txt
sudo yum -y install openssl-libs >>/var/log/installoutput.txt
sudo yum -y install systemd >>/var/log/installoutput.txt
sudo yum -y install yajl >>/var/log/installoutput.txt

# Need to add the host file update for Informatica servers
sudo echo "192.168.254.1 testentry.example.com testentry" >> /etc/hosts

# Add ULimit https://access.redhat.com/solutions/61334
sudo echo "*    soft    nofile  32" >>/etc/security/limits.conf 
sudo echo "*    hard    nofile  64" >>/etc/security/limits.conf
sudo echo "*    hard    nproc  4096" >>/etc/security/limits.conf 


# Format Hard Drive
# https://serverfault.com/questions/258152/fdisk-partition-in-single-line
sudo sfdisk -l >>/var/log/installoutput.txt
dev='/dev/sdc' >>/var/log/installoutput.txt
sudo umount "$dev" >>/var/log/installoutput.txt
printf "o\nn\np\n1\n\n\nw\n" | sudo fdisk "$dev" >>/var/log/installoutput.txt
sudo mkfs.ext4 "${dev}1" >>/var/log/installoutput.txt
