#!/bin/bash

sudo echo '192.168.79.122:/storage/sql /cluster/sql glusterfs defaults,_netdev 0 0' | sudo tee -a /etc/fstab
sudo mount -a
sudo update-initramfs -u