#!/bin/bash
sudo apt install nginx -y
sudo systemctl enable nginx
sudo mkdir -p /cluster/www
sudo cp /var/www/html/index.nginx-debian.html /cluster/www/index.html
sudo chown -R www-data:www-data /cluster/www  
sudo chmod -R 755 /cluster/www
sudo sed -i 's|root /var/www/html;|root /cluster/www;|' /etc/nginx/sites-available/default
sudo systemctl restart nginx
