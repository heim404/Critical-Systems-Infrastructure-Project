#!/bin/bash
sudo apt install glusterfs-server glusterfs-client -y
sudo systemctl enable --now glusterd
sudo mkdir -p /cluster/sql