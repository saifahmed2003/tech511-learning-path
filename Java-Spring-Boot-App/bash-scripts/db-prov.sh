#!/bin/bash
# ===== Library Database setup =====
exec > /var/log/user-data.log 2>&1
set -e

apt update -y
apt install -y mysql-server git

systemctl enable mysql
systemctl start mysql

# Allow external DB connections
sed -i "s/^bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
sed -i "s/^mysqlx-bind-address.*/mysqlx-bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
systemctl restart mysql

# Create root user/password and grant remote privileges
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'root';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;"

# Clone repo and seed DB
cd /home/ubuntu
git clone https://github.com/saifahmed2003/library-java17-mysql-app.git
mysql -uroot -proot -e "CREATE DATABASE IF NOT EXISTS library;"
mysql -uroot -proot library < /home/ubuntu/library-java17-mysql-app/library.sql