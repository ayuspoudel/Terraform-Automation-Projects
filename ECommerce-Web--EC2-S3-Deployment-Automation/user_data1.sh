#!/bin/bash
# Update the package list
apt update

# Install Apache
apt install -y apache2

# Install AWS CLI (if you plan to use it for downloading resources)
apt install -y awscli

# Start Apache and enable it on boot
systemctl start apache2
systemctl enable apache2

# Define the web directory where Apache serves files
WEB_DIR="/var/www/html"

# Clear any default files from the Apache web root
rm -rf $WEB_DIR/*

# Copy your E-Commerce website files to the web directory
mkdir -p $WEB_DIR
cp -r E-Commerce-Website/* $WEB_DIR

# Adjust permissions to ensure Apache can serve these files
chown -R www-data:www-data $WEB_DIR
chmod -R 755 $WEB_DIR

# Create a simple HTML file with the instance metadata (Optional)
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
cat <<EOF > $WEB_DIR/info.html
<!DOCTYPE html>
<html>
<head>
  <title>Instance Info</title>
</head>
<body>
  <h1>Instance ID: <span style="color:green">$INSTANCE_ID</span></h1>
</body>
</html>
EOF

# Restart Apache to make sure everything is loaded correctly
systemctl restart apache2
