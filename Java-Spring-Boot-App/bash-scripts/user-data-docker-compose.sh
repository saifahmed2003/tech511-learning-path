#!/bin/bash
# === Automated Docker Compose deployment (fixed version) ===

set -e

# --- Install dependencies ---
apt update -y
apt install -y docker.io docker-compose git openjdk-17-jdk maven curl

systemctl enable docker
systemctl start docker
usermod -aG docker ubuntu

# --- Log progress for debugging ---
exec > >(tee /var/log/deploy.log|logger -t user-data -s 2>/dev/console) 2>&1

# --- Clone updated GitHub repo ---
cd /home/ubuntu
git clone https://github.com/saifahmed2003/library-java17-mysql-app.git
cd library-java17-mysql-app

# --- Build and start containers ---
docker-compose up -d --build

# --- Auto-start on reboot ---
(crontab -l 2>/dev/null; echo "@reboot cd /home/ubuntu/library-java17-mysql-app && /usr/bin/docker-compose up -d") | crontab -