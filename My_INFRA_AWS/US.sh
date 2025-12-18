#!/bin/bash
set -ux

LOG=/var/log/user-data.log
exec > >(tee -a $LOG) 2>&1

# Update
apt-get update -y

# Install Node.js + git
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt-get install -y nodejs git

# Create base directory
mkdir -p /var/www/node-app
cd /var/www/node-app

# Clone repo (MAKE SURE THIS URL IS CORRECT)
git clone https://gitlab.com/my_project_group6773350/okok.git



# Move into app directory
cd /var/www/node-app/okok/My_APP

# IMPORTANT: package.json MUST be here
ls -l

# Install dependencies
npm install --production

# Fix permissions
chown -R ubuntu:ubuntu /var/www/node-app

# Create systemd service
cat <<EOF >/etc/systemd/system/node-app.service
[Unit]
Description=Node.js App
After=network.target

[Service]
User=ubuntu
WorkingDirectory=/var/www/node-app/okok/My_APP
ExecStart=/usr/bin/node app.js
Restart=always
RestartSec=5
Environment=NODE_ENV=production


[Install]
WantedBy=multi-user.target
EOF

# Reload & start
systemctl daemon-reload
systemctl enable node-app
systemctl start node-app

