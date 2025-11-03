#!/bin/bash
# ===== Library Application setup =====
exec > /var/log/user-data.log 2>&1
set -e

apt update -y
apt install -y git openjdk-17-jdk maven ufw

adduser --disabled-password --gecos "" ubuntu || true

# Clone repo
cd /home/ubuntu
git clone https://github.com/saifahmed2003/library-java17-mysql-app.git
cd library-java17-mysql-app/LibraryProject2

# Build as non-root to avoid permission problems
sudo -u ubuntu mvn -B -DskipTests clean package

# Create systemd service for auto-start
cat >/etc/systemd/system/libraryapp.service <<EOF
[Unit]
Description=Library Spring Boot App
After=network.target

[Service]
User=ubuntu
WorkingDirectory=/home/ubuntu/library-java17-mysql-app/LibraryProject2
Environment=DB_HOST=jdbc:mysql://<DB_PRIVATE_IP>:3306/library
Environment=DB_USER=root
Environment=DB_PASS=root
ExecStart=/usr/bin/java -jar /home/ubuntu/library-java17-mysql-app/LibraryProject2/target/LibraryProject2-0.0.1-SNAPSHOT.jar
Restart=always
StandardOutput=append:/var/log/libraryapp.log
StandardError=append:/var/log/libraryapp-error.log

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable libraryapp
systemctl start libraryapp