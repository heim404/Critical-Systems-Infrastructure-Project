sudo apt install snmpd snmp libsnmp-dev -y
sudo cp /vagrant/snmpd.conf /etc/snmp/snmpd.conf
sudo systemctl restart snmpd