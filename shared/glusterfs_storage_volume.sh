#!/bin/bash
STORAGE_WEB=/raid1/cluster
VOLUME=storage
WEB1=192.168.79.121
WEB2=192.168.79.122
sudo gluster peer probe $WEB1
sudo gluster peer probe $WEB2
sudo gluster volume create $VOLUME replica 2 $WEB1:$STORAGE_WEB $WEB2:$STORAGE_WEB force
yes | sudo gluster volume start $VOLUME 
