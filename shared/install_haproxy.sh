#!/bin/bash
sudo apt install haproxy corosync pacemaker pcs -y
sudo cp /vagrant/corosync-haproxy.conf /etc/corosync/corosync.conf
sudo cp /vagrant/haproxy.cfg /etc/haproxy/haproxy.cfg
sudo systemctl enable --now corosync pacemaker pcsd
sudo pcs resource create haproxy systemd:haproxy op monitor interval=1s
sudo pcs property set stonith-enabled=false
sudo pcs resource create virtualip ocf:heartbeat:IPaddr2 ip=172.20.79.1 cidr_netmask=24 op monitor interval=1s
sudo pcs constraint colocation add haproxy with virtualip INFINITY
sudo pcs resource update haproxy meta migration-threshold=0
sudo pcs resource update virtualip meta migration-threshold=0
sudo systemctl restart corosync pacemaker pcsd
