#!/bin/bash
# === Automated Kubernetes (Minikube) Deployment ===

set -e

# Log output
exec > >(tee /var/log/deploy.log|logger -t user-data -s 2>/dev/console) 2>&1

# --- Install dependencies ---
apt update -y
apt install -y curl apt-transport-https docker.io conntrack git openjdk-17-jdk maven

systemctl enable docker
systemctl start docker
usermod -aG docker ubuntu

# --- Install Minikube & kubectl ---
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
install minikube-linux-amd64 /usr/local/bin/minikube
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install kubectl /usr/local/bin/kubectl

# --- Start Minikube ---
minikube start --driver=docker --force

# --- Clone your GitHub repo ---
cd /home/ubuntu
git clone https://github.com/saifahmed2003/library-java17-mysql-app.git
cd library-java17-mysql-app

# --- Build your application Docker image inside Minikube ---
eval $(minikube -p minikube docker-env)
docker build -t library-java17-mysql-app:latest ./LibraryProject2

# --- Apply Kubernetes manifests ---
kubectl apply -f k8s/mysql-deployment.yaml
sleep 20
kubectl apply -f k8s/app-deployment.yaml

# --- Enable access to NodePort (5000 mapped to 30000) ---
echo "App will be reachable at http://$(curl -s ifconfig.me):30000/web/authors" > /home/ubuntu/deploy-info.txt

# --- Launch Minikube and services on reboot automatically ---
echo "@reboot sudo minikube start --driver=docker --force && sleep 30 && kubectl apply -f /home/ubuntu/library-java17-mysql-app/k8s/" | crontab -