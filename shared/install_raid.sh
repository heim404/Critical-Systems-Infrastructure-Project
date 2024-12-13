#!/bin/bash
sudo apt install mdadm -y
sudo mdadm --create /dev/md0 --level=1 --raid-devices=2 /dev/sdc /dev/sdd -R
sudo update-initramfs -u
sudo mdadm --detail --scan | sudo tee -a /etc/mdadm/mdadm.conf
sudo mkfs.ext4 /dev/md0
sudo mkdir /raid1
sudo mount /dev/md0 /raid1
echo '/dev/md0 /raid1 ext4 defaults 0 0' | sudo tee -a /etc/fstab