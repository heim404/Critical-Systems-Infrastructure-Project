#!/bin/bash
sudo apt install glusterfs-server glusterfs-client -y
sudo systemctl enable --now glusterd
sudo mkdir -p /raid1/cluster/www
sudo mkdir -p /raid1/cluster/sql