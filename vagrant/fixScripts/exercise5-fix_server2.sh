#!/bin/bash
#add fix to exercise5-server2 here

sudo sed -i "35s/ask/no/" /etc/ssh/ssh_config
sudo sed -i "35s/#/ /" /etc/ssh/ssh_config

cd /root/.ssh/
ssh-keygen -t rsa -N '' -f id_rsa
sudo apt-get install sshpass
sshpass -p vagrant ssh-copy-id 192.168.100.10
ssh 192.168.100.10 "sshpass -p vagrant ssh-copy-id 192.168.100.11"

su - vagrant
cd /home/vagrant/.ssh/
ssh-keygen -t rsa -N '' -f id_rsa
sudo chown vagrant:vagrant id_rsa*
sshpass -p vagrant ssh-copy-id -i /home/vagrant/.ssh/id_rsa vagrant@192.168.100.10
ssh 192.168.100.10 "sshpass -p vagrant ssh-copy-id -i /home/vagrant/.ssh/id_rsa vagrant@192.168.100.11"
