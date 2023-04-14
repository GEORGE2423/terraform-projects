#!/bin/bash

yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "Hello World from $(hostname -f)" > /var/www/html/index.html
echo "Welcome to Lion Technologies, Testing  tier 2 application layer  $(hostname -f)" > /var/www/html/index.html
