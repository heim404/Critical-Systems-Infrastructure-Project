#!/bin/bash
echo '192.168.79.122:/storage/www /cluster/www glusterfs defaults,_netdev 0 0' | sudo tee -a /etc/fstab
sudo mount -a
sudo update-initramfs -u