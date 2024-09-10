#!/bin/bash
yum update -y
amazon-linux-extras install nginx1 -y
systemctl start nginx
systemctl enable nginx
mkdir -p /usr/share/nginx/html
aws s3 cp s3://ayush-s3-ecommerce-2024/ /usr/share/nginx/html/ --recursive
