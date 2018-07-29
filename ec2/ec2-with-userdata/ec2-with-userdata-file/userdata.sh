#!/bin/bash
yum install httpd -y
chmod 775 -R /var/www
echo "hello from terraform" > /var/www/html/index.html
service httpd start
