#!/bin/bash

sudo apt install mariadb-server pacemaker corosync pcs -y
sudo cp /vagrant/50-server-sql.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

if [ "$(ls -A /cluster/sql)" ]; then
    sleep 5
else
    sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/cluster/sql
    sudo chmod -R 777 /cluster/sql
fi

sudo cp /vagrant/corosync-sql.conf /etc/corosync/corosync.conf
sudo systemctl enable --now corosync pacemaker pcsd
sudo pcs resource create mariadb systemd:mariadb op monitor interval=1s
sudo pcs property set stonith-enabled=false
sudo pcs resource create virtualip ocf:heartbeat:IPaddr2 ip=192.168.79.110 cidr_netmask=24 op monitor interval=1s
sudo pcs constraint colocation add mariadb with virtualip INFINITY --force
sudo pcs resource update mariadb meta migration-threshold=0
sudo pcs resource update virtualip meta migration-threshold=0
sudo systemctl restart corosync pacemaker pcsd