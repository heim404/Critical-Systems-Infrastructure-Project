#!/bin/bash
sudo apt install ganglia-monitor -y
sudo cp /vagrant/gmond.conf /etc/ganglia/gmond.conf
sudo systemctl restart ganglia-monitor
sudo systemctl enable ganglia-monitor