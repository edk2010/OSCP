#!/bin/bash
echo "##### change root password ######" 
passwd root
echo "##### sudo -i ######"
sudo -i
echo "##### add repository ######"
echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" | tee -a /etc/apt/sources.list
echo "deb-src http://http.kali.org/kali kali-rolling main contrib non-free" | tee -a /etc/apt/sources.list

echo "##### update the system ######"
apt update && sudo apt full-upgrade -y

echo "##### install utills ######" 
apt install net-tools -y
apt install tilix -y
apt install gobuster -y


echo "##### config ssh ######" 
mkdir /etc/ssh/default_keys
mv /etc/ssh/ssh_host_* /etc/ssh/default_keys/
dpkg-reconfigure openssh-server
nano /etc/ssh/sshd_config  #PubkeyAuthentication yes #PasswordAuthentication no
systemctl start ssh.socket
systemctl stop ssh.socket
systemctl enable ssh.service
systemctl start ssh.service
systemctl status ssh.service

echo "##### install remote connection ######" 
apt install xrdp -y
systemctl enable xrdp
systemctl start xrdp

