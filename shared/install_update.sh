#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt install snmpd snmp libsnmp-dev
sudo cp /vagrant/snmpd.conf /etc/snmp/snmpd.conf
sudo systemctl restart snmpd
sudo apt-get install ganglia-monitor -y
sudo cp /vagrant/gmond.conf /etc/ganglia/gmond.conf
sudo systemctl restart ganglia-monitor

